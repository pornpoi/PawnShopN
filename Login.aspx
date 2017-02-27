<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>
<%@ Register Src="~/MenuControl/MenuUserControl.ascx" TagName="UserControl" TagPrefix="uc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/uikit.min.js" type="text/javascript"></script>
    <link href="css/uikit.min.css" rel="stylesheet" type="text/css" />
    <link href="css/GridStyle.css" rel="stylesheet" />
    <title>::ระบบจัดการทรัพย์หลุด::</title>
    <style>
        .hidden {
            display: none;
        }
    </style>
    <script type="text/javascript">
        function AlertModal(ModalName) {
            var modalName = "#" + ModalName;
            var modal = UIkit.modal(modalName);

            //var modal = UIkit.modal("#modalAlert");

            if (modal.isActive()) {
                modal.hide();
            } else {
                modal.show();
            }
        }
        //$(document).ready(function () {
        //    $(".uk-nav li").removeClass("uk-active");
        //    $('#hplEstimateAssest').addClass("uk-active");
        //});

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <%-- header--%>
    <uc:UserControl ID="MyNav" runat="server" />
    <%-- End header--%>
    
    <div class="uk-grid">
        <div class="uk-width-1-3"></div>
        <div class="uk-width-1-3">
            <div class="uk-panel uk-panel-box uk-panel-box-primary">
                <asp:Label ID="lblLogin" runat="server" Text="เข้าสู่ระบบจัดการทรัพย์หลุด" Font-Bold ="true" ></asp:Label>
                <div class="uk-form uk-form-horizontal">
                    <table class="uk-table">
                        <tr>
                            <td>
                                <asp:Label ID="lblUsername" runat="server" Text="ชื่อผู้ใช้งาน"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="uk-form-width-medium"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPassword" runat="server" Text="รหัสผ่าน"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="uk-form-width-medium" TextMode ="Password" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>

                            </td>
                            <td >
                                <asp:Button ID="btnSubmit" runat="server" Text="Login" CssClass ="uk-button uk-button-primary" ForeColor="White" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="uk-width-1-3"></div>
    </div>

    <div class="uk-modal" id="modalAlertSuccess">
        <div class="uk-modal-dialog">
            <div class="uk-modal-header uk-alert-warning">แจ้งเตือน</div>
            <asp:Label ID="lblAlert" runat="server"></asp:Label>
        </div>
    </div>

    </form>
</body>
</html>
