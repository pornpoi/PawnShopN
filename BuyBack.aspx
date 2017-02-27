<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BuyBack.aspx.vb" Inherits="BuyBack" %>


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
        function AlertModal(ModalName) {
            var modalName = "#" + ModalName;
            var modal = UIkit.modal(modalName);

            if (modal.isActive()) {
                modal.hide();
            } else {
                modal.show();
            }
        }
        
        function getCustomerDetail() {
            var TicketID = $('#txtTicketNumber').val();

            if (TicketID == "") {
                $('#lblAlert').text("กรุณากรอกตัวเลขตั๋ว");
                AlertModal("modalAlert");
                return;
            } else {
                $('#loadingmessage').show();
                data = "TicketID=" + TicketID;
                $.ajax({
                    type: "POST",
                    url: "ajax/DetailCustomer.aspx",
                    data: data,
                    success: function (data) {
                        $('#contenttable').html(data);
                        $('#loadingmessage').hide();
                    }
                });
            }



        }

        function LoadBuyAll() {
            $('#loadingmessage').show();
            $.ajax({
                type: "POST",
                url: "ajax/BuyAll.aspx",
                success: function (data) {
                    $('#contenttable').html(data);
                    $('#loadingmessage').hide();
                }
            });
        }
    </script>
    <style>
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="hddTicketID" runat="server" />

            <div class="uk-form uk-form-horizontal">
                <table class="uk-table">
                    <tr>
                        <td>
                            <asp:Label ID="lblticketNumber" runat="server" Text="เลขตั๋ว" Font-Bold ="true"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTicketNumber" runat="server" CssClass="uk-form-width-medium"></asp:TextBox>
                            <input type="button" class="uk-button uk-button-primary" style="color:#ffffff" value="ค้นหา" onclick="getCustomerDetail()"/>
                            <input type="button" class="uk-button uk-button-primary" style="color:#ffffff" value="ข้อมูลการซื้อคืนทั้งหมด" onclick="LoadBuyAll()" />
                            <div id='loadingmessage' style='display: none'>
                                <img src="img/ajax-loader.gif" />
                            </div>
                        </td>
                    </tr>

                </table>
                <br />

            </div>

            <div id ="contenttable">

            </div>

    <div class="uk-modal" id="modalAlertSuccess">
        <div class="uk-modal-dialog">
            <div class="uk-modal-header uk-alert-success">แจ้งเตือน</div>
            <asp:Label ID="lblAlert" runat="server"></asp:Label>
        </div>
    </div>
   
    </form>
</body>
</html>
