<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="AuctionArea_Register" %>

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
                <b>ลงทะเบียน</b><hr />
                <div class="uk-form">
                <table class="uk-table">
                    <tr>
                        <td>
                            วันที่
                        </td>
                        <td>
                            <input type="text" class="uk-form-width-medium"/>
                        </td>
                        <td>
                            สาขา
                        </td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            รหัสบัตรประชาชน
                        </td>
                        <td>
                            <input type="text" class="uk-form-width-medium"/>
                        </td>
                        <td>
                            ชื่อ-นามสกุล
                        </td>
                        <td>
                            <input type="text" class="uk-form-width-medium" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ที่อยู่
                        </td>
                        <td>
                            <input type="text" class="uk-form-width-medium" />
                        </td>
                        <td>
                            เบอร์โทร
                        </td>
                        <td>
                            <input type="text" class="uk-form-width-medium" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            เลขป้าย
                        </td>
                        <td>
                            <input type="text" class="uk-form-width-medium" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            <button class="uk-button uk-button-primary">ยืนยันการลงทะเบียน</button>
                        </td>
                    </tr>
                </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
