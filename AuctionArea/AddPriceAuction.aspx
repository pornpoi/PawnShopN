<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddPriceAuction.aspx.vb" Inherits="AuctionArea_AddPriceAuction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script src="../js/uikit.min.js" type="text/javascript"></script>
    <script src="../js/components/notify.min.js"></script>
    <link href="../css/uikit.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/GridStyle.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="uk-grid">
            <div class="uk-width-1-3">
            </div>
            <div class="uk-width-1-3">
            </div>
            <div class="uk-width-1-3">
            </div>
        </div>
        <div class="uk-grid">
            <div class="uk-width-5-5">
                <table class="uk-table uk-table-condensed" border="1">
                    <thead>
                        <tr>
                            <td>เลขประกาศ</td>
                            <td>วันที่</td>
                            <td>สถานที่</td>
                            <td>เวลา</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <button class="uk-button uk-button-primary ">เพิ่มรายการทรัพย์</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
