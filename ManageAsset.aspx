<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ManageAsset.aspx.vb" Inherits="ManageAsset" %>

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
       
        function expandcollape(name)
        {
            var div = document.getElementById(name);
            var img = document.getElementById('img' + name);
            if(div.style.display == 'none')
            {
                div.style.display = "inline";
                img.src = "img/minus.png";
            }
            else
            {
                div.style.display = "none";
                img.src = "img/plus.png";
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="hddSetID" runat="server" />
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
                <li >
                    <a href="AssetFallAll.aspx">รายการทรัพย์หลุดทั้งหมด</a>
                </li>
                <li class="uk-active">
                    <a href="ManageAsset.aspx">จัดการทรัพย์หลุด</a>
                </li>
                <li>
                    <a href="BuyBack.aspx">ซื้อคืน</a>
                </li>
                <li>
                    <a href="DisplayAuction.aspx">ประมูลทรัพย์หลุด</a>

                </li>
            </ul>
            <br />      
            <asp:LinkButton ID="btnAddSet" runat="server" ForeColor="White" CssClass="uk-button uk-button-primary">
                  <i class="uk-icon-plus-square-o "></i>&nbsp;&nbsp;&nbsp;เพิ่มชุดใหม่
            </asp:LinkButton>
            <br />
            <h3>รายการชุดที่ถูกจัดไว้แล้ว</h3>
            <hr />
            <asp:Panel ID="panelSetResult" runat="server">
                <asp:GridView ID="gvSetResult" runat="server" AutoGenerateColumns="false" CssClass="uk-table uk-table-condensed grid" ShowHeaderWhenEmpty="true" ShowHeader="true" EmptyDataText="ไม่มีข้อมูล" DataKeyNames ="SetGroupID">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href="JavaScript:expandcollape('<%# Eval("SetGroupID")%>');">
                                    <img id='img<%# Eval("SetGroupID")%>'" src="img/plus.png" />
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div id='<%# Eval("SetGroupID") %>' style="display: none" />
                                <asp:GridView ID="gvChild" runat="server" AutoGenerateColumns="false" CssClass="uk-table uk-table-condensed grid">
                                    <Columns>
                                        <asp:BoundField DataField="TicketID" SortExpression="" HeaderText="เลขตั๋ว" />
                                        <asp:BoundField DataField="BookNoAndNumNo" SortExpression="" HeaderText="เลขที่เล่มที่" />
                                        <asp:BoundField DataField="Description" SortExpression="" HeaderText="รายละเอียด" />
                                        <asp:BoundField DataField="Quantity" SortExpression="" HeaderText="จำนวน" />
                                        <asp:BoundField DataField="Weight" SortExpression="" HeaderText="น้ำหนัก(กรัม)" />
                                        <asp:BoundField DataField="EstimatePrice" SortExpression="" HeaderText="ราคาประเมิน" />
                                    </Columns>
                                </asp:GridView>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="SetGroupID" SortExpression="" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                        <asp:BoundField DataField="ROWNUM" SortExpression="" HeaderText="ลำดับชุดที่" />
                        <asp:BoundField DataField="BranchName" SortExpression="" HeaderText="สาขา" />
                        <asp:BoundField DataField="ProductTypeId" SortExpression="" HeaderText="ประเภท" />
                        <asp:BoundField DataField="NumThing" SortExpression="" HeaderText="จำนวนสิ่ง" />
                        <asp:BoundField DataField="Weight" SortExpression="" HeaderText="น้ำหนัก" />
                        <asp:BoundField DataField="EstimateSum" SortExpression="" HeaderText="ราคาประเมิน" />
                        <asp:ButtonField ButtonType="Button" CommandName="CancelSet" HeaderText="ยกเลิกชุด" Text="ยกเลิกชุด" ControlStyle-CssClass="uk-button uk-button-danger" />
                        <asp:ButtonField ButtonType="Button" CommandName="EditSet" HeaderText="แก้ไขชุด" Text="แก้ไขชุด" ControlStyle-CssClass="uk-button uk-button-success  " />
                    </Columns>
                </asp:GridView>
            </asp:Panel>

            <asp:Panel ID="panelAddSet" runat="server" CssClass="uk-alert-success" Visible="false">
                <div class="uk-form uk-form-horizontal">
                    <table class="uk-table">
                        <tr>
                            <td>
                                <asp:Label ID="lblBranch" runat="server" Text="เลือกสาขา" Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlBranch" runat="server" CssClass="uk-form-width-large">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCategory" runat="server" Text="เลือกประเภททรัพย์" Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="uk-form-width-large">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblNumberThing" runat="server" Text="จำนวนสิ่ง" Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNumberThing" runat="server" CssClass="uk-form-width-medium"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblWeightsum" runat="server" Text="น้ำหนักรวม" Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtWeightsum" runat="server" CssClass="uk-form-width-medium"></asp:TextBox>
                            </td>
                         </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPrice" runat="server" Text="ราคารับจำนำ" Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPrice" runat="server" CssClass="uk-form-width-medium"></asp:TextBox>
                            </td>
                         </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEstimateSum" runat="server" Text="ราคาประเมิน" Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEstimateSum" runat="server" CssClass="uk-form-width-medium"></asp:TextBox>
                            </td>
                         </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblScan" runat="server" Text="สแกนตั๋ว" Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtScan" runat="server" CssClass="uk-form-width-medium" AutoPostBack="true"></asp:TextBox>
                            </td>
                         </tr>
                         <tr>
                             <td>
                                 <asp:LinkButton ID="LbkRefresh" runat="server" ForeColor="White" CssClass="uk-button uk-button-primary">
                                      <i class="uk-icon-refresh"></i>&nbsp;&nbsp;&nbsp;ล้างค่าข้อมุลที่ค้างไว้
                                 </asp:LinkButton>
                             </td>
                             <td>


                             </td>
                         </tr>
                    </table>
                    
                    <asp:GridView ID="gvScan" runat="server" AutoGenerateColumns="false" CssClass="uk-table uk-table-condensed grid" EmptyDataText="ไม่มีข้อมูล" ShowHeaderWhenEmpty="true">
                        <Columns>
                            <asp:BoundField DataField="SetID" SortExpression="" HeaderText="" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                            <asp:BoundField DataField="TicketID" SortExpression="" HeaderText="เลขตั๋ว" />
                            <asp:BoundField DataField="BookNoAndNumNo" SortExpression="" HeaderText="เลขที่เล่มที่" />
                            <asp:BoundField DataField="Quantity" SortExpression="" HeaderText="จำนวน" DataFormatString="{0:N2}" />
                            <asp:BoundField DataField="Weight" SortExpression="" HeaderText="น้ำหนัก" DataFormatString="{0:N2}" />
                            <asp:BoundField DataField="Price" SortExpression="" HeaderText="ราคารับจำนำ" DataFormatString="{0:N2}" />
                            <asp:BoundField DataField="EstimatePrice" SortExpression="" HeaderText="ราคาประเมิน" DataFormatString="{0:N2}" />
                            <asp:ButtonField ButtonType="Image" CommandName="DeleteTicket" ImageUrl="img/delete.png" HeaderText="ลบ" />
                        </Columns>
                    </asp:GridView>

                </div>
                <div class="uk-form uk-form-horizontal">
                    <table class="uk-table">
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblCode" runat="server" Text="รหัสผู้ทำรายการ" Font-Bold="true" ></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCode" runat="server" CssClass="uk-form-width-medium"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>

                            </td>
                            <td>
                               <asp:Button ID="btnConfirm" runat="server" Text="ยืนยันการทำรายการจัดชุด" CssClass="uk-button uk-button-success" ForeColor="White" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </div>
        <div class="uk-width-1-5">

        </div>
    </div>

    <div class="uk-modal" id="modalAlertSuccess">
        <div class="uk-modal-dialog">
            <div class="uk-modal-header uk-alert-warning">แจ้งเตือน</div>
            <asp:Label ID="lblAlert" runat="server"></asp:Label>
        </div>
    </div>

        <div class="uk-modal" id="modalAlertClearData">
            <div class="uk-modal-dialog">
                <div class="uk-modal-header uk-alert-warning">ล้างค่าข้อมูล</div>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblClear" runat="server" Text="คุณต้องการล้างค่าข้อมูลทั้งหมด?" Font-Bold="true"></asp:Label>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnClear" runat="server" Text="ตกลง" CssClass="uk-button uk-button-primary" />
                            <asp:Button ID="btnCancelClaer" runat="server" Text="ยกเลิก" CssClass="uk-button uk-button-danger" />
                        </td>
                    </tr>
                </table>


            </div>
        </div>

    <div class="uk-modal" id="modalDelete">
        <div class="uk-modal-dialog">
            <div class="uk-modal-header uk-alert-danger">คุณต้องการลบข้อมูลหรือไม่ ? </div>
            <table class="uk-table">
                <tr>
                    <td>
                        <asp:Label ID="lblSelectTicketID" runat="server" Text="เลขตั๋ว : "  Font-Bold ="true"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSelectTicketIDSelect" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td>
                        <asp:Button ID="btnDelete" runat="server" Text="ยืนยันการลบข้อมูล" CssClass="uk-button uk-button-danger"/>
                        <asp:Button ID="btnCancel" runat="server" Text="ยกเลิก" CssClass="uk-button uk-button-success "/>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="uk-modal" id="modalEditSet">
        <div class="uk-modal-dialog">
            <div class="uk-modal-header uk-alert-warning">แก้ไขข้อมูลการจัดชุด</div>
            <div class="uk-form uk-form-horizontal">
                <table class="uk-table">
                    <tr>
                        <td>
                            <asp:Label ID="lblBranchEdit" runat="server" Text="สาขา" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlBranchEdit" runat="server" CssClass="uk-form-width-medium"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCategoryEdit" runat="server" Text="ประเภททรัพย์" Font-Bold ="true" ></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCategoryEdit" runat="server" CssClass="uk-form-width-medium"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNumthing" runat ="server" Text="จำนวนสิ่ง" Font-Bold ="true"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNumthingEdit" runat ="server" CssClass="uk-form-width-medium"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblWeightEdit" runat="server" Text="น้ำหนัก" Font-Bold ="true"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtWeightEdit" runat ="server" CssClass="uk-form-width-medium"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblEstimateEdit" runat="server" Text="ราคาประเมินชุด" Font-Bold ="true" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEstimateEdit" runat ="server" CssClass="uk-form-width-medium"></asp:TextBox>
                        </td>
                    </tr>

                </table>
                <h2>รายละเอียดตั๋วที่มีในชุดนี้</h2>
                <hr />
                <asp:GridView ID="gvChildToModal" runat="server" AutoGenerateColumns="false" CssClass="uk-table uk-table-condensed grid" ShowHeader ="true" EmptyDataText="No Data">
                    <Columns>
                        <asp:BoundField DataField="TicketID" SortExpression="" HeaderText="เลขตั๋ว" />
                        <asp:BoundField DataField="BookNoAndNumNo" SortExpression="" HeaderText="เลขที่เล่มที่" />
                        <asp:BoundField DataField="Description" SortExpression="" HeaderText="รายละเอียด" />
                        <asp:BoundField DataField="Quantity" SortExpression="" HeaderText="จำนวน" />
                        <asp:BoundField DataField="Weight" SortExpression="" HeaderText="น้ำหนัก(กรัม)" />
                        <asp:BoundField DataField="EstimatePrice" SortExpression="" HeaderText="ราคาประเมิน" />
                    </Columns>
                </asp:GridView>
                <table class="uk-table">
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnEditSet" runat="server" CssClass="uk-button uk-button-success " Text="ดำเนินการแก้ไข" ForeColor="White" />
                            <asp:Button ID="btnCancelEdit" runat="server" CssClass="uk-button uk-button-danger " Text="ยกเลิก"  ForeColor ="White"/>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    </form>
</body>
</html>

