<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SetAsset.aspx.vb" Inherits="SetAsset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/uikit.min.js" type="text/javascript"></script>

    <script src="js/components/notify.min.js"></script>
    <link href="css/uikit.min.css" rel="stylesheet" type="text/css" />
    <link href="css/GridStyle.css" rel="stylesheet" />
    <title>::ระบบจัดการทรัพย์หลุด::</title>

    <script type="text/javascript">

        $(document).ready(function () {
            $('#totalQty').val(0);
            $('#totalWeight').val(0);
            $('#totalAmt').val(0);
            $('#totalEstimate').val(0);
            $('#setEdit').hide();
            loadSet();

            $('#closeEdit').click(function () {
                $('#setEdit').hide();
            });


            $.ajax({
                type: "POST",
                url: "ajax/PopulateProductType.aspx",
                contentType: "application/json; charset=utf-8",
                data: {},
                dataType: "json",
                success: function (data) {
                    var ddlCategory = $('#dropdowCate')
                    ddlCategory.empty().append('<option selected="selected" value="0">กรุณาเลือกประเภท</option>');
                    $.each(data, function (key, value) {
                        ddlCategory.append($("<option></option>").val(value.ProductTypeId).html(value.Name));
                    });
                },
                error: function ajaxError(result) {
                    alert(result.status + ":" + result.statusText);
                }

            });


        });
        
        


        function AlertModal(ModalName) {
            var modalName = "#" + ModalName;
            var modal = UIkit.modal(modalName);

            if (modal.isActive()) {
                modal.hide();
            } else {
                modal.show();
            }
        }

        function alertModalSelect() {
            AlertModal("modalSelectBefore");
        }

        function AddTicket() {
            var ticketId = $('#txtTicketNumber').val().trim();
            var arr = $('#tableData tbody tr').find('td:first').map(function () {
                return $(this).text()
            }).get();

            if (ticketId == "") {
                $('#lblAlert').text("กรุณากรอกเลขตั๋ว");
                AlertModal("modalAlertSuccess");
                return;
            }

            var fLen = arr.length;
            for (i = 0; i < fLen; i++) {
                if (arr[i] == ticketId) {
                    $('#lblAlert').text("มีตั๋วนี้อยู่แล้ว");
                    AlertModal("modalAlertSuccess");
                    return; 
                }
            }

            data = "TicketID=" + ticketId;
            $.ajax({
                type: "POST",
                url: "ajax/BeforSet.aspx",
                data: data,
                dataType: "json",
                success: function (data) {
                    $('#tableData tbody').append(
                        "<tr>" +
                            "<td style='text-align:center'>" + data[0].TicketId + "</td>" +
                            "<td style='text-align:center'>" + data[0].TicketNo + "</td>" +
                            "<td style='text-align:center'>" + data[0].BookNo + "</td>" +
                            "<td class = 'qty' style='text-align:center' >" + data[0].Quantity + "</td>" +
                            "<td class = 'weight' style='text-align:center' >" + data[0].Weight + "</td>" +
                            "<td class = 'amount' style='text-align:center' >" + data[0].Amount + "</td>" +
                            "<td class = 'estimate' style='text-align:center' >" + data[0].Estimate + "</td>" +
                            "<td>" + "<input id='btnDelete' type='button' class='del uk-button uk-button-primary' style='color:#ffffff' value = 'ลบข้อมูล' onClick='deleteRow(this)'/>" + "</td>" +
                        "</tr>"
                        );

                    deleteRow = function (element) {
                        $(element).parent().parent().remove();
                        loadSum();
                    }
                    loadSum();

                }
            });

        }

        function loadSum() {
            $(document).ready(function () {
                var sumQty = 0;
                var sumWeight = 0;
                var sumAmt = 0;
                var sumEstimate = 0;

                $('.qty').each(function () {
                    var value = parseFloat($(this).text().replace(/[^0-9]/g, ''));
                    if (!isNaN(value) && value.length != 0) {
                        sumQty += parseFloat(value);
                    }
                });

                $('.weight').each(function () {
                    var value = parseFloat($(this).text().replace(/[^0-9]/g, ''));
                    if (!isNaN(value) && value.length != 0) {
                        sumWeight += parseFloat(value);
                    }
                });

                $('.amount').each(function () {
                    var value = parseFloat($(this).text().replace(/[^0-9]/g, ''));
                    if (!isNaN(value) && value.length != 0) {
                        sumAmt += parseFloat(value);
                    }
                });

                $('.estimate').each(function () {
                    var value = parseFloat($(this).text().replace(/[^0-9]/g, ''));
                    if (!isNaN(value) && value.length != 0) {
                        sumEstimate += parseFloat(value);
                    }
                });

                $('#totalQty').val(sumQty);
                $('#totalWeight').val(sumWeight);
                $('#totalAmt').val(sumAmt);
                $('#totalEstimate').val(sumEstimate);

            });
        }


        function AddSet() {
            var arr = $('#tableData tbody tr').find('td:first').map(function () {
                return $(this).text()
            }).get();

            var totalQty = $('#totalQty').val();
            var totalweight = $('#totalWeight').val();
            var totalAmt = $('#totalAmt').val();
            var totalEstimate = $('#totalEstimate').val();

            var data = {
                Tickets: arr,
                qty : totalQty , 
                weight : totalweight,
                amt :  totalAmt,
                estimate: totalEstimate
            };

            if (totalQty == 0.00 || totalAmt == 0.00 || totalEstimate == 0.00) {
                $('#lblAlert').text("กรุณาตรวจสอบข้อมูลผลรวม");
                AlertModal("modalAlertSuccess");

            } else {
                $.ajax({
                    url: "ajax/SetAsset.aspx",
                    method: "POST",
                    data: JSON.stringify(data),
                    success :  function(data){
                        $('#showSet').html(data);
                    }
                });
            }

            loadSet();
        }

        function commaSeparateNumber(val) {
            while (/(\d+)(\d{3})/.test(val.toString())) {
                val = val.toString().replace(/(\d+)(\d{3})/, '$1' + ',' + '$2');
            }
            return val;
        }
        function loadSet() {
            $.ajax({
                url: "ajax/SetAll.aspx",
                method: "POST",
                dataType : "json",
                success: function (data) {
                    for (i = 0 ; i < data.length; i++) {
                        $('#tableSet tbody').append(
                        "<tr>" +
                            "<td style='text-align:center;display: none'>" + data[i].ID + "</td>" +
                            "<td style='text-align:center'>" + data[i].No + "</td>" +
                            "<td style='text-align:center'>" + '' + "</td>" +
                            "<td style='text-align:center'>" + data[i].Name + "</td>" +
                            "<td style='text-align:center'>" + data[i].Quantity + "</td>" +
                            "<td style='text-align:center'>" + data[i].Weight + "</td>" +
                            "<td style='text-align:center'>" + data[i].PriceSum + "</td>" +
                            "<td style='text-align:center'>" + data[i].SecondEstimate + "</td>" +
                            "<td style='text-align:center'>" + data[i].UserName + "</td>" +
                            "<td style='text-align:center'>" + data[i].DateCreated + "</td>" +
                            "<td style='text-align:center'><input type='button' value='แก้ไขชุด' class='uk-button uk-button-primary' onclick=\"EditSet('" + data[i].ID + "')\"/> </td>" +
                        "</tr>"
                         );
                    }
                }
            });
        }

        function EditSet(eventid) {
            $('#setEdit').show();

            loadSetChild(eventid); 

        }

        function loadSetChild(SetNo) {

            $('#tableChild tbody').empty();
           
            var data = "SetNo=" + SetNo;
            $.ajax({
                url: "ajax/LoadChild.aspx",
                method: "POST",
                data: data,
                dataType:  "json",
                success: function (data) {
                    for (i = 0 ; i < data.length; i++) {
                        $('#tableChild tbody').append(
                        "<tr>" +
                            "<td style='text-align:center;display: none'>" + data[0].SetID + "</td>" +
                            "<td style='text-align:center'>" + data[0].TicketId + "</td>" +
                            "<td style='text-align:center'>" + data[0].Username + "</td>" +
                            "<td>" + "<input id='btnDelete' type='button' class='del uk-button uk-button-danger' style='color:#ffffff' value = 'ลบข้อมูล' onClick='deleteRow(this)'/>" + "</td>" +
                        "</tr>"
                        );
                    }
                }
            });
        }
        function DeleteChild(SetID) {
            data = "SetID=" + SetID;
            $.ajax({
                url: "ajax/DeleteChild.aspx",
                data: data,
                method: "POST",
                success: function (data) {
                    loadSetChild(SetID); 
                }
            });
        }
        function AddChild(SetID, TicketId, Username) {
            data = "SetID=" + SetID + "&TicketId=" + TicketId + "&Username=" + Username;
            $.ajax({
                url: "ajax/AddChild.aspx",
                data: data,
                method: "POST",
                success: function (data) {
                    loadSetChild(SetID);
                }
            });
        }
        function DeleteSet(SetID) {
            data = "SetID=" + SetID;
            $.ajax({
                url: "ajax/DeleteSet.aspx",
                data: data,
                method: "POST",
                success: function (data) {
                    loadSet();
                }
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hddBranch" runat="server" />
        <asp:HiddenField ID="hddMonth" runat="server" />
        <asp:HiddenField ID="hddYear" runat="server" />

        <asp:Panel ID="panelInsertSet" runat="server" Visible="true">
            <div class="uk-form">
                <table class="uk-table uk-table-condensed">
                    <tr>
                        <td>
                            <b>เลขตั๋ว</b>
                        </td>
                        <td>
                            <input type="text" id="txtTicketNumber" />
                            <input type="button" value="add" class="uk-button uk-button-success" onclick="AddTicket()" style="color:#ffffff" />             
                        </td>
                    </tr>
                    <tr>
                        <td><b>ประเภทชุด</b></td>
                        <td>
                            <select id="dropdowCate" name="DropdownCategory"></select>
                            <input type="button" value="จัดชุด" class="uk-button uk-button-success" onclick="AddSet()" style="color: #ffffff" />
                        </td>
                    </tr>
                    <tr>
                        <td>

                        </td>
                        <td>
                            
                        </td>
                    </tr>
                </table>
                <table id="tableData" class="uk-table" border="1">
                    <thead>
                        <tr>
                            <th style="text-align: center">เลขตั๋ว</th>
                            <th style="text-align: center">เลขที่</th>
                            <th style="text-align: center">เล่มที่</th>
                            <th style="text-align: center">จำนวน</th>
                            <th style="text-align: center">น้ำหนัก(กรัม)</th>
                            <th style="text-align: center">ราคารับจำนำ(บาท)</th>
                            <th style="text-align: center">ราคาประเมิน(บาท)</th>
                            <th style="text-align: center">ลบ</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td style="text-align: center"><b>รวม</b></td>
                            <td></td>
                            <td></td>
                            <td style="text-align: center">
                                <input id="totalQty" type="text" />
                            </td>
                            <td style="text-align: center">
                                <input id="totalWeight" type="text" />
                            </td>
                            <td style="text-align: center">
                                <input id="totalAmt" type="text" />
                            </td>
                            <td style="text-align: center">
                                <input id="totalEstimate" type="text" />
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </asp:Panel>
        <br />
        <br />

        <div id="setEdit" class="uk-form">
            <b>รายการชุดที่แก้ไข</b>
            <input type="hidden" id="hUsername" />
            <input type="hidden" id="hSetID" />
            <input type="hidden" id="hTicketId" />
            <br /><hr />
            <table id="tableSetEdit" class="uk-table">
                <tr>
                    <td>
                        <b>เลขชุด</b>
                    </td>
                    <td>
                        <label id="lblSetNo"></label>
                    </td>
                    <td>
                        <b>สาขา</b>
                    </td>
                    <td>
                        <label id="lblBranch"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>ราคารับจำนำรวม</b>
                    </td>
                    <td>
                        <input type="text" id="PriceSum"/>
                    </td>
                    <td>
                        <b>ราคาประเมิน</b>
                    </td>
                    <td>
                        <input type="text" id="PriceEstimate" />
                    </td>
                    <td>
                        <b>ราคาประเมินรวมล่าสุด</b>
                    </td>
                    <td>
                        <input type="text" id="PriceEstimateNew" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>เพิ่มตั่ว</b>
                    </td>
                    <td>
                        <input type="text" id="txtAddTicketOnEvent" />
                        <input id="AddTicketOnEvnet" type="button" value="+" class="uk-button uk-button-primary" style="color:#ffffff"/>
                    </td>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td> 
                        <table id="tableChild" class="uk-table" border="1">
                           <thead>
                               <tr>
                                   <td style="text-align: center;display: none">EventID</td>
                                   <td style="text-align: center">เลขตั๋ว</td>
                                   <td style="text-align: center">ผู้ทำรายการ</td>
                                   <td style="text-align: center">ลบ</td>
                               </tr>
                           </thead>
                           <tbody>

                           </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td>
                        <input type="button" class="uk-button uk-button-success" value="ยืนยันการแก้ไข" style="color:#ffffff"/>
                        
                    </td>
                    <td>
                        <input id="closeEdit" type="button" class="uk-button uk-button-danger " value="ปิดการแก้ไข" style="color:#ffffff"/>
                    </td>
                </tr>
            </table>
        </div>

        <b>รายการชุดที่จัดไว้แล้ว</b>
        <hr />
        <table id="tableSet" class="uk-table" border="1">
            <thead>
                <tr>
                    <th style="text-align: center ;display: none">ID</th>
                    <th style="text-align: center">เลขชุด</th>
                    <th style="text-align: center">ประเภทชุด</th>
                    <th style="text-align: center">สาขา</th>
                    <th style="text-align: center">จำนวนสิ่ง</th>
                    <th style="text-align: center">ราคารับจำนำรวม</th>
                    <th style="text-align: center">ราคาประเมิน</th>
                    <th style="text-align: center">ราคาประเมินรวมล่าสุด</th>
                    <th style="text-align: center">ผู้ทำรายการ</th>
                    <th style="text-align: center">วันที่ทำการจัดชุด</th>
                    <th style="text-align: center">แก้ไข</th>
                    <th style="text-align: center">ลบ</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <br /><br /><br /><br /><br />             
    <div class="uk-modal" id="modalAlertSuccess">
        <div class="uk-modal-dialog">
            <div class="uk-modal-header uk-alert-success">แจ้งเตือน</div>
            <asp:Label ID="lblAlert" runat="server"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
