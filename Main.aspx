<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Main.aspx.vb" Inherits="Main" %>
<%@ Register Src="~/MenuControl/MenuUserControl.ascx" TagName="UserControl" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/uikit.min.js" type="text/javascript"></script>
    <link href="css/uikit.min.css" rel="stylesheet" type="text/css" />
    <link href="css/GridStyle.css" rel="stylesheet" />
    <script type="text/javascript" src="../js/jquery.js"></script>
   
    <script src="js/components/notify.min.js"></script>
    <script src="js/components/datepicker.js" type="text/javascript"></script>
    <script src="js/components/timepicker.js" type="text/javascript"></script>
    
    


    <title>::ระบบจัดการทรัพย์หลุด::</title>
    <script type ="text/javascript">
        $(document).ready(function () {
            $('#estimate').click(function () {
                $(this).addClass('uk-active');
                $('li').not($(this)).removeClass('uk-active');

                var roleId = $('#hiddenRole').val();
                if (roleId == 2) {
                    $('#content').load("Default3.aspx");
                } else {
                    $('#content').load("Default2.aspx");
                }
            });

            $('#listall').click(function () {
                $(this).addClass('uk-active');
                $('li').not($(this)).removeClass('uk-active');
                $('#content').load("ListAll.aspx");
            });

            $('#manage').click(function () {
                $(this).addClass('uk-active');
                $('li').not($(this)).removeClass('uk-active');
                $('#content').load("SetAsset.aspx");

            });

            $('#buyback').click(function () {
                $(this).addClass('uk-active');
                $('li').not($(this)).removeClass('uk-active');
                $('#content').load("BuyBack.aspx");
            });

            $('#auction').click(function () {
                $(this).addClass('uk-active');
                $('li').not($(this)).removeClass('uk-active');
                $('#content').load("Auction.aspx");

            });

            $('#managetray').click(function () {
                $(this).addClass('uk-active');
                $('li').not($(this)).removeClass('uk-active');
                $('#content').load("Managetray.aspx");

            });


        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <%-- header--%>
        <uc:UserControl ID="MyNav" runat="server" />
        <%-- End header--%>
        <asp:HiddenField ID="hiddenRole" runat="server" />
        <div class="uk-grid">
            <div class="uk-width-1-5">
                <ul class="uk-tab uk-tab-left uk-width-medium-1-1">
                    <li id="estimate"><a>ประเมินราคาตั๋ว</a></li>
                    <li id="listall"><a>รายการทรัพย์หลุดทั้งหมด</a></li>
                    <li id="manage"><a>จัดการทรัพย์หลุด</a></li>
                    <li id="managetray"><a>จัดถาด</a></li>
                    <li id="buyback"><a>ซื้อคืน</a></li>
                    <li id="auction"><a>ประมูลทรัพย์หลุด</a></li>
                </ul>
            </div>
            <div class="uk-width-3-5">

                <div id="content"></div>
            </div>
            <div class="uk-width-1-5">
            </div>
        </div>
    </form>
</body>
</html>
