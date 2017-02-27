<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Auction.aspx.vb" Inherits="Auction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/uikit.min.js" type="text/javascript"></script>
    <script src="js/components/notify.min.js"></script>
    <link href="css/uikit.min.css" rel="stylesheet" type="text/css" />
    <link href="css/GridStyle.css" rel="stylesheet" />
    <title>::ระบบจัดการทรัพย์หลุด::</title>
     <script type="text/javascript">
         $(document).ready(function () {
             $('#tab1').click(function () {
                 $(this).addClass('uk-active');
                 $('#tab2').removeClass('uk-active');
                 $('#tab3').removeClass('uk-active');
                 $('#tab4').removeClass('uk-active');
                 $('#tab5').removeClass('uk-active');
                 $('#tab6').removeClass('uk-active');
                 $('#tab7').removeClass('uk-active');

                 $('#AuctionPane').load("AuctionArea/BuyDay2.aspx");

             });
             $('#tab2').click(function () {
                 $(this).addClass('uk-active');
                 $('#tab1').removeClass('uk-active');
                 $('#tab3').removeClass('uk-active');
                 $('#tab4').removeClass('uk-active');
                 $('#tab5').removeClass('uk-active');
                 $('#tab6').removeClass('uk-active');
                 $('#tab7').removeClass('uk-active');

                 $('#AuctionPane').load("AuctionArea/AddPriceAuction.aspx");
             });
             $('#tab3').click(function () {
                 $(this).addClass('uk-active');
                 $('#tab2').removeClass('uk-active');
                 $('#tab1').removeClass('uk-active');
                 $('#tab4').removeClass('uk-active');
                 $('#tab5').removeClass('uk-active');
                 $('#tab6').removeClass('uk-active');
                 $('#tab7').removeClass('uk-active');

                 
             });
             $('#tab4').click(function () {
                 $(this).addClass('uk-active');
                 $('#tab2').removeClass('uk-active');
                 $('#tab3').removeClass('uk-active');
                 $('#tab1').removeClass('uk-active');
                 $('#tab5').removeClass('uk-active');
                 $('#tab6').removeClass('uk-active');
                 $('#tab7').removeClass('uk-active');

                 $('#AuctionPane').load("AuctionArea/Register.aspx");
             });
             $('#tab5').click(function () {
                 $(this).addClass('uk-active');
                 $('#tab2').removeClass('uk-active');
                 $('#tab3').removeClass('uk-active');
                 $('#tab4').removeClass('uk-active');
                 $('#tab1').removeClass('uk-active');
                 $('#tab6').removeClass('uk-active');
                 $('#tab7').removeClass('uk-active');

                 $('#AuctionPane').load("AuctionArea/RegisterInfo.aspx");

             });
             $('#tab6').click(function () {
                 $(this).addClass('uk-active');
                 $('#tab2').removeClass('uk-active');
                 $('#tab3').removeClass('uk-active');
                 $('#tab4').removeClass('uk-active');
                 $('#tab5').removeClass('uk-active');
                 $('#tab1').removeClass('uk-active');
                 $('#tab7').removeClass('uk-active');
             });
             $('#tab7').click(function () {
                 $(this).addClass('uk-active');
                 $('#tab2').removeClass('uk-active');
                 $('#tab3').removeClass('uk-active');
                 $('#tab4').removeClass('uk-active');
                 $('#tab5').removeClass('uk-active');
                 $('#tab6').removeClass('uk-active');
                 $('#tab1').removeClass('uk-active');

                 $('#AuctionPane').load("AuctionArea/AuctionInfo.aspx");
             });
         });
     </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul class="uk-tab">
                <li id="tab1">
                    <a>กำหนดวันขาย</a>
                </li>
                <li id="tab2">
                    <a>เพิ่มราคาประมูลทรัพย์</a>
                </li>
                <li id="tab3">
                    <a>ประเมินครั้งที่ 3</a>
                </li>
                <li id="tab4">
                    <a>ลงทะเบียน</a>
                </li>
                <li id="tab5">
                    <a>ข้อมูลผู้ลงทะเบียน</a>
                </li>
                <li id="tab6">
                    <a>บันทึกการประมูล</a>
                </li>
                <li id="tab7">
                    <a>ข้อมูลการประมูล</a>
                </li>
            </ul>
        </div>
        <div id="AuctionPane">

        </div>
    </form>
</body>
</html>
