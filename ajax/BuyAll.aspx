<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BuyAll.aspx.vb" Inherits="ajax_BuyAll" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/uikit.min.js" type="text/javascript"></script>
    <script src="js/components/notify.min.js"></script>
    <link href="css/uikit.min.css" rel="stylesheet" type="text/css" />
    <link href="css/GridStyle.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="false" CssClass="uk-table grid">
            <Columns>
                <asp:BoundField DataField="TicketID" SortExpression="" HeaderText="เลขตั๋ว" />
                <asp:BoundField DataField="Price" SortExpression="" HeaderText="ราคา" DataFormatString="{0:###,###.00}" />
                <asp:BoundField DataField="DateCreated" SortExpression="" HeaderText="วันที่" />
                <asp:BoundField DataField="Name" SortExpression="" HeaderText="ชื่อผู้ซื้อ" />
                <asp:BoundField DataField="Remark" SortExpression="" HeaderText="หมายเหตุ" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
