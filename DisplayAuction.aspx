<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DisplayAuction.aspx.vb" Inherits="DisplayAuction" %>
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

    </script>

</head>
<body>
    <form id="form1" runat="server">
    <%-- header--%>
    <uc:UserControl ID="MyNav" runat="server" />
    <%-- End header--%>
        <div class="uk-grid">
            <div class="uk-width-1-5">
                <div class="uk-panel uk-panel-box" style="margin-left: 50px">
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
                    <li>
                        <a href="AssetFallAll.aspx">รายการทรัพย์หลุดทั้งหมด</a>
                    </li>
                    <li>
                        <a href="SetAsset.aspx">จัดการทรัพย์หลุด</a>
                    </li>
                    <li>
                        <a href="BuyBack.aspx">ซื้อคืน</a>
                    </li>
                    <li class="uk-active">
                        <a href="DisplayAuction.aspx">ประมูลทรัพย์หลุด</a>
                    </li>
                </ul>
                <br />

                <h3>กำหนดวันขายเฉพาะส่วนกลาง</h3>
                <div class="uk-form uk-form-horizontal">
                    <table class="uk-table">
                        <tr>
                            <td>
                                <asp:Label ID="lblAnounce" runat="server" Text="เลขที่ประกาศ" Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAnounce" runat="server" CssClass="uk-form-width-medium"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDate" runat="server" Text="วันที่" Font-Bold ="true"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDate" runat="server" CssClass="uk-form-width-medium"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblState" runat="server" Text="สถานที่" Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtState" runat="server" CssClass="uk-form-width-medium"></asp:TextBox>
                            </td>
                        </tr>

                    </table>
                </div>

                <hr />
                <h3>คณะกรรมการประเมินราคาทรัพย์หลุดจำนำ</h3>
                <div class="uk-form uk-form-horizontal">
                    <table class="uk-table">
                        <tr>
                            <td>
                               <asp:Label ID="lblPreseident" runat="server" Text="ประธานกรรมการ" Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPresident" runat="server" CssClass ="uk-form-width-medium"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>

                        </tr>
                    </table>
                </div>
                <hr />
                <h3>คณะกรรมการควบคุมการจำหน่ายทรัพย์หลุดจำนำ</h3>
                <div class="uk-form uk-form-horizontal">
                    <table class="uk-table">
                        <tr>
                            <td>

                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="uk-width-1-5">
            </div>
        </div>
        <div class="uk-modal" id="modalFilterCommitee">
            <div class="uk-modal-dialog">
                <div class="uk-modal-header uk-alert-success">เพิ่มประธานและกรรมการ</div>

            </div>
        </div>
    </form>
</body>
</html>
