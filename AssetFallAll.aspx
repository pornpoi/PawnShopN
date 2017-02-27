<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AssetFallAll.aspx.vb" Inherits="AssetFallAll" %>
<%@ Register Src="~/MenuControl/MenuUserControl.ascx" TagName="UserControl" TagPrefix="uc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/uikit.min.js" type="text/javascript"></script>
    <link href="css/uikit.min.css" rel="stylesheet" type="text/css" />
    <link href="css/GridStyle.css" rel="stylesheet" />
    <title>::ระบบจัดการทรัพย์หลุด::</title>
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
    <%-- content--%>
    <div class="uk-grid">
        <div class="uk-width-1-5">
            <div class="uk-panel uk-panel-box" style="margin-left:50px">
                <ul class="uk-nav uk-nav-side">
                    <li class="uk-active">
                        <asp:HyperLink ID="hplEstimateAssest" runat="server">ประเมินราคาตั๋ว</asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="hplAssetFallAll" runat="server">รายการทรัพย์หลุดทั้งหมด</asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="hplManageAssetFall" runat="server">จัดการทรัพย์หลุด</asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="hplBuy" runat="server">ซื้อคืน</asp:HyperLink>
                    </li>
                </ul>
            </div>
        </div>
        <div class="uk-width-3-5">
            <ul class="uk-tab">
                <li>
                    <a href="Default.aspx">หน้าราคาประเมินทรัพย์หลุด(รายตั๋ว)</a>
                </li>
                <li class="uk-active">
                    <a href="AssetFallAll.aspx">รายการทรัพย์หลุดทั้งหมด</a>
                </li>
                <li>
                    <a href="SetAsset.aspx">จัดการทรัพย์หลุด</a>
                </li>
                <li>
                    <a href="BuyBack.aspx">ซื้อคืน</a>
                </li>
                <li>
                    <a href="DisplayAuction.aspx">ประมูลทรัพย์หลุด</a>
                </li>

            </ul>


        </div>
        <div class="uk-width-1-5">

        </div>
    </div>
    </form>
</body>
</html>
