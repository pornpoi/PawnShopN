<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Managetray.aspx.vb" Inherits="Managetray" %>

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
            loadSet();
            //loadTray(); 


            $.ajax({
                type: "POST",
                url: "ajax/PopualateCategory.aspx",
                contentType: "application/json; charset=utf-8",
                data: {},
                dataType : "json",
                success: function(data) {
                    var ddlCategory = $('#dropdowCategory')
                    ddlCategory.empty().append('<option selected="selected" value="0">กรุณาเลือกประเภท</option>');
                    $.each(data, function (key, value) {
                        ddlCategory.append($("<option></option>").val(value.ID).html(value.GroupName));
                    });
                },
                error: function ajaxError(result) {
                    alert(result.status + ":" + result.statusText);
                }

            });

            $('#btnSetTray').click(function () {
                AddTray(); 
            });
        });

        function AddTray() {
            var arr = $('#tableSet tbody tr input:checked').map(function () {
                return $(this).val();
            }).get();

 
            var category = $('#dropdowCategory').val();
            var weight = $('#TotalWeight').val();
            var priceSum = $('#TotalAmt').val();
            var second_Estimate = $('#TotalEstimate').val();

            var data = {
                SetId: arr,
                Category: category,
                Weight: weight,
                PriceSum: priceSum,
                SecondEstimate: second_Estimate
            };

            $.ajax({
                url: "ajax/SetTray.aspx",
                method: "POST",
                data: JSON.stringify(data),
                success: function (data) {
                    loadSet();
                    loadTray();
                }
            });

        }

        function loadTray() {
            $.ajax({
                url: "ajax/LoadTray.aspx",
                method: "POST",
                dataType: "json",
                success: function (data) {
                    for (i = 0 ; data.length ; i++) {
                        $('tableTray tbody').append(
                            "<tr>" +
                                "<td style='text-align:center;display: none'>" + data[i].ID + "</td>" +
                                "<td style='text-align:center'>" + data[i].ID + "</td>" +
                                "<td style='text-align:center'>" + data[i].ID + "</td>" +
                                "<td style='text-align:center'>" + data[i].ID + "</td>" +
                                "<td style='text-align:center'>" + data[i].ID + "</td>" +
                                "<td style='text-align:center'>" + data[i].ID + "</td>" +
                                "<td style='text-align:center'>" + data[i].ID + "</td>" +
                                "<td style='text-align:center'>" + data[i].ID + "</td>" +
                            "</tr>"
                         );
                    }
                }
            });
        }


        function loadSet() {
            $.ajax({
                url: "ajax/SetAll.aspx",
                method: "POST",
                dataType: "json",
                success: function (data) {
                    for (i = 0 ; i < data.length; i++) {
                        $('#tableSet tbody').append(
                        "<tr>" +
                            "<td style='text-align:center;display: none'>" + data[i].ID + "</td>" +
                            "<td style='text-align:center'>" + data[i].No + "</td>" +
                            "<td style='text-align:center'>" + '' + "</td>" +
                            "<td style='text-align:center'>" + data[i].Name + "</td>" +
                            "<td style='text-align:center' class = 'qty'>" + data[i].Quantity + "</td>" +
                            "<td style='text-align:center' class = 'Weight'>" + data[i].Weight + "</td>" +
                            "<td style='text-align:center' class = 'PriceSum'>" + data[i].PriceSum + "</td>" +
                            "<td style='text-align:center' class = 'SecondEstimate'>" + data[i].SecondEstimate + "</td>" +
                            "<td style='text-align:center'>" + data[i].UserName + "</td>" +
                            "<td style='text-align:center'>" + data[i].DateCreated + "</td>" +
                            "<td style='text-align:center'><input class='chk'  type='checkbox' value = '" + data[i].ID  + "' /></td>" +
                        "</tr>"
                         );
                    }

                    $('input:checkbox').click(function (e) {

                        var cntColumn = 8;
                        for (var i = 6 ; i <= cntColumn ; i++) {
                            findSum(i, i);
                        }
                    });
                }
            });
        }
        function findSum(ColID,index) {
            total = 0;
            $("#tableSet tbody tr:has(:checkbox:checked) td:nth-child(" + ColID + ")").each(function () {
                total += parseFloat($(this).text());
            });

            if (index == 6) {
                $('#TotalWeight').val(total);
            } else if (index == 7) {
                $('#TotalAmt').val(total);
            } else if (index == 8) {
                $('#TotalEstimate').val(total);
            }
        }


        function AlertModal(ModalName) {
            var modalName = "#" + ModalName;
            var modal = UIkit.modal(modalName);

            if (modal.isActive()) {
                modal.hide();
            } else {
                modal.show();
            }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="uk-form">
        <br /><br />
        <b>จัดถาด</b><br /><hr />
        <select id="dropdowCategory" name="DropdownCategory"></select>
        <input id="btnSetTray" type="button" class="uk-button uk-button-primary" value="จัดถาด" style="color:#ffffff"/>
        <table id="tableSet" class="uk-table" border="1">
            <thead>
                <tr>
                    <th style="text-align: center; display: none">ID</th>
                    <th style="text-align: center">เลขชุด</th>
                    <th style="text-align: center">ประเภทชุด</th>
                    <th style="text-align: center">สาขา</th>
                    <th style="text-align: center">จำนวนสิ่ง</th>
                    <th style="text-align: center">น้ำหนัก</th>
                    <th style="text-align: center">ราคารับจำนำรวม(บาท)</th>
                    <th style="text-align: center">ราคาประเมินรวมล่าสุด(บาท)</th>
                    <th style="text-align: center">ผู้ทำการจัดชุด</th>
                    <th style="text-align: center">วันที่ทำการจัดชุด</th>
                    <th style="text-align: center">เลือก</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
            <tfoot>
                <tr>
                    <td colspan="4" style="text-align: center"><b>รวม</b></td>
                    <td style="text-align: center"><input type="text" id="TotalWeight" class="uk-form-width-medium " /></td>
                    <td style="text-align: center"><input type="text" id="TotalAmt" class="uk-form-width-medium"/></td>
                    <td style="text-align: center"><input type="text" id="TotalEstimate" class="uk-form-width-medium" /></td>
                </tr>
            </tfoot>
        </table>
        <br />
        <br />
        <b>ถาดที่จัดไว้แล้ว</b><br />
        <hr />
        <table id="tableTray" class="uk-table" border="1">
            <thead>
                <tr>
                    <th style="text-align: center">เลขถาด</th>
                    <th style="text-align: center">ประเภทถาด</th>
                    <th style="text-align: center">ราคารวม</th>
                    <th style="text-align: center">ราคาประเมินล่าสุด</th>
                    <th style="text-align: center">สาขา</th>
                    <th style="text-align: center">แก้ไข</th>
                    <th style="text-align: center">ยกเลิกถาด</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>

    </div>
    </form>
</body>
</html>
