var committNum = 2;
    var branchNum = 0;

    var v_rowId = -1;
    //รับค่าจากหน้าเต้ย
    //var v_eventId = 1;
    var v_eventId = <%=eventId %>;
    $(document).ready(function () {
        LoadDefault(v_eventId);
        //load dropdown สำหรับกรรมการคนที่ 1-3
        for (j = 0; j <= 2; j++) {
            innerDrw(j, "committ", -1);
        }
        //Load dropdown สำหรับสาขา
        innerDrw(0, "branch", -1);

        $("#GetRow").click(function () {
            alert(getMaxRowNum());
            return false;
        });

        $("#addComitt").click(function () {
            committNum++;
            addCommittRow(committNum);
            $('html, body').animate({ scrollTop: $("#committBlog").offset().top }, 2000);
        });

        $("#removeComitt").click(function () {
            if (committNum > 2) {
                removeCommittRow(committNum)
                committNum--;
            }
            $('html, body').animate({ scrollTop: $("#committBlog").offset().top }, 2000);
        });

        $("#addBranch").click(function () {
            branchNum++;
            addBranchRow(branchNum, -1);
            //$('html, body').animate({ scrollTop: $("#branchBlg").offset().top }, 2000);
        });

        $("#removeBranch").click(function () {
            if (branchNum > 0) {
                removeBranchRow(branchNum)
                branchNum--;
            }
            //$('html, body').animate({ scrollTop: $("#branchBlg").offset().top }, 2000);
        });

        $("#save").click(function () {
            var memberTypeId = 0;
            var rownum = getMaxRowNum();
            for (i = 0; i <= committNum; i++) {
                if (i >= 3) {
                    memberTypeId = 4;

                } else {
                    memberTypeId = i + 1;
                }
                for (j = 0 ; j <= branchNum; j++) {
                    //alert($("#commit" + i).val() + "," + $("#branch" + j).val());
                    addDataToDB(v_eventId, memberTypeId, $("#commit" + i).val(), $("#branch" + j).val(), rownum);
                }
            }
            alert("บันทึกข้อมูลเรียบร้อย");
            LoadDefault(v_eventId);
            $('#myModal').modal('hide');
            LoadDropdownDefault();
            $('html, body').animate({ scrollTop: $("#dataTable").offset().top }, 2000);
            return false;
        });

        $('#update').click(function () {
            //ลบข้อมูลเดิมออก
            $.ajax({
                url: "./AuctionArea/Committee_ajax.aspx",
                data: "eventId=" + v_eventId + "&rowNum=" + v_rowId + "&type=deleteRow",
                method: "POST",
                success: function (data) {
                    if (data.trim() == "True") {
                        console.log("delsuccess");
                        //alert("ลบข้อมูลเรียบร้อย");
                        //LoadDefault(1);
                    } else {
                        alert("เกิดความผิดพลาด");
                    }
                }
            });
            //ใส่ข้อมูลใหม่ลงไป
            var memberTypeId = 0;
            var rownum = getMaxRowNum();
            for (i = 0; i <= committNum; i++) {
                if (i >= 3) {
                    memberTypeId = 4;

                } else {
                    memberTypeId = i + 1;
                }
                for (j = 0 ; j <= branchNum; j++) {
                    //alert($("#commit" + i).val() + "," + $("#branch" + j).val());
                    addDataToDB(v_eventId, memberTypeId, $("#commit" + i).val(), $("#branch" + j).val(), rownum);
                }
            }
            alert("อัพเดทข้อมูลเรียบร้อย");
            LoadDefault(v_eventId);
            $('#myModal').modal('hide');
            LoadDropdownDefault();
            //$('html, body').animate({ scrollTop: $("#dataTable").offset().top }, 2000);
            return false;
        });

        $("#closeBtn").click(function () {
            LoadDropdownDefault();
        });
        $("#addDataBtn").click(function () {
            $('#save').show();
            $('#update').hide();
        });

    });

    function LoadDefault(num) {
        $.ajax({
            url: "./AuctionArea/Committee_ajax.aspx",
            data: "type=loadDefault" + "&eventId=" + num,
            method: "POST",
            async: false,
            success: function (data) {
                $("#dataTable").html(data);
            }
        });
    }
    function LoadDropdownDefault() {
        //ชุดข้อมูลพนักงาน
        if (committNum > 2) {
            for (i = committNum; i > 2 ; i--) {
                removeCommittRow(i)
                committNum--;
            }
        }
        for (i = 1; i <= 3 ; i++) {
            //alert(arr[i]);
            if (i <= 3) {
                innerDrw(i - 1, "committ", -1);
            } else {
                committNum++;
                addCommittRow(i - 1, -1);
            }
        }
        //ชุดข้อมูลสาขา
        if (branchNum > 0) {
            for (i = branchNum; i > 0 ; i--) {
                removeBranchRow(i)
                branchNum--;
            }
        }
        for (i = 1; i <= 1; i++) {
            //alert(arr[i]);
            if (i == 1) {
                innerDrw(i - 1, "branch", -1);
            } else {
                branchNum++;
                addBranchRow(i - 1, -1);
            }
        }
    }

    function editRow(rowId, eventId) {
        $('#save').hide();
        $('#update').show();
        $('#myModal').modal('show');
        v_rowId = rowId;
        v_eventId = eventId;
        editRowBranch(rowId, eventId);
        editRowEmp(rowId, eventId);
        //$('html, body').animate({ scrollTop: $("#branchBlg").offset().top }, 2000);
    }

    function editRowEmp(rowId, eventId) {
        var result = "";
        //$('#myModal').modal('show');
        $.ajax({
            url: "./AuctionArea/Committee_ajax.aspx",
            data: "eventId=" + eventId + "&rowNum=" + rowId + "&type=editRowEmp",
            method: "POST",
            async: false,
            success: function (data) {
                result = data;
            }
        });

        var arr = result.split(',');
        if (committNum > 2) {
            for (i = committNum; i > 2 ; i--) {
                removeCommittRow(i)
                committNum--;
            }
        }
        //alert(result);
        for (i = 1; i <= arr.length - 1; i++) {
            //alert(arr[i]);
            if (i <= 3) {
                innerDrw(i - 1, "committ", arr[i]);
            } else {
                committNum++;
                addCommittRow(i - 1, arr[i]);
            }
            //innerDrw(i-1, "branch");
        }
    }

    function editRowBranch(rowId, eventId) {
        //$('#myModal').modal('show');
        var result = "";
        $.ajax({
            url: "./AuctionArea/Committee_ajax.aspx",
            data: "eventId=" + eventId + "&rowNum=" + rowId + "&type=editRowBranch",
            method: "POST",
            async: false,
            success: function (data) {
                result = data;
            }
        });

        var arr = result.split(',');
        if (branchNum > 0) {
            for (i = branchNum; i > 0 ; i--) {
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


    function deleteRow(rowId, eventId) {
        //alert(rowId + "," + eventId);
        if (confirm('คุณต้องการลบข้อมูล') == true) {
            $.ajax({
                url: "./AuctionArea/Committee_ajax.aspx",
                data: "eventId=" + eventId + "&rowNum=" + rowId + "&type=deleteRow",
                method: "POST",
                success: function (data) {
                    if (data.trim() == "True") {
                        //alert("ลบข้อมูลเรียบร้อย");
                        LoadDefault(v_eventId);
                    } else {
                        alert("เกิดความผิดพลาด");
                    }
                }
            });
        }

    }

    //เก็บเพิ่มข้อมูลลง DB
    function addDataToDB(eventId, memberTypeId, userId, branchId, rowNum) {
        $.ajax({
            url: "./AuctionArea/Committee_ajax.aspx",
            data: "eventId=" + eventId + "&memberTypeId=" + memberTypeId + "&userId=" + userId + "&branchId=" + branchId + "&rowNum=" + rowNum + "&type=addData",
            method: "POST",
            success: function (data) {
                //alert("บันทึกข้อมูลเรียบร้อยค่ะ");
                //alert(data);
            }
        });
    }
    function getMaxRowNum() {
        var result = "";
        $.ajax({
            url: "./AuctionArea/Committee_ajax.aspx",
            data: "type=getRowNum",
            method: "POST",
            async: false,
            success: function (data) {
                result = data;
            }

        });
        return result;
    }

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
    function addCommittRow(num, empId) {

        var comittCont = "<div class=\"form-group\" id=\"comittNumRow" + num + "\">";
        comittCont += "<label class=\"control-label col-sm-2\" for=\"pwd\">กรรมการคนที่ " + num + ":</label>";
        comittCont += "<div class=\"col-sm-10\" id=\"drlBlg" + num + "\">";
        comittCont += "</div>";
        comittCont += "</div>";

        $("#committBlog").append(comittCont);

        innerDrw(num, "committ", empId)
    }
    function removeCommittRow(num) {
        var element = "#comittNumRow" + num;
        $("" + element + "").remove();

    }

    function addBranchRow(num, branchId) {

        var comittCont = "<div class=\"form-group\" id=\"branchNumRow" + num + "\">";
        comittCont += "<label class=\"control-label col-sm-2\" for=\"pwd\">สาขาที่ " + (num + 1) + ":</label>";
        comittCont += "<div class=\"col-sm-10\" id=\"brhBlg" + num + "\">";
        comittCont += "</div>";
        comittCont += "</div>";

        $("#branchBlg").append(comittCont);
        innerDrw(num, "branch", branchId);
    }
    function removeBranchRow(num) {
        var element = "#branchNumRow" + num;
        $("" + element + "").remove();
    }
    //////