<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BuyDay2.aspx.vb" Inherits="AuctionArea_BuyDay2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    


</head>
<body>
    <form id="form1" runat="server">
    <div id="PageLoad">
    <br />
    <header class="page-header">
            <h3 class="uk-h3"><i class="fa fa-file-text-o " aria-hidden="true"></i>&nbsp;ประกาศการขายทรัพย์หลุด</h3>
    </header>

    <asp:HiddenField ID="hiddenRole" runat="server" />
        <input type='button' id="btnAdd" value='เพิ่มประกาศ' style='color:#000000' class='uk-button uk-button-success' />
        <%--<input type='button' id="Button1" value='เพิ่มประกาศ' style='color:#000000' class='uk-button uk-width-1-1' onclick=\"ManageCon('" + data[i].EventID + "')\"/>--%>
        <table id="tableData" class="uk-table" border="1" style="width:1200px">
            <thead>
                <tr bgcolor="#ffcc00">
                    <td style="text-align: center">ลำดับ</td>

                    <td style="text-align: center; display: none">EventID</td>
                    <td style="text-align: center" width="50px">ประกาศ</td>
                    <td style="text-align: center" width="300px">วันเดือนปี</td>
                    <td style="text-align: center" width="400px">ประเภททรัพย์หลุดจำนำ</td>
                    <td style="text-align: center" width="200px">สถานที่จำหน่าย</td> 
                    <td style="text-align: center">เวลา</td>
                    <td style="text-align: center" width="500px">จากสถานธนานุบาลฯ</td>
                    <td style="text-align: center" width="10px">จัดการ</td>
                    <td style="text-align: center">ปรับปรุง</td>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>

        <div class="uk-modal" id="modalAlert">
            <div class="uk-modal-dialog">
                <div class="uk-modal-header uk-alert-danger">รายการ</div>
                <div class="uk-form">
                    ทำรายการเรียบร้อย
                </div>
            </div>

        </div>

        <div class="uk-modal" id="modalConfirm">
            <div class="uk-modal-dialog">
                <div class="uk-modal-header">ลบประกาศ</div>
                ต้องการปิดประกาศลงหรือไม่?
                <div class="uk-modal-footer" align="right">
                    <input type='button' id="BtnCancelYES" value='ตกลง' style='color:#000000' class='uk-button  uk-button-primary' />
                    <input type='button' id="BtnCancelNO" value='ยกเลิก' style='color:#000000' class='uk-button uk-button-danger uk-modal-close' />
                </div>
            </div>
        </div>

        <div class="uk-modal" id="modalAddEvent">
            <div class="uk-modal-dialog" style="width:65%">
                <div class="uk-modal-header uk-alert-danger">เพิ่มประกาศใหม่</div>
                <div class="uk-form" >
   
               <table class="uk-table uk-table-condensed">

                   <tr>
                       <td>
                           วันที่
                       </td>
                       <td >
                           <div class="uk-form"> 
                                <input id="txtDateEvent" type="text" data-uk-datepicker="{format:'YYYY-MM-DD'}" />
                                <%--<input id="txtDateEvent" type="text" />--%>
                            </div>
                       </td>
                       <td>เวลา</td>
                       <td>


                            <asp:DropDownList ID="ddlTime" runat="server" CssClass ="form-control ">
                                        <asp:ListItem Value="00:00"></asp:ListItem>
                                        <asp:ListItem Value="01:00"></asp:ListItem>
                                        <asp:ListItem Value="02:00"></asp:ListItem>
                                        <asp:ListItem Value="03:00"></asp:ListItem>
                                        <asp:ListItem Value="04:00"></asp:ListItem>
                                        <asp:ListItem Value="05:00"></asp:ListItem>
                                        <asp:ListItem Value="06:00"></asp:ListItem>
                                        <asp:ListItem Value="07:00"></asp:ListItem>
                                        <asp:ListItem Value="08:00"></asp:ListItem>
                                        <asp:ListItem Value="09:00"></asp:ListItem>
                                        <asp:ListItem Value="10:00"></asp:ListItem>
                                        <asp:ListItem Value="11:00"></asp:ListItem>
                                        <asp:ListItem Value="12:00"></asp:ListItem>
                                        <asp:ListItem Value="13:00"></asp:ListItem>
                                        <asp:ListItem Value="14:00"></asp:ListItem>
                                        <asp:ListItem Value="15:00"></asp:ListItem>
                                        <asp:ListItem Value="16:00"></asp:ListItem>
                                        <asp:ListItem Value="17:00"></asp:ListItem>
                                        <asp:ListItem Value="18:00"></asp:ListItem>
                                        <asp:ListItem Value="19:00"></asp:ListItem>
                                        <asp:ListItem Value="20:00"></asp:ListItem>
                                        <asp:ListItem Value="21:00"></asp:ListItem>
                                        <asp:ListItem Value="22:00"></asp:ListItem>
                                        <asp:ListItem Value="23:00"></asp:ListItem>
                                        
                                    </asp:DropDownList>
                            <%--<div class="uk-form"> 
                                <input id="txtTimeEvent" type="text" data-uk-timepicker="{format:'12h'}" runat="server" />
                            </div>--%>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           รายละเอียดสถานที่
                       </td>
                       <td>
                           <%--<input id="txtEventNo" type="text" class="uk-form-width-medium" runat="server" />--%>
                           <asp:TextBox ID="txtLocation" class="uk-form-width-medium" runat="server"></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           เลขประกาศ
                       </td>
                       <td>
                           <input id="txtEventNo" type="text" class="uk-form-width-medium" runat="server" />
                         <%--  <asp:TextBox ID="txtEventNo" class="uk-form-width-medium" runat="server"></asp:TextBox>--%>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           ประเภททรัพย์
                       </td>
                       <td>
                           <asp:DropDownList ID="DropProduct" runat="server" >     
                           </asp:DropDownList>
                       </td>     
                   </tr>
                   <tr>
                       <td>
                           สถานธนานุบาล
                       </td>
                       <td>
                       
                       <div class="page-header">
                                <h3><i class="fa fa-home" aria-hidden="true"></i>&nbsp;สาขา</h3>

                            </div>
                            <div id="branchBlg">
                                <div class="form-group row">
                                    <label class="control-label col-sm-2" for="email">สาขาที่ 1:</label>
                                    <div class="col-sm-10" id="brhBlg0">
                                        <%--<input type="text" class="form-control" id="commit0" placeholder="ประธานกรรมการ">--%>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">

                                    <a href="#" class="uk-button uk-button-primary" id="addBranch">
                                        <i class="fa fa-plus-circle" aria-hidden="true"></i>&nbsp;เพิ่มสาขา</a>
                                    <a href="#" class="uk-button uk-button-danger" id="removeBranch">
                                        <i class="fa fa-minus-circle" aria-hidden="true"></i>&nbsp;ลดสาขา</a>

                                </div>
                            </div>


                        <%--<asp:Repeater ID="RpListBranch" runat="server" >
                            <ItemTemplate>
                                <asp:CheckBox ID="chkboxBranch" runat="server" Text='<%# Container.DataItem("BranchID") %>'/><br />
                            </ItemTemplate>
                        </asp:Repeater>  --%> 
                        
                                       
                       </td>
                   </tr>
                   <tr>
                       <td></td>
                       <td>
                           
                       </td>
                   </tr>
               </table>
            </div>
            <div class="uk-modal-footer" align="right">
                <%--<asp:Button runat="server" ID="btnConfirm" Text="ยืนยันการเพิ่มข้อมูล" class="uk-button uk-button-danger"  />--%>
                <input type='button' id="btnAddEvent" value='เพิ่มประกาศ' style='color:#000000' class='uk-button uk-button-primary' />
                <input type='button' id="btnUpdateEvent" value='อัพเดทข้อมูล' style='color:#000000' class='uk-button uk-button-primary' />
                <input type='button' id="BtnCancelA" value='ยกเลิก' style='color:#000000' class='uk-button uk-button-danger uk-modal-close' />
                <%--<button class="uk-button uk-button-danger">ยืนยันการบันทึกรายการ</button>--%>
            
            </div>

            </div>
        </div>

        <div id="ManageCommit">
        </div>

        
        </div>

    </form>
    <div id="Content"></div>
</body>


<script type="text/javascript">
    var branchNum = 0;
    var vEventID = 0;
    var gEventID = "";
    $(document).ready(function () {

        innerDrw(0, "branch" ,-1);
        loadDataEventAll()
        getProduct();
        
    });


    function AlertModal(ModalName) {
        var modalName = "#" + ModalName;
        var modal = UIkit.modal(modalName);

        if (modal.isActive()) {
            modal.hide();
        } else {
            modal.show();
        }
    }

    $("#btnAddEvent").click(function () {
        AddEvent();
        //getRowBranch("TEST");
    });

    function Btnupdate(EventID) {
        vEventID = EventID;

        //getProduct();
        AlertModal("modalAddEvent");
        $("#btnAddEvent").hide();
        $("#btnUpdateEvent").show();
        getDataEvent(vEventID);
        editRow(vEventID);
    }

    $('#btnUpdateEvent').click(function () {
        deleteBranch();
        UpdateEvent();
        getRowBranch(vEventID);
        AlertModal("modalAlert");
        loadDataEventAll();
    });

    $("#BtnCancelYES").click(function () {
        CancelEvent(vEventID);
        deleteBranch(vEventID);
        AlertModal("modalAlert");
        loadDataEventAll();
        
    });
    $("#BtnCancelNO").click(function () {
        loadDataEventAll();
    });


    $('#btnAdd').click(function () {
        AlertModal("modalAddEvent");
        $("#btnAddEvent").show();
        $("#btnUpdateEvent").hide();
        $('#txtDateEvent').val('');
        $('#ddlTime').val(0);
        $('#txtLocation').val('');
        $('#txtEventNo').val('');
        $('#DropProduct').val(0);
        //getProduct();

    });

    $("#addBranch").click(function () {
        branchNum++;
        addBranchRow(branchNum, -1);
    });

    $("#removeBranch").click(function () {
        if (branchNum > 0) {
            removeBranchRow(branchNum)
            branchNum--;
        }
    });
    
    //สำหรับสร้าง dropdownList
    function innerDrw(num, type, Id) {
        $.ajax({
            url: "./AuctionArea/Committee_ajax.aspx",
            data: "num=" + num + "&type=" + type + "&Id=" + Id,
            method: "POST",
            beforeSend: function () {
                if (type == "committ") {
                    $("#drlBlg" + num).html('<i class="fa fa-spinner fa-spin"></i>');
                } else {
                    $("#brhBlg" + num).html('<i class="fa fa-spinner fa-spin"></i>');
                }
            },
            success: function (data) {
                if (type == "committ") {
                    $("#drlBlg" + num).html(data);
                } else {
                    $("#brhBlg" + num).html(data);
                    //alert(data);
                }
            }
        });
    }

    function addBranchRow(num, branchId) {

        var comittCont = "<div class=\"form-group\" id=\"branchNumRow" + num + "\">";
        comittCont += "<label class=\"control-label col-sm-2\" for=\"pwd\">สาขาที่ " + (num + 1) + ":</label>";
        comittCont += "<div class=\"col-sm-10\" id=\"brhBlg" + num + "\">";
        comittCont += "</div>";
        comittCont += "</div>";

        $("#branchBlg").append(comittCont);
        //$('html, body').animate({ scrollTop: $("#branchBlg").offset().top }, 2000);
        innerDrw(num, "branch", branchId);
    }
    function removeBranchRow(num) {
        var element = "#branchNumRow" + num;
        $("" + element + "").remove();
        $('html, body').animate({ scrollTop: $("#branchBlg").offset().top }, 2000);
    }


    function loadDataEventAll() {
        $.ajax({
            type: "POST",
            url: "ajax/ajax_AuctionArea/LoadEventAll.aspx",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                $('#tableData tbody').empty();

                for (i = 0; i < data.length; i++) {
                    $('#tableData tbody').append(
                        "<tr>" +
                            "<td style='text-align:center'>" + (i + 1) + "</td>" +

                            "<td style='text-align:center;display:none;'>" + data[i].EventID + "</td>" +
                            "<td style='text-align:center'>" + data[i].EventNo + "</td>" +
                            "<td style='text-align:center'>" + data[i].fDateEventStart + "</td>" +
                            "<td style='text-align:center'>" + data[i].GroupName + "</td>" +
                            "<td style='text-align:center'>" + data[i].Location + "</td>" +
                            "<td style='text-align:center'>" + data[i].TIME + "</td>" +
                            "<td style='text-align:center'>" + data[i].BranchName + "</td>" +
                            "<td style='text-align:center'><input type='button' value='จัดกรรมการ' style='color:#000000' class='uk-button uk-width-1-1' onclick=\"ManageCom('" + data[i].EventID + "','" + data[i].EventNo + "','" + data[i].fDateEventStart + "','" + data[i].GroupName + "')\"/>"
                            + "<input type='button' value='จัดกรรมการควบคุม' style='color:#000000' class='uk-button uk-width-1-1' onclick=\"ManageCon('" + data[i].EventID + "')\"/>"
                            + "<input type='button' value='จัดพนักงานบัญชี' style='color:#000000' class='uk-button uk-width-1-1' onclick=\"ManageACc('" + data[i].EventID + "')\"/>"
                            + "<input type='button' value='จัดเจ้าหน้าที่เสนอทรัพย์' style='color:#000000' class='uk-button uk-width-1-1' onclick=\"ManageEProduct('" + data[i].EventID + "')\"/>"
                            + "<input type='button' value='จัดโฆษก' style='color:#000000' class='uk-button uk-width-1-1' onclick=\"ManageSpokesman('" + data[i].EventID + "')\"/></td>"
                            + "<td style='text-align:center'><input type='button' value='แก้ไข' style='color:#000000' class='uk-button uk-width-1-1' onclick=\"Btnupdate('" + data[i].EventID + "')\"/>"
                            + "<input type='button' value='ลบ' style='color:#ffffff' class='uk-button uk-width-1-1 uk-button-danger' onclick=\"Btncancel('" + data[i].EventID + "')\"/></td>" +
                        "</tr>"
                         );
                }

            },
            error: function ajaxError(result) {
                alert(result.status + ":" + result.statusText);
            }
        });n
    }

    function ManageCom(EventID, EventNo, DateEventStart, GroupName) {
        //$("#Content").load("AuctionArea/Committtee.aspx?EventID=" + EventID);
        window.open("AuctionArea/Committtee.aspx?EventID=" + EventID + "&EventNo=" + EventNo + "&DateEventStart=" + DateEventStart + "&GroupName=" + GroupName, '_blank', 'toolbar=0,location=0,menubar=0');
        //Console.log(EventID);
    }


    function AddEvent() {
        var vDateStartEvent = $('#txtDateEvent').val();
        var vEventNo = $('#txtEventNo').val();
        var vProductType = $('#DropProduct').val();
        var vTime = $('#ddlTime').val();
        var vLocation = $('#txtLocation').val();
        
//        alert(vDateStartEvent + "-----" + vEventNo + "-----" + vProductType + "-----" + vTime);
        $.ajax({
            url: "ajax/ajax_AuctionArea/AddEvent.aspx",
            data: "DateStartEvent=" + vDateStartEvent + "&EventNo=" + vEventNo + "&ProductType=" + vProductType + "&Time=" + vTime + "&Location=" + vLocation + "&type=AddEvent",
            method: "POST",
            success: function (data) {

                gEventID = data;
                //alert(gEventID);
                getRowBranch(gEventID);
                loadDataEventAll();
            }

        });
    }

    function editRow(eventId) {
        editRowBranch(eventId);
        //editRowEmp(rowId, eventId);
        $('html, body').animate({ scrollTop: $("#branchBlg").offset().top }, 2000);
    }

    //getRowwwwwwwwBranch
    function editRowBranch(eventId) {
        var result = "";
        $.ajax({
            url: "ajax/ajax_AuctionArea/GetEventBranch.aspx",
            data: "eventId=" + eventId + "&type=getEventBranch",
            method: "POST",
            async: false,
            success: function (data) {
                result = data;
                //alert(data);
            }
        });
        
        var arr = result.split(',');
        if (branchNum > 0) {
            for (i = branchNum; i > 0; i--) {
                removeBranchRow(i)
                branchNum--;
            }
        }
        //alert(result);
        for (i = 1; i <= arr.length - 1; i++) {
            //alert(arr[i]);
            if (i == 1) {
                innerDrw(i - 1, "branch", arr[i]);
            } else {
                branchNum++;
                addBranchRow(i - 1, arr[i]);
            }
            //innerDrw(i-1, "branch");
        }
    }

    function getRowBranch(gEventID) {
        //ตัวอย่าง สำหรับส่ง data
        //alert(branchNum);
        //var memberTypeId = 0;
        //var rownum = getMaxRowNum();

        for (j = 0; j <= branchNum; j++) {
            //alert($("#commit" + i).val() + "," + $("#branch" + j).val());
            //alert(gEventID, $("#branch" + j).val());
            AddEventBranch(gEventID, $("#branch" + j).val());
        }
    }

    function AddEventBranch(vEventid,vBranchid) {
        $.ajax({
            url: "ajax/ajax_AuctionArea/AddEventBranch.aspx",
            data: "eventid=" + vEventid + "&branchid=" + vBranchid + "&type=AddEventBranch",
            method: "POST",
            success: function (data) {
                //alert(data)

                AlertModal("modalAlert");
                loadDataEventAll();
            }



        });
    }

    function UpdateEvent() {
        var vDateStartEvent = $('#txtDateEvent').val();
        var vEventNo = $('#txtEventNo').val();
        var vProductType = $('#DropProduct').val();
        var vTime = $('#ddlTime').val();
        var vLocation = $('#txtLocation').val();


                //alert(vDateStartEvent + "-----" + vEventNo + "-----" + vProductType + "-----" + vTime);
        $.ajax({
            url: "ajax/ajax_AuctionArea/UpdateEvent.aspx",
            data: "eventid=" +vEventID +"&DateStartEvent=" + vDateStartEvent + "&EventNo=" + vEventNo + "&ProductType=" + vProductType + "&Time=" + vTime + "&Location=" + vLocation + "&type=UpdateEvent",
            method: "POST",
            success: function (data) {
                //alert(data)
                AlertModal("modalAlert");
                loadDataEventAll()
            }

        });

    }
    function deleteBranch() {
        
            $.ajax({
                url: "ajax/ajax_AuctionArea/DeleteBranchEvent.aspx",
                data: "eventId=" + vEventID + "&type=deleteBranch",
                method: "POST",
                success: function (data) {
//                    if (data.trim() == "True") {
//                        //alert("ลบข้อมูลเรียบร้อย");
//                        //LoadDefault(1);
//                    } else {
//                        alert("เกิดความผิดพลาด");
//                    }
                }
            });
        

    
    }
   
    function CancelEvent(EventID) {
//        alert(EventID);
        $.ajax({
            url: "ajax/ajax_AuctionArea/CancelEvent.aspx",
            data: "eventId=" + EventID + "&type=CancelEvent",
            method: "POST",
            success: function (data) {
                //alert("Success");
                
            }

        });
    }

    function getProduct(){
    $.ajax({
                type: "POST",
                url: "ajax/ajax_AuctionArea/GetProductGroup.aspx",
                contentType: "application/json; charset=utf-8",
                data: {},
                dataType: "json",
                success: function (data) {
                    var ddlCategory = $('#DropProduct')
                    ddlCategory.empty().append('<option selected="selected" value="0">กรุณาเลือกประเภท</option>');
                    $.each(data, function (key, value) {
                        ddlCategory.append($("<option></option>").val(value.ID).html(value.GroupName));
                    });
                },
                error: function ajaxError(result) {
                    //alert(result.status + ":" + result.statusText);
                }

            });
        }

        

        function getDataEvent(EventID) {
            
            data = "eventId=" + EventID;
            $.ajax({
                type: "POST",
                url: "ajax/ajax_AuctionArea/GetDataEventAll.aspx",
                data: data,
                dataType: "json",
                success: function (data) {
                    //alert(data[0].ProductTypeID);
                    $('#txtDateEvent').val(data[0].DateEventStart);
                    $('#txtLocation').val(data[0].Location);
                    $('#txtEventNo').val(data[0].EventNo);
                    $('#DropProduct').val(data[0].ProductTypeID);
                    $('#ddlTime').val(data[0].TIME);
                }
            });

        }


        function Btncancel(EventID) {
            var vEventID = EventID;
            AlertModal("modalConfirm");

        }





//    function ManageCom(EventID) {

//        //$("#ManageCommit").load("ajax/test.html");
//    }

</script>


</html>
