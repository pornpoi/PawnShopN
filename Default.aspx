<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

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
    </script>
</head>
<body>
    <form id="form2" runat="server">

        <asp:GridView ID="gvEstimateFallOff" runat="server" AutoGenerateColumns="false" CssClass="uk-table uk-table-condensed grid" ShowHeaderWhenEmpty="true" ShowHeader="true" EmptyDataText="ไม่มีข้อมูล" DataKeyNames="TicketId">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="OnCheckedChanged" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox runat="server" AutoPostBack="true" OnCheckedChanged="OnCheckedChanged" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="TicketId" SortExpression="" HeaderText="ตั๋ว" />
                <asp:BoundField DataField="TicketInfo" SortExpression="" HeaderText="เลขที่|เล่มที่" />
                <asp:BoundField DataField="Amount" SortExpression="" HeaderText="ราคารับจำนำ(บาท) จากตั๋ว" DataFormatString="{0:###,###.00}" />
                <asp:TemplateField HeaderText="ราคาประเมินที่ตั๋ว(บาท)">
                    <ItemTemplate>
                        <div class="uk-form">
                            <table class="uk-table">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblEstimate" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEstimateFirst" runat="server" Visible="false"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ราคาประเมินที่ตั๋วครั้งที่ 2">
                    <ItemTemplate>
                        <div class="uk-form">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblEstimateSecond" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEstimateSecond" runat="server" Visible="false"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField ButtonType="Image" CommandName="Detail" ImageUrl="img/search_button_green.png" HeaderText="รายละเอียดตั๋ว" />
                <asp:ButtonField ButtonType="Button" CommandName="History" HeaderText="ประวัติการประเมิน" Text="ประวัติการประเมิน" ControlStyle-CssClass="uk-button uk-button-success" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnUpdateEstimate" runat="server" Text="Update" CssClass="uk-button uk-button-success" />





        <div class="uk-modal" id="modalAlert">
            <div class="uk-modal-dialog">
                <div class="uk-modal-header uk-alert-danger">แจ้งเตือน</div>
                <asp:GridView ID="gvEstimateDetail" runat="server" AutoGenerateColumns="false" CssClass="uk-table uk-table-condensed grid" ShowHeaderWhenEmpty="true" ShowHeader="true" EmptyDataText="ไม่มีข้อมูล">
                    <Columns>
                        <asp:BoundField DataField="TicketLine" SortExpression="" HeaderText="ลำดับ" />
                        <asp:BoundField DataField="Name" SortExpression="" HeaderText="ประเภททรัพย์" />
                        <asp:BoundField DataField="Description" SortExpression="" HeaderText="รายละเอียด" />
                        <asp:BoundField DataField="Quantity" SortExpression="" HeaderText="จำนวน" />
                    </Columns>
                </asp:GridView>
            </div>
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
