<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BuyDay.aspx.vb" Inherits="AuctionArea_BuyDay" %>

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
                <b>รายการประกาศ</b>
                <table class="uk-table uk-table-condensed" border="1">
                    <thead>
                        <tr>
                            <td>เลขประกาศ</td>
                            <td>วันที่</td>
                            <td>สถานที่</td>
                            <td>เวลา</td>
                            <td></td>
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
                                <button class="uk-button uk-button-danger">แก้ไข</button>
                            </td>
                            <td>
                                <button class="uk-button uk-button-danger">ลบ</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button id="btnAdd" class="uk-button uk-button-primary">เพิ่มประกาศ</button>
            </div>
        </div>
        <div class="uk-grid">
           <div class="uk-form">
               <table class="uk-table uk-table-condensed">
                   <tr>
                       <td>
                           เลขประกาศ
                       </td>
                       <td>
                           <input type="text" class="uk-form-width-medium"/>
                       </td>
                       <td></td>
                   </tr>
                   <tr>
                       <td>เวลา</td>
                       <td>
                           <input type="text" class="uk-form-width-medium"/>
                       </td>
                       <td>
                           สถานที่
                       </td>
                       <td>
                           <input type="text" class="uk-form-width-medium"/>
                       </td>
                   </tr>
                   <tr>
                       <td colspan ="4"><b><u>คณะกรรมการประเมินราคาทรัพย์หลุดจำนำ</u></b></td>
                   </tr>
                   <tr>
                       <td>
                           ประธานกรรมการ
                       </td>
                       <td>
                           <input type="text" class="uk-form-width-medium"/>
                       </td>
                       <td>
                           <button class="uk-button uk-button-primary">+</button>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           กรรมการ
                       </td>
                       <td>
                           <input type="text" class="uk-form-width-medium"/>
                       </td>
                       <td>
                           <button class="uk-button uk-button-primary">+</button>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="4"><b><u>คณะกรรมการควบคุมการจำหน่ายทรัพย์หลุดจำนำ</u></b></td>
                   </tr>
                   <tr>
                       <td>
                           กรรมการ
                       </td>
                       <td>
                           <input type="text" class="uk-form-width-medium" />
                       </td>
                       <td>
                           <button class="uk-button uk-button-primary">+</button>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="4"><b><u>คณะกรรมการดำเนินการจำหน่ายทรัพย์หลุดจำนำ</u></b></td>
                   </tr>
                   <tr>
                       <td>
                           พนักงานการเงินและบัญชี
                       </td>
                       <td>
                           <input type="text" class="uk-form-width-medium" />
                       </td>
                       <td>
                           <button class="uk-button uk-button-primary">+</button>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           พนักงานรักษาของ
                       </td>
                       <td>
                           <input type="text" class="uk-form-width-medium" />
                       </td>
                       <td>
                           <button class="uk-button uk-button-primary">+</button>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           โฆษก
                       </td>
                       <td>
                           <input type="text" class="uk-form-width-medium" />
                       </td>
                       <td>
                           <button class="uk-button uk-button-primary">+</button>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="4"><b><u>เจ้าหน้าที่เสนอทรัพย์หลุดจำนำ</u></b></td>
                   </tr>
                   <tr>
                       <td></td>
                       <td>
                           <input type="text" class="uk-form-width-medium" />
                       </td>
                       <td>
                           <button class="uk-button uk-button-primary">+</button>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           แนบประกาศ
                       </td>
                       <td>
                           <input type="text" class="uk-form-width-medium" />
                       </td>
                       <td>
                           <button class="uk-button uk-button-primary">แนบไฟล์</button>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           เลือกสาขา
                       </td>
                       <td>

                       </td>
                   </tr>
                   <tr>
                       <td></td>
                       <td>
                           <button class="uk-button uk-button-danger">ยืนยันการบันทึกรายการ</button>
                       </td>
                   </tr>
               </table>
           </div>
        </div>
        <br />
        <br />
        <br />
    </form>
</body>
</html>
