<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/jquery.tabletojson.js"></script>
    <script src="js/uikit.min.js" type="text/javascript"></script>
    <link href="css/uikit.min.css" rel="stylesheet" type="text/css" />
    <link href="css/GridStyle.css" rel="stylesheet" />

    <title>::ระบบจัดการทรัพย์หลุด::</title>
    <script type="text/javascript">
        $(document).ready(function () {

        });
        var helper = {
            buildDropdownBranch: function (result, dropdown, emptyMessage) {
                dropdown.html('');
                dropdown.append('<option value="">' + emptyMessage + '</option>');
                if (result != '') {
                    $.each(result, function (k, v) {
                        dropdown.append('<option value="' + v.BranchId + '">' + v.Name + '</option>');
                    });
                }
            }
        }

        $.ajax({
            type: "POST",
            url: "ajax/PopualateBranch.aspx",
            contentType: "application/json; charset=utf-8",
            data: {},
            success: function(data) {
                helper.buildDropdownBranch(jQuery.parseJSON(data), $('#dropdowBranch'),"กรุณาเลือกสาขา");
            },
            error: function ajaxError(result) {
                alert(result.status + ":" + result.statusText);
            }
            
        });

        $('#btnSubmit').click(function () {
            var branch_id = $('select[name=DropdownBranch]').val();
            var RoleID = $('#hiddenRole').val();
            var data = {
                BranchId: branch_id
            };
            $('#loading').show();
            if (RoleID == 2) {

                $.ajax({
                    type: "POST",
                    url: "ajax/Default.aspx",
                    data: JSON.stringify(data),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        $('#tableData tbody').empty();

                        for (i = 0 ; i < data.length; i++) {
                            $('#tableData tbody').append(
                            "<tr>" +
                                "<td style='text-align:center'>" + (i + 1) + "</td>" +
                                "<td style='text-align:center'>" + data[i].TicketId + "</td>" +
                                "<td style='text-align:center'>" + data[i].BookNo + "</td>" +
                                "<td style='text-align:center'>" + data[i].TicketNo + "</td>" +
                                "<td style='text-align:center'>" + data[i].Amount + "</td>" +
                                "<td style='text-align:center'>" + "<input id='FirstEstimate' type='text' name='first' class='uk-form-width-medium' value='" + data[i].FirstEstimate + "' />" + "</td>" +
                                "<td style='text-align:center'>" + data[i].SecondEstimate + "</td>" +
                                "<td style='text-align:center' class='reportNo'>" + data[i].ReportNo + "</td>" +
                                "<td style='text-align:center'><input type='button' class='uk-button uk-button-primary' value='รายละเอียด' style='color:#ffffff' onclick='getTicketDetail('" + data[i].TicketId.toString + "')'/>" + "</td>" +
                            "</tr>"
                             );
                        }
                        $('#loading').hide();
                    },
                    error: function ajaxError(result) {
                        alert(result.status + ":" + result.statusText);
                    }
                });
            } else {
                $.ajax({
                    type: "POST",
                    url: "ajax/Default.aspx",
                    data: JSON.stringify(data),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        $('#tableData tbody').empty();

                        for (i = 0 ; i < data.length; i++) {
                            $('#tableData tbody').append(
                            "<tr>" +
                                "<td style='text-align:center'>" + (i + 1) + "</td>" +
                                "<td style='text-align:center'>" + data[i].TicketId + "</td>" +
                                "<td style='text-align:center'>" + data[i].BookNo + "</td>" +
                                "<td style='text-align:center'>" + data[i].TicketNo + "</td>" +
                                "<td style='text-align:center'>" + data[i].Amount + "</td>" +
                                "<td style='text-align:center'>" + data[i].FirstEstimate + "</td>" +
                                "<td style='text-align:center'>" + "<input id='SecondEstimate' type='text' name='second' class='uk-form-width-medium' value='" + data[i].SecondEstimate + "' />" + "</td>" +
                                "<td style='text-align:center' class='reportNo'>" + data[i].ReportNo + "</td>" +
                                "<td style='text-align:center'><input type='button' class='uk-button uk-button-primary' value='รายละเอียด' style='color:#ffffff' onclick='getTicketDetail('" + data[i].TicketId.toString + "')'/>" + "</td>" +
                            "</tr>"
                             );
                        }
                        $('#loading').hide();
                    },
                    error: function ajaxError(result) {
                        alert(result.status + ":" + result.statusText);
                    }
                });
            }

        });

        $('#btnUpdate').click(function () {
            var RoleID = $('#hiddenRole').val();
            if (RoleID == 2) {
                var arrData = [];
                $('#tableData tbody tr').each(function () {
                    var currentRow = $(this);

                    var id = currentRow.find("td:eq(0)").text();
                    var TicketId = currentRow.find("td:eq(1)").text();
                    var BookNo = currentRow.find("td:eq(2)").text();
                    var TicketNo = currentRow.find("td:eq(3)").text();
                    var Amount = currentRow.find("td:eq(4)").text();
                    var FirstEstimate = currentRow.find('input[name=first]').val();
                    var SecondEstimate = currentRow.find("td:eq(6)").text();
                    var ReportNo = currentRow.find("td:eq(7)").text();

                    var obj = {};
                    obj.id = id;
                    obj.TicketId = TicketId;
                    obj.TicketNo = TicketNo;
                    obj.BookNo = BookNo;
                    obj.Amount = Amount;
                    obj.FirstEstimate = FirstEstimate;
                    obj.SecondEstimate = SecondEstimate;
                    obj.ReportNo = ReportNo;

                    arrData.push(obj);
                });
                $.ajax({
                    url: "ajax/UpdateEstimate.aspx",
                    method: "POST",
                    dataType: "json",
                    data: JSON.stringify(arrData),
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        if ($.trim(data).toString() == 'Success') {

                        }
                    },
                });
                $('#lblAlert').text("ประเมินตั๋วเรียบร้อย");
                AlertModal("modalAlertSuccess");
                loadGrid();
            } else {
                var arrData = [];
                $('#tableData tbody tr').each(function () {
                    var currentRow = $(this);

                    var id = currentRow.find("td:eq(0)").text();
                    var TicketId = currentRow.find("td:eq(1)").text();
                    var BookNo = currentRow.find("td:eq(2)").text();
                    var TicketNo = currentRow.find("td:eq(3)").text();
                    var Amount = currentRow.find("td:eq(4)").text();
                    var FirstEstimate = currentRow.find("td:eq(5)").text();
                    var SecondEstimate = currentRow.find('input[name=second]').val();
                    var ReportNo = currentRow.find("td:eq(7)").text();

                    var obj = {};
                    obj.id = id;
                    obj.TicketId = TicketId;
                    obj.BookNo = BookNo;
                    obj.TicketNo = TicketNo;
                    obj.Amount = Amount;
                    obj.FirstEstimate = FirstEstimate;
                    obj.SecondEstimate = SecondEstimate;
                    obj.ReportNo = ReportNo;

                    arrData.push(obj);
                });
                $.ajax({
                    url: "ajax/UpdateEstimate.aspx",
                    method: "POST",
                    dataType: "json",
                    data: JSON.stringify(arrData),
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        if ($.trim(data).toString() == 'Success') {

                        }
                    },
                });
                $('#lblAlert').text("ประเมินตั๋วเรียบร้อย");
                AlertModal("modalAlertSuccess");
                loadGrid();
            }

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
        function loadGrid() {
            var branch_id = $('select[name=DropdownBranch]').val();
            var data = {
                BranchId: branch_id
            };
            $('#loading').show();
            $.ajax({
                type: "POST",
                url: "ajax/Default.aspx",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    $('#tableData tbody').empty();

                    for (i = 0 ; i < data.length; i++) {
                        $('#tableData tbody').append(
                        "<tr>" +
                            "<td style='text-align:center'>" + (i + 1) + "</td>" +
                            "<td style='text-align:center'>" + data[i].TicketId + "</td>" +
                            "<td style='text-align:center'>" + data[i].BookNo + "</td>" +
                            "<td style='text-align:center'>" + data[i].TicketNo + "</td>" +
                            "<td style='text-align:center'>" + data[i].Amount + "</td>" +
                            "<td style='text-align:center'>" + data[i].FirstEstimate + "</td>" +
                            "<td style='text-align:center'>" + data[i].SecondEstimate + "</td>" +
                            "<td style='text-align:center'>" + data[i].ReportNo + "</td>" +
                        "</tr>"
                         );
                    }
                    $('#loading').hide();
                },
                error: function ajaxError(result) {
                    alert(result.status + ":" + result.statusText);
                }
            });
        }

        function getTicketDetail(TicketID) {

            data = "TicketID=" + TicketID;
            $.ajax({
                url: "ajax/DetailTicket.aspx",
                data: data,
                method: "POST",
                success: function (data) {
                    $('#modalDetail').html(data);
                    AlertModal(modalDetail);
                },
                error: function ajaxError(result) {
                    alert(result.status + ":" + result.statusText);
                }
                
            });
        }
    </script>
</head>
<body>
    <form id="form2" runat="server">
        <asp:HiddenField ID="hiddenRole" runat="server" />
        <b>การประเมินทรัพย์รายตั๋ว</b>
        <div class="uk-form">
            <table class="uk-table">
                <tr>
                    <td>
                        สาขา
                    </td>
                    <td>
                        <select id="dropdowBranch" name="DropdownBranch"></select>
                        <input type="button" id="btnSubmit" value="ยืนยัน" class="uk-button uk-button-primary" style="color:#ffffff" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="uk-form">
            <div id='loading' style='display: none'>
                <img src="img/ajax-loader.gif" />
            </div>
            <table id="tableData" class="uk-table" border="1">
                <thead>
                    <tr>
                        <td style="text-align: center">ลำดับ</td>
                        <td style="text-align: center">ตั๋ว</td>
                        <td style="text-align: center">เล่มที่</td>
                        <td style="text-align: center">เลขที่</td>
                        <td style="text-align: center">ราคารับจำนำ</td>
                        <td style="text-align: center">ประเมินราคาครั้งที่หนึ่ง</td>
                        <td style="text-align: center">ประเมินราคาครั้งที่สอง</td>
                        <td style="text-align: center">ReportNo</td>
                        <td style="text-align: center">รายละเอียดตั๋ว</td>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
            <input id="btnUpdate" type="button" class="uk-button uk-button-success" style="color:#ffffff" value="Update" />
        </div>
        <br /><br /><br />

        <div class="uk-modal" id="modalAlertSuccess">
            <div class="uk-modal-dialog">
                <div class="uk-modal-header uk-alert-success">แจ้งเตือน</div>
                <asp:Label ID="lblAlert" runat="server"></asp:Label>
            </div>
        </div>


        <div class="uk-modal" id="modalDetail">
            <div class="uk-modal-dialog">
                <div class="uk-modal-header uk-alert-success">รายละเอียดตั๋ว</div>
                <div id="detailTicket">

                </div>
            </div>
        </div>

    </form>
</body>
</html>
