<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BuyDay2.aspx.vb" Inherits="AuctionArea_BuyDay2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="../Bootstrap/Content/bootstrap.css" rel="stylesheet" />
    <link href="../Bootstrap/Content/font-awesome.min.css" rel="stylesheet" />
    <script src="../Bootstrap/Scripts/jquery-3.1.1.js" type="text/javascript"></script>
    <script src="../Bootstrap/Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Bootstrap/Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Bootstrap/Scripts/moment.js"></script>
    <script src="../Bootstrap/Scripts/datepicker-thai/bootstrap-datepicker.js"></script>
    <script src="../Bootstrap/Scripts/datepicker-thai/bootstrap-datepicker-thai.js"></script>
    <script src="../Bootstrap/Scripts/datepicker-thai/locales/bootstrap-datepicker.th.js"></script>
    <link href="../Bootstrap/css/pagination_ys.css" rel="stylesheet" />
    <link href="../Bootstrap/css/datapicker/datepicker3.css" rel="stylesheet" />
    <link href="../Bootstrap/css/Grid.css" rel="stylesheet" />



</head>
<body>
    <form id="form1" runat="server">
        <header class="page-header">
            <h3 class="uk-h3"><i class="fa fa-file-text-o " aria-hidden="true"></i>&nbsp;ประกาศการขายทรัพย์หลุด</h3>
    </header>

        <asp:HiddenField ID="hiddenRole" runat="server" />
        <%--<input type='button' id="btnAdd" data-target="#modalAlert" value='เพิ่มประกาศ' style='color:#000000' class='btn btn-success' />--%>

        <button type="button" class="btn btn-success " data-toggle="modal" data-target="#modalAddEvent" id="btnAdd" style="margin-bottom: 10px;"><i class="fa fa-plus-circle" aria-hidden="true"></i>&nbsp;เพิ่มประกาศ</button>

        <table id="tableData" class="table table-striped table-bordered table-hover" border="1" style="width: 1024px">
            <thead>
                <tr>
                    <th style="text-align: center">ลำดับ</th>
                    <th style="text-align: center; display: none">EventID</th>
                    <th style="text-align: center" width="50px">ประกาศ</th>
                    <th style="text-align: center" width="300px">วันเดือนปี</th>
                    <th style="text-align: center" width="400px">ประเภททรัพย์หลุดจำนำ</th>
                    <th style="text-align: center" width="200px">สถานที่จำหน่าย</th>
                    <th style="text-align: center">เวลา</th>
                    <th style="text-align: center" width="500px">จากสถานธนานุบาลฯ</th>
                    <th style="text-align: center" width="10px">จัดการ</th>
                    <th style="text-align: center">ปรับปรุง</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>

        <div id="modalAlert" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg ">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">รายการ</h4>
                    </div>
                    <div class="modal-body">
                        <p>ทำรายการเรียบร้อย</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <div id="modalConfirm" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog modal-lg ">
                <div class="modal-body">
                    <div class="modal-dialog">
                        <div class="page-header">ลบประกาศ</div>
                        ต้องการปิดประกาศลงหรือไม่?
                    <div class="modal-footer" align="right">
                        <input type='button' id="BtnCancelYES" value='ตกลง' style='color: #000000' class='btn btn-primary' />
                        <input type='button' id="BtnCancelNO" value='ยกเลิก' style='color: #000000' class='btn btn-danger' data-dismiss="modal" />
                    </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="modalAddEvent" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg ">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">ประกาศทรัพย์หลุด</h4>
                    </div>
                    <div class="modal-body">

                        <table class="uk-table uk-table-condensed">
                            <tr>
                                <td>วันที่
                                </td>
                                <td>
                                    <div>
                                        <input id="txtDateEvent" type="text" data-uk-datepicker="{format:'YYYY-MM-DD'}" class='form-control' />
                                        <%--<input id="txtDateEvent" type="text" />--%>
                                    </div>
                                </td>
                                <td>เวลา</td>
                                <td>
                                    <asp:DropDownList ID="ddlTime" runat="server" class='form-control '>
                                        <asp:ListItem Value="00:00"></asp:ListItem>
                                        <asp:ListItem Value="01:00"></asp:ListItem>
                                        <asp:ListItem Value="02:00"></asp:ListItem>
                                        <asp:ListItem Value="03:00"></asp:ListItem>
                                        <asp:ListItem Value="04:00"></asp:ListItem>
                                        <asp:ListItem Value="05:00"></asp:ListItem>
                                        <asp:ListItem Value="06:00"></asp:ListItem>
                                        <asp:ListItem Value="07:00"></asp:ListItem>
                                        <asp:ListItem Value="08:00"></asp:ListItem>
                                        <asp:ListItem Value="09:00"></asp:ListItem>
                                        <asp:ListItem Value="10:00"></asp:ListItem>
                                        <asp:ListItem Value="11:00"></asp:ListItem>
                                        <asp:ListItem Value="12:00"></asp:ListItem>
                                        <asp:ListItem Value="13:00"></asp:ListItem>
                                        <asp:ListItem Value="14:00"></asp:ListItem>
                                        <asp:ListItem Value="15:00"></asp:ListItem>
                                        <asp:ListItem Value="16:00"></asp:ListItem>
                                        <asp:ListItem Value="17:00"></asp:ListItem>
                                        <asp:ListItem Value="18:00"></asp:ListItem>
                                        <asp:ListItem Value="19:00"></asp:ListItem>
                                        <asp:ListItem Value="20:00"></asp:ListItem>
                                        <asp:ListItem Value="21:00"></asp:ListItem>
                                        <asp:ListItem Value="22:00"></asp:ListItem>
                                        <asp:ListItem Value="23:00"></asp:ListItem>
                                    </asp:DropDownList>
                                    <%--<div class="uk-form"> 
                                    <input id="txtTimeEvent" type="text" data-uk-timepicker="{format:'12h'}" runat="server" />
                                </div>--%>
                                </td>
                            </tr>
                            <tr>
                                <td>รายละเอียดสถานที่
                                </td>
                                <td>
                                    <%--<input id="txtEventNo" type="text" class="uk-form-width-medium" runat="server" />--%>
                                    <asp:TextBox ID="txtLocation" class="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>เลขประกาศ
                                </td>
                                <td>
                                    <input id="txtEventNo" type="text" class="form-control" runat="server" />
                                    <%--  <asp:TextBox ID="txtEventNo" class="uk-form-width-medium" runat="server"></asp:TextBox>--%>
                                </td>
                            </tr>
                            <tr>
                                <td>ประเภททรัพย์
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropProduct" runat="server" class='form-control'>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <div class="page-header">
                            <h3><i class="fa fa-home" aria-hidden="true"></i>&nbsp;สาขา</h3>
                        </div>
                        <div id="branchBlg">
                            <div class="form-group row">
                                <label class="control-label col-sm-2" for="email">สาขาที่ 1:</label>
                                <div class="col-sm-10" id="brhBlg0">
                                    <%--<input type="text" class="form-control" id="commit0" placeholder="ประธานกรรมการ">--%>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-offset-2 col-sm-10">
                                <a href="#" class="btn btn-success" id="addBranch">
                                    <i class="fa fa-plus-circle" aria-hidden="true"></i>&nbsp;เพิ่มสาขา</a>
                                <a href="#" class="btn btn-danger" id="removeBranch">
                                    <i class="fa fa-minus-circle" aria-hidden="true"></i>&nbsp;ลดสาขา</a>

                            </div>
                        </div>
                        <div class="row">&nbsp;</div>
                    </div>
                    <div class="modal-footer" align="right">
                        <%--<asp:Button runat="server" ID="btnConfirm" Text="ยืนยันการเพิ่มข้อมูล" class="uk-button uk-button-danger"  />--%>
                        <input type='button' id="btnAddEvent" value='เพิ่มประกาศ' style='color: #000000' class='btn btn-primary' />
                        <button class="btn btn-info" id="btnUpdateEvent"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp;อัพเดทข้อมูล</button>
                        <%--<input type='button' id="BtnCancelA" value='ยกเลิก' style='color:#000000' class='btn btn-default' data-dismiss="modal" />--%>
                        <button id="BtnCancelA" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <%--<button class="uk-button uk-button-danger">ยืนยันการบันทึกรายการ</button>--%>
                    </div>

                </div>
            </div>
            <div id="ManageCommit">
            </div>
        </div>

    </form>
</body>


<script type="text/javascript">
    var branchNum = 0;
    var vEventID = 0;
    var gEventID = "";
    $(document).ready(function () {

        innerDrw(0, "branch", -1);
        loadDataEventAll()
        getProduct();

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

    $("#btnAddEvent").click(function () {

        AddEvent();
        //getRowBranch("TEST");
    });

    function Btnupdate(EventID) {
        vEventID = EventID;

        //getProduct();
        //AlertModal("modalAddEvent");
        $('#modalAddEvent').modal('show');
        $("#btnAddEvent").hide();
        $("#btnUpdateEvent").show();
        getDataEvent(vEventID);
        editRow(vEventID);
    }

    $('#btnUpdateEvent').click(function () {
        deleteBranch();
        UpdateEvent();
        getRowBranch(vEventID);
        AlertModal("modalAlert");
        loadDataEventAll();
    });

    $("#BtnCancelYES").click(function () {
        CancelEvent(vEventID);
        deleteBranch(vEventID);
        AlertModal("modalAlert");
        loadDataEventAll();

    });
    $("#BtnCancelNO").click(function () {
        loadDataEventAll();
    });


    $('#btnAdd').click(function () {
        //AlertModal("modalAddEvent");
        $("#btnAddEvent").show();
        $("#btnUpdateEvent").hide();
        $('#txtDateEvent').val('');
        $('#ddlTime').val(0);
        $('#txtLocation').val('');
        $('#txtEventNo').val('');
        $('#DropProduct').val(0);
        //getProduct();

    });

    $("#addBranch").click(function () {
        branchNum++;
        addBranchRow(branchNum, -1);
    });

    $("#removeBranch").click(function () {
        if (branchNum > 0) {
            removeBranchRow(branchNum)
            branchNum--;
        }
    });

    //สำหรับสร้าง dropdownList
    function innerDrw(num, type, Id) {
        $.ajax({
            url: "./AuctionArea/Committee_ajax.aspx",
            data: "num=" + num + "&type=" + type + "&Id=" + Id,
            method: "POST",
            beforeSend: function () {
                if (type == "committ") {
                    $("#drlBlg" + num).html('<i class="fa fa-spinner fa-spin"></i>');
                } else {
                    $("#brhBlg" + num).html('<i class="fa fa-spinner fa-spin"></i>');
                }
            },
            success: function (data) {
                if (type == "committ") {
                    $("#drlBlg" + num).html(data);
                } else {
                    $("#brhBlg" + num).html(data);
                    //alert(data);
                }
            }
        });
    }

    function addBranchRow(num, branchId) {

        var comittCont = "<div class=\"form-group row\" id=\"branchNumRow" + num + "\">";
        comittCont += "<label class=\"control-label col-sm-2\" for=\"pwd\">สาขาที่ " + (num + 1) + ":</label>";
        comittCont += "<div class=\"col-sm-10\" id=\"brhBlg" + num + "\">";
        comittCont += "</div>";
        comittCont += "</div>";

        $("#branchBlg").append(comittCont);
        //$('html, body').animate({ scrollTop: $("#branchBlg").offset().top }, 2000);
        innerDrw(num, "branch", branchId);
    }
    function removeBranchRow(num) {
        var element = "#branchNumRow" + num;
        $("" + element + "").remove();
        $('html, body').animate({ scrollTop: $("#branchBlg").offset().top }, 2000);
    }


    function loadDataEventAll() {
        $.ajax({
            type: "POST",
            url: "ajax/ajax_AuctionArea/LoadEventAll.aspx",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                $('#tableData tbody').empty();

                for (i = 0; i < data.length; i++) {
                    $('#tableData tbody').append(
                        "<tr>" +
                            "<td style='text-align:center'>" + (i + 1) + "</td>"
                            + "<td style='text-align:center;display:none;'>" + data[i].EventID + "</td>"
                            + "<td style='text-align:center'>" + data[i].EventNo + "</td>"
                            + "<td style='text-align:center'>" + data[i].fDateEventStart + "</td>"
                            + "<td style='text-align:center'>" + data[i].GroupName + "</td>"
                            + "<td style='text-align:center'>" + data[i].Location + "</td>"
                            + "<td style='text-align:center'>" + data[i].TIME + "</td>"
                            + "<td style='text-align:center'>" + data[i].BranchName + "</td>"
                            + "<td style='text-align:center'><input type='button' value='จัดกรรมการประเมินราคาทรัพย์หลุด' style='color:#000000' class='btn btn-default btn-sm btn-block' onclick=\"ManageCom('" + data[i].EventID + "','" + data[i].EventNo + "','" + data[i].fDateEventStart + "','" + data[i].GroupName + "')\"/>"
                            + "<input type='button' value='จัดกรรมการควบคุมการจำหน่ายทรัพย์หลุด' style='color:#000000' class='btn btn-default btn-sm btn-block' onclick=\"ManageComControl('" + data[i].EventID + "','" + data[i].EventNo + "','" + data[i].fDateEventStart + "','" + data[i].GroupName + "')\"/>"

                            + "<td style='text-align:center'><a href='#'  class='btn btn-primary btn-sm btn-block' onclick=\"Btnupdate('" + data[i].EventID + "')\"><i class='fa fa-pencil' aria-hidden='true'></i>&nbsp;แก้ไข</a>"
                            + "<a href='#' class='btn btn-danger btn-sm btn-block' onclick=\"Btncancel('" + data[i].EventID + "')\"><i class='fa fa-times' aria-hidden='True'></i>&nbsp;ลบ</a></td>" +
                        "</tr>"
                         );
                }

            },
            error: function ajaxError(result) {
                alert(result.status + ":" + result.statusText);
            }
        });
    }

    function ManageCom(EventID, EventNo, DateEventStart, GroupName) {
        //$("#Content").load("AuctionArea/Committtee.aspx?EventID=" + EventID);
        window.open("AuctionArea/Committtee.aspx?EventID=" + EventID + "&EventNo=" + EventNo + "&DateEventStart=" + DateEventStart + "&GroupName=" + GroupName, '_blank', 'toolbar=0,location=0,menubar=0');
        //Console.log(EventID);
    }
    function ManageComControl(EventID, EventNo, DateEventStart, GroupName) {
        //$("#Content").load("AuctionArea/Committtee.aspx?EventID=" + EventID);
        window.open("AuctionArea/CommitteeController.aspx?EventID=" + EventID + "&EventNo=" + EventNo + "&DateEventStart=" + DateEventStart + "&GroupName=" + GroupName, '_blank', 'toolbar=0,location=0,menubar=0');
        //Console.log(EventID);
    }


    function AddEvent() {
        var vDateStartEvent = $('#txtDateEvent').val();
        var vEventNo = $('#txtEventNo').val();
        var vProductType = $('#DropProduct').val();
        var vTime = $('#ddlTime').val();
        var vLocation = $('#txtLocation').val();

        //        alert(vDateStartEvent + "-----" + vEventNo + "-----" + vProductType + "-----" + vTime);
        $.ajax({
            url: "ajax/ajax_AuctionArea/AddEvent.aspx",
            data: "DateStartEvent=" + vDateStartEvent + "&EventNo=" + vEventNo + "&ProductType=" + vProductType + "&Time=" + vTime + "&Location=" + vLocation + "&type=AddEvent",
            method: "POST",
            success: function (data) {

                gEventID = data;
                //alert(gEventID);
                getRowBranch(gEventID);
                loadDataEventAll();
            }

        });
    }

    function editRow(eventId) {
        editRowBranch(eventId);
        //editRowEmp(rowId, eventId);
        $('html, body').animate({ scrollTop: $("#branchBlg").offset().top }, 2000);
    }

    //getRowwwwwwwwBranch
    function editRowBranch(eventId) {
        var result = "";
        $.ajax({
            url: "ajax/ajax_AuctionArea/GetEventBranch.aspx",
            data: "eventId=" + eventId + "&type=getEventBranch",
            method: "POST",
            async: false,
            success: function (data) {
                result = data;
                //alert(data);
            }
        });

        var arr = result.split(',');
        if (branchNum > 0) {
            for (i = branchNum; i > 0; i--) {
                removeBranchRow(i)
                branchNum--;
            }
        }
        //alert(result);
        for (i = 1; i <= arr.length - 1; i++) {
            //alert(arr[i]);
            if (i == 1) {
                innerDrw(i - 1, "branch", arr[i]);
            } else {
                branchNum++;
                addBranchRow(i - 1, arr[i]);
            }
            //innerDrw(i-1, "branch");
        }
    }

    function getRowBranch(gEventID) {
        //ตัวอย่าง สำหรับส่ง data
        //alert(branchNum);
        //var memberTypeId = 0;
        //var rownum = getMaxRowNum();

        for (j = 0; j <= branchNum; j++) {
            //alert($("#commit" + i).val() + "," + $("#branch" + j).val());
            //alert(gEventID, $("#branch" + j).val());
            AddEventBranch(gEventID, $("#branch" + j).val());
        }
    }

    function AddEventBranch(vEventid, vBranchid) {
        $.ajax({
            url: "ajax/ajax_AuctionArea/AddEventBranch.aspx",
            data: "eventid=" + vEventid + "&branchid=" + vBranchid + "&type=AddEventBranch",
            method: "POST",
            success: function (data) {
                //alert(data)

                AlertModal("modalAlert");
                loadDataEventAll();
            }
        });
    }

    function UpdateEvent() {
        var vDateStartEvent = $('#txtDateEvent').val();
        var vEventNo = $('#txtEventNo').val();
        var vProductType = $('#DropProduct').val();
        var vTime = $('#ddlTime').val();
        var vLocation = $('#txtLocation').val();


        //alert(vDateStartEvent + "-----" + vEventNo + "-----" + vProductType + "-----" + vTime);
        $.ajax({
            url: "ajax/ajax_AuctionArea/UpdateEvent.aspx",
            data: "eventid=" + vEventID + "&DateStartEvent=" + vDateStartEvent + "&EventNo=" + vEventNo + "&ProductType=" + vProductType + "&Time=" + vTime + "&Location=" + vLocation + "&type=UpdateEvent",
            method: "POST",
            success: function (data) {
                //alert(data)
                AlertModal("modalAlert");
                loadDataEventAll()
            }

        });

    }
    function deleteBranch() {

        $.ajax({
            url: "ajax/ajax_AuctionArea/DeleteBranchEvent.aspx",
            data: "eventId=" + vEventID + "&type=deleteBranch",
            method: "POST",
            success: function (data) {
                //                    if (data.trim() == "True") {
                //                        //alert("ลบข้อมูลเรียบร้อย");
                //                        //LoadDefault(1);
                //                    } else {
                //                        alert("เกิดความผิดพลาด");
                //                    }
            }
        });



    }

    function CancelEvent(EventID) {
        //        alert(EventID);
        $.ajax({
            url: "ajax/ajax_AuctionArea/CancelEvent.aspx",
            data: "eventId=" + EventID + "&type=CancelEvent",
            method: "POST",
            success: function (data) {
                //alert("Success");

            }

        });
    }

    function getProduct() {
        $.ajax({
            type: "POST",
            url: "ajax/ajax_AuctionArea/GetProductGroup.aspx",
            contentType: "application/json; charset=utf-8",
            data: {},
            dataType: "json",
            success: function (data) {
                var ddlCategory = $('#DropProduct')
                ddlCategory.empty().append('<option selected="selected" value="0">กรุณาเลือกประเภท</option>');
                $.each(data, function (key, value) {
                    ddlCategory.append($("<option></option>").val(value.ID).html(value.GroupName));
                });
            },
            error: function ajaxError(result) {
                //alert(result.status + ":" + result.statusText);
            }

        });
    }
    function getDataEvent(EventID) {

        data = "eventId=" + EventID;
        $.ajax({
            type: "POST",
            url: "ajax/ajax_AuctionArea/GetDataEventAll.aspx",
            data: data,
            dataType: "json",
            success: function (data) {
                //alert(data[0].ProductTypeID);
                $('#txtDateEvent').val(data[0].DateEventStart);
                $('#txtLocation').val(data[0].Location);
                $('#txtEventNo').val(data[0].EventNo);
                $('#DropProduct').val(data[0].ProductTypeID);
                $('#ddlTime').val(data[0].TIME);
            }
        });

    }


    function Btncancel(EventID) {
        var vEventID = EventID;
        AlertModal("modalConfirm");

    }





    //    function ManageCom(EventID) {

    //        //$("#ManageCommit").load("ajax/test.html");
    //    }

</script>


</html>
