<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DetailCustomer.aspx.vb" Inherits="ajax_DetailCustomer" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/uikit.min.js" type="text/javascript"></script>
    <script src="js/components/notify.min.js"></script>
    <link href="css/uikit.min.css" rel="stylesheet" type="text/css" />
    <link href="css/GridStyle.css" rel="stylesheet" />
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
        function beforBuy() {
            var numberRegex = /^[+-]?\d+(\.\d+)?([eE][+-]?\d+)?$/;
            var price = $('#txtBuyBack').val();

            if (price == "") {
                $('#lblAlert').text("กรุณากรอกตัวเลข");
                AlertModal("modalAlert");

                return; 
            }

            if (numberRegex.test(price) && price !="") {
                AlertModal("modalAlertSuccess");
            } else {
                $('#lblAlert').text("กรุณากรอกเป็นตัวเลข");
                AlertModal("modalAlert");
            }
           
        }

        function Buy() {
            var price = $('#txtBuyBack').val();
            var privateCode = $('#confirmCode').val();
            var ticketID = $('#hiddenTicketID').val();
            var name = $('#txtNameBuy').val();
            var remark = $('#txtRemark').val();

            $('#loadingmessage2').show();

            data = "confirmcodeval=" + privateCode + "&ticketID=" + ticketID + "&price=" + price + "&name=" + name + "&remark=" + remark;
            $.ajax({
                type: "POST",
                url: "ajax/CheckPrivateAndInsertBuyOut.aspx",
                data: data,
                success: function (data) {
                    if ($.trim(data).toString() == 'OK') {
                       
                        location.reload();
                    } else {
                        alert(data);
                    }

                }
            });

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hiddenTicketID" runat="server" />
        <div class="uk-form uk-form-horizontal ">
            <table class="uk-table uk-table-condensed">
                <tr>
                    <td>
                        <asp:Label ID="lblName" runat="server" Text="ชื่อ" Font-Bold="true" ></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblNameSelect" runat="server" ForeColor="Blue" ></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSurname"  runat="server" Text="นามสกุล" Font-Bold="true" ></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSurnameSelect" runat="server" ForeColor="Blue" ></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCitizenNo" runat="server" Text="บัตรประชาชน" Font-Bold="true"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCitizenNoSelect" runat="server" ForeColor="Blue" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTickNo" runat="server" Text="เลขที่" Font-Bold="true" ></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblTickNoSelect" runat="server" ForeColor="Green" ></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblBookNo" runat="server" Text="เล่มที่" Font-Bold="true" ></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblBookNoSelect" runat="server" ForeColor="Green" ></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblAmount" runat="server" Text="ราคาจำนำ" Font-Bold="true" ></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblAmountSelect" runat="server" ForeColor="Blue" ></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblBath" runat="server" Text="บาท" Font-Bold="true" ></asp:Label>
                    </td>
                </tr>
            </table>

            <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="false" CssClass="uk-table grid">
                <Columns>
                    <asp:BoundField DataField ="TicketLine" SortExpression ="" HeaderText="ลำดับ" />
                    <asp:BoundField DataField ="Name" SortExpression ="" HeaderText="ชื่อ" />
                    <asp:BoundField DataField ="Description" SortExpression ="" HeaderText="รายละเอียด" />
                    <asp:BoundField DataField ="Brand" SortExpression ="" HeaderText="ยี่ห้อ" />
                    <asp:BoundField DataField ="SerialNo" SortExpression ="" HeaderText="SerialNo" />
                    <asp:BoundField DataField ="Quantity" SortExpression ="" HeaderText="จำนวน" />
                    <asp:BoundField DataField ="Weight" SortExpression ="" HeaderText="น้ำหนัก" />
                </Columns>
            </asp:GridView>
            <hr />
             <b>ประวัติการซื้อคืน</b>
             <asp:GridView ID="gvHistory" runat="server" AutoGenerateColumns="false" CssClass="uk-table grid" EmptyDataText="No Reccord">
                 <Columns>
                    <asp:BoundField DataField="TicketID" SortExpression="" HeaderText="เลขตั๋ว" />
                    <asp:BoundField DataField="Price" SortExpression="" HeaderText="ราคา" />
                    <asp:BoundField DataField="DateCreated" SortExpression="" HeaderText="วันที่" />
                    <asp:BoundField DataField="Name" SortExpression="" HeaderText="ชื่อผู้ซื้อ" />
                    <asp:BoundField DataField="Remark" SortExpression="" HeaderText="หมายเหตุ" />
                 </Columns>
             </asp:GridView>
            <hr />
            
            <table>
                <tr>
                    <td>
                        <B>สถานะการซื้อคืน</B>
                    </td>
                    <td>
                        <asp:Label ID="lblAlertState" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td><b>ชื่อ-นามสกุล ผู้ตามซื้อคืน</b></td>
                    <td>
                        <input type="text" id="txtNameBuy" class="uk-form-width-medium"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>หมายเหตุ</b>
                    </td>
                    <td>
                        <input type="text" id="txtRemark" class="uk-form-width-medium"  />
                    </td>
                </tr>
                <tr>
                    <td>
                       <B>ต้องการซื้อคืนในราคา</B>
                    </td>
                    <td>
                        <input type="text" id="txtBuyBack" class="uk-form-width-medium"  /> &nbsp;&nbsp; <b>บาท</b>
                    </td>
                </tr>
               <tr>
                   <td>

                   </td>
                   <td>
                       <input type="button" id="btnConfirm" class="uk-button uk-button-primary" value="ยืนยันการขาย(ซื้อคืน)" style="color:#ffffff" onclick="beforBuy()"  />
                   </td>
               </tr>
            </table>
            
        </div>

        <div class="uk-modal" id="modalAlertSuccess">
            <div class="uk-modal-dialog">
                <div class="uk-modal-header uk-alert-success">กรุณากรอกรหัสความปลอดภัย</div>
                <div class="uk-form uk-form-horizontal">
                    <table>
                        <tr>
                            <td></td>
                            <td>
                                <input type="text" id="confirmCode" class="uk-form-width-medium" /><input type="button" id="btnPrivateCode" class="uk-button uk-button-success" value="ยินยัน" onclick="Buy()" />
                            </td>
                        </tr>
                        <tr>
                            <td>

                            </td>
                            <td>
                                <div id='loadingmessage2' style='display: none'>
                                    <img src="img/ajax-loader.gif" />
                                </div>
                            </td>
                            <td>
                                 <p id="lblmodal"></p>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="uk-modal" id="modalAlert">
            <div class="uk-modal-dialog">
                <div class="uk-modal-header uk-alert-success">แจ้งเตือน</div>
                <asp:Label ID="lblAlert" runat="server"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
