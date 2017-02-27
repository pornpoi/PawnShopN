<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TestDate.aspx.vb" Inherits="TestDate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/uikit.min.js" type="text/javascript"></script>
    <link href="css/uikit.min.css" rel="stylesheet" type="text/css" />
    <script src="js/components/datepicker.js"></script>
    <link href="css/GridStyle.css" rel="stylesheet" />
    <title></title>

    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: "POST",


                url: "ajax/ajax_AuctionArea/LoadEventAll.aspx",
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
                            "<td style='text-align:center'>" + data[i].CreatedDate + "</td>" +
                            "<td style='text-align:center'>" + data[i].Amount + "</td>" +
                            "<td style='text-align:center'>" + "<input id='FirstEstimate' type='text' name='first' class='uk-form-width-medium' value='" + data[i].FirstEstimate + "' />" + "</td>" +
                            "<td style='text-align:center'>" + data[i].SecondEstimate + "</td>" +
                            "<td style='text-align:center;display:none;' class='reportNo' >" + data[i].ReportNo + "</td>" +
                            "<td style='text-align:center'><input type='button' value='รายละเอียด' style='color:#ffffff' class='uk-button uk-button-primary' onclick=\"getTicketDetail('" + data[i].TicketId + "')\"/> </td>" +
                        "</tr>"
                         );
                    }
                  
                },
                error: function ajaxError(result) {
                    alert(result.status + ":" + result.statusText);
                }
            });
        });



    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hiddenRole" runat="server" />
        <table id="tableData" class="uk-table" border="1">
            <thead>
                <tr>
                    <td style="text-align: center">ลำดับ</td>
                    <td style="text-align: center">ตั๋ว</td>
                    <td style="text-align: center">เล่มที่</td>
                    <td style="text-align: center">เลขที่</td>
                    <td style="text-align: center">เดือน</td>
                    <td style="text-align: center">ราคารับจำนำ</td>
                    <td style="text-align: center">ประเมินราคาครั้งที่หนึ่ง</td>
                    <td style="text-align: center">ประเมินราคาครั้งที่สอง</td>
                    <td style="text-align: center; display: none">ReportNo</td>
                    <td style="text-align: center">รายละเอียดตั๋ว</td>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </form>
</body>
</html>
