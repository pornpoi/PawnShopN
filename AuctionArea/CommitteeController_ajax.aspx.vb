Imports System.Data
Imports System.Web.UI
Imports Oracle.DataAccess.Client
Imports System.IO
Imports System.Exception
Imports System.Linq
Imports System.Data.Linqd
Partial Class AuctionArea_CommitteeController_ajax
    Inherits System.Web.UI.Page
    Private Sub AdminConfig_Committee_ajax_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim type As String = Request.Form("type")
        If (type = "committ") Then
            Dim drlNum As String = Request.Form("num")
            LoadDefault(drlNum, Request.Form("Id"))
        ElseIf (type = "branch") Then
            Dim drlNum As String = Request.Form("num")
            LoadBranch(drlNum, Request.Form("Id"))
        ElseIf (type = "addData") Then
            AddCommittee(Request.Form("eventId"), Request.Form("memberTypeId"), Request.Form("userId"), Request.Form("branchId"), Request.Form("rowNum"))
        ElseIf (type = "getRowNum") Then
            Response.Write(GetMaxCommitteeRowNumInt().ToString)
        ElseIf (type = "loadDefault") Then
            LoadAllData(Request.Form("eventId"))
        ElseIf (type = "deleteRow") Then
            Response.Write(DeleteRow(Request.Form("eventId"), Request.Form("rowNum")))
        ElseIf (type = "editRowBranch") Then
            LoadBranchDataForEdit(Request.Form("eventId"), Request.Form("rowNum"))
        ElseIf (type = "editRowEmp") Then
            LoadEmpDataForEdit(Request.Form("eventId"), Request.Form("rowNum"))
        Else
            Response.Write("aaa")
        End If
    End Sub
    Sub LoadDefault(ByVal num As String, Optional ByVal EmpId As String = "")
        Dim dt As New DataTable
        dt = getEmployeeddl()
        Dim result As String = ""
        result &= "<select id='commit" & num & "' class='form-control'>"
        result &= "<option value='-1'>--กรุณาเลือกกรรมการ--</option>"
        For Each dr As DataRow In dt.Rows
            result &= "<option value='" & dr("EmployeeId") & "'" & If(EmpId = dr("EmployeeId"), "selected", "") & ">" & dr("FullName") & "</option>"
        Next
        result &= "</select>"
        Response.Write(result)
    End Sub
    Sub LoadBranch(ByVal num As String, Optional ByVal branchId As Integer = -1)
        Dim dtBranch As New DataTable
        Dim result As String = ""

        dtBranch = getBranch()
        result &= "<select id='branch" & num & "'  class='form-control '>"
        result &= "<option value='-1'>--กรุณาเลือกสาขา--</option>"
        For Each dr As DataRow In dtBranch.Rows
            result &= "<option value='" & dr("BranchId") & "' " & If(branchId = dr("BranchId"), "selected", "") & ">" & dr("Name") & "</option>"
        Next
        result &= "</select>"
        Response.Write(result)
    End Sub

    Sub LoadEmpDataForEdit(ByVal EventId As String, ByVal RowNum As Integer)
        Dim dt As New DataTable
        Dim result As String = ""
        Dim empSet As String = ""
        Dim count As Integer = 0
        dt = getCommitteeMemberByEventIdAndRowNum(EventId, RowNum)
        Dim distDTEmp = dt.AsEnumerable().Select(Function(rowData) New With {
                Key .RowNum = rowData.Field(Of Decimal)("RowNum"),
                Key .EmployeeId = rowData.Field(Of String)("EmployeeId")
                }).Distinct()
        For Each distDTEmpRow In distDTEmp
            empSet &= "," & distDTEmpRow.EmployeeId
            count = count + 1
        Next
        result &= count & empSet
        Response.Write(result)

    End Sub

    Sub LoadBranchDataForEdit(ByVal EventId As String, ByVal RowNum As Integer)
        Dim dt As New DataTable
        Dim result As String = ""
        Dim branchSet As String = ""
        Dim count As Integer = 0
        dt = getCommitteeMemberByEventIdAndRowNum(EventId, RowNum)
        Dim distDTBranch = dt.AsEnumerable().Select(Function(rowData) New With {
                Key .RowNum = rowData.Field(Of Decimal)("RowNum"),
                Key .BranchId = rowData.Field(Of Decimal)("BranchId")
                }).Distinct()
        For Each distDTBranchRow In distDTBranch
            branchSet &= "," & distDTBranchRow.BranchId
            count = count + 1
        Next
        result &= count & branchSet
        Response.Write(result)

    End Sub
    Sub LoadAllData(ByVal num As String)
        Dim dt As New DataTable
        Dim result As String = "<table class='table table-striped table-bordered table-hover' border='1'>"
        result &= "<thead><tr><th>สถานธนานุบาลกรุงเทพมหานคร</th><th>คณะกรรมการประเมินทรัพย์หลุดจำนำ</th><th>ตำแหน่ง</th><th>&nbsp;</th></tr></thead>"

        dt = getCommitteeMemberByEventId(num)

        'ชุดข้อมูลของจำนวนแถวชุดข้อมูล
        Dim distDTRowNum = dt.AsEnumerable().Select(Function(row) New With {
                Key .RowNum = row.Field(Of Decimal)("RowNum")
        }).Distinct()

        For Each row In distDTRowNum
            result &= "<tr>"

            Dim editBtn As String = "<a href='#' class='btn btn-primary btn-sm' onclick=""editRow(" & row.RowNum & "," & "'" & num & "')""><i class='fa fa-pencil' aria-hidden='true'></i>&nbsp;แก้ไข</a>"
            Dim deleteBtn As String = "<a href='#' class='btn btn-danger btn-sm' onclick=""deleteRow(" & row.RowNum & "," & "'" & num & "')""><i class='fa fa-times' aria-hidden='True'></i>&nbsp;ลบ</a>"
            'ชุดข้อมูลของสาขา
            Dim distDTBranch = dt.AsEnumerable().Select(Function(rowData) New With {
                Key .RowNum = rowData.Field(Of Decimal)("RowNum"),
                Key .BranchName = rowData.Field(Of String)("BranchName")
                }).Distinct().Where(Function(rownum) rownum.RowNum = row.RowNum)
            result &= "<td>"
            For Each distDTBranchRow In distDTBranch
                result &= distDTBranchRow.BranchName & "<br />"
            Next
            result &= "</td>"
            'จบชุดข้อมูลของสาขา

            'ชุดข้อมูลของพนักงาน
            Dim MemberTypeNameVal = ""
            Dim distDTEmp = dt.AsEnumerable().Select(Function(rowData) New With {
                Key .RowNum = rowData.Field(Of Decimal)("RowNum"),
                Key .FullName = rowData.Field(Of String)("FULLNAME"),
                Key .MemberTypeName = rowData.Field(Of String)("MemberTypeName")
                }).Distinct().Where(Function(rownum) rownum.RowNum = row.RowNum)
            result &= "<td>"
            For Each distDTEmpRow In distDTEmp
                result &= distDTEmpRow.FullName & "<br />"
                MemberTypeNameVal &= distDTEmpRow.MemberTypeName & "<br />"
            Next
            result &= "</td>"
            'จบชุดข้อมูลของพนักงาน

            'ชุดข้อมูตำแหน่ง
            result &= "<td>" & MemberTypeNameVal & "</td>"
            result &= "<td>" & editBtn & "&nbsp;" & deleteBtn & "</td>"
            result &= "</tr>"
        Next

        result &= "</table>"
        'DataTable.InnerHtml = result
        Response.Write(result)

    End Sub
    Public Shared Function getCommitteeMemberByEventId(ByVal eventId As String) As DataTable
        Dim dt As New DataTable
        Dim da As New OracleDataAdapter
        Dim con As New OracleConnection
        Dim cmd As New OracleCommand
        con = getAssetConnection()
        cmd.Connection = con
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = """sp_getCommitteeMemberByEventId"""
        cmd.Parameters.Add(New OracleParameter("vEventId", OracleDbType.NVarchar2)).Value = eventId
        cmd.Parameters.Add(New OracleParameter("cur", OracleDbType.RefCursor)).Direction = ParameterDirection.Output

        Try
            da.SelectCommand = cmd
            da.Fill(dt)
        Catch ex As Exception

        Finally
            con.Close()
        End Try

        Return dt
    End Function

    Public Shared Function getCommitteeMemberByEventIdAndRowNum(ByVal eventId As String, ByVal rowNum As Integer) As DataTable
        Dim dt As New DataTable
        Dim da As New OracleDataAdapter
        Dim con As New OracleConnection
        Dim cmd As New OracleCommand
        con = getAssetConnection()
        cmd.Connection = con
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = """sp_getCommitteeMemberForEdit"""
        cmd.Parameters.Add(New OracleParameter("vEventId", OracleDbType.NVarchar2)).Value = eventId
        cmd.Parameters.Add(New OracleParameter("vRowNum", OracleDbType.Int32)).Value = rowNum
        cmd.Parameters.Add(New OracleParameter("cur", OracleDbType.RefCursor)).Direction = ParameterDirection.Output

        Try
            da.SelectCommand = cmd
            da.Fill(dt)
        Catch ex As Exception

        Finally
            con.Close()
        End Try

        Return dt
    End Function

    Public Shared Function getConnection() As OracleConnection
        Dim con As New OracleConnection(ConfigurationManager.ConnectionStrings("PawnShopData").ToString)
        con.Open()
        Return con
    End Function
    Public Shared Function getAssetConnection() As OracleConnection
        Dim con As New OracleConnection(ConfigurationManager.ConnectionStrings("PawnAsset").ToString)
        con.Open()
        Return con
    End Function

    Public Shared Function getEmployeeddl() As DataTable
        Dim dt As New DataTable
        Dim da As New OracleDataAdapter
        Dim con As New OracleConnection
        Dim cmd As New OracleCommand
        con = getConnection()
        cmd.Connection = con
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = """SP_GET_EMPLOYEE_ODB_FULLNAME"""
        cmd.Parameters.Add(New OracleParameter("cur", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
        Try
            da.SelectCommand = cmd
            da.Fill(dt)
        Catch ex As Exception

        Finally
            con.Close()
        End Try

        Return dt
    End Function
    Public Shared Function getBranch() As DataTable
        Dim dt As New DataTable
        Dim da As New OracleDataAdapter
        Dim con As New OracleConnection
        Dim cmd As New OracleCommand
        con = getConnection()
        cmd.Connection = con
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = """SP_BRANCH"""
        cmd.Parameters.Add(New OracleParameter("cur", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
        Try
            da.SelectCommand = cmd
            da.Fill(dt)
        Catch ex As Exception

        Finally
            con.Close()
        End Try

        Return dt
    End Function

    Public Shared Function GetMaxCommitteeRowNumInt() As Integer
        Dim dt As New DataTable
        Dim da As New OracleDataAdapter
        Dim con As New OracleConnection
        Dim cmd As New OracleCommand
        Dim liMaxCommitteeRowNum As Integer

        con = getAssetConnection()
        cmd.Connection = con
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = """sp_getMaxRowNumCommittee"""
        cmd.Parameters.Add(New OracleParameter("cur", OracleDbType.RefCursor)).Direction = ParameterDirection.Output

        Try
            da.SelectCommand = cmd
            da.Fill(dt)
            If IsNothing(dt.Rows(0)("MaxRowNum")) Or dt.Rows(0)("MaxRowNum").ToString.Equals("") Then
                liMaxCommitteeRowNum = 1
            Else
                liMaxCommitteeRowNum = CInt(dt.Rows(0)("MaxRowNum").ToString)
            End If
            con.Close()
        Catch ex As Exception

        Finally

        End Try

        Return liMaxCommitteeRowNum

    End Function
    Public Shared Function getMaxCommitteeMemberId() As DataTable
        Dim dt As New DataTable
        Dim da As New OracleDataAdapter
        Dim con As New OracleConnection
        Dim cmd As New OracleCommand
        con = getAssetConnection()
        cmd.Connection = con
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = """sp_getMaxCommitteeMemberId"""
        cmd.Parameters.Add(New OracleParameter("cur", OracleDbType.RefCursor)).Direction = ParameterDirection.Output

        Try
            da.SelectCommand = cmd
            da.Fill(dt)
        Catch ex As Exception

        Finally
            con.Close()
        End Try

        Return dt
    End Function

    Public Shared Function AddCommittee(ByVal vEventId As String, ByVal vMemberTypeId As Integer,
                                         ByVal vUserId As String, ByVal vBranchId As Integer, ByVal vRowNum As Integer) As Boolean

        Dim liMaxCommitteeMemberId As Integer
        Dim dt2 As New DataTable
        dt2 = getMaxCommitteeMemberId()
        If IsNothing(dt2.Rows(0)("MaxCommitteeMemberId")) Or dt2.Rows(0)("MaxCommitteeMemberId").ToString.Equals("") Then
            liMaxCommitteeMemberId = 1
        Else
            liMaxCommitteeMemberId = CInt(dt2.Rows(0)("MaxCommitteeMemberId").ToString)
        End If

        Dim dt As New DataTable
        Dim da As New OracleDataAdapter
        Dim con As New OracleConnection
        Dim cmd As New OracleCommand
        con = getAssetConnection()
        cmd.Connection = con
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = """sp_InsertCommitteeMember"""
        cmd.Parameters.Add(New OracleParameter("vCommitteeMemberId", OracleDbType.Int32)).Value = liMaxCommitteeMemberId
        cmd.Parameters.Add(New OracleParameter("vEventId", OracleDbType.NVarchar2)).Value = vEventId
        cmd.Parameters.Add(New OracleParameter("vMemberTypeId", OracleDbType.Int32)).Value = vMemberTypeId
        cmd.Parameters.Add(New OracleParameter("vUserId", OracleDbType.NVarchar2)).Value = vUserId
        cmd.Parameters.Add(New OracleParameter("vBranchId", OracleDbType.Int32)).Value = vBranchId
        cmd.Parameters.Add(New OracleParameter("vRowNum", OracleDbType.Int32)).Value = vRowNum
        cmd.Parameters.Add(New OracleParameter("vRowNum", OracleDbType.Int32)).Value = "0"
        cmd.Parameters.Add(New OracleParameter("vRowNum", OracleDbType.Int32)).Value = "0"

        Try
            cmd.ExecuteNonQuery()
            Return True
        Catch ex As Exception
            Throw ex
            'Return False
        Finally
            con.Close()
        End Try

    End Function

    Public Shared Function DeleteRow(ByVal vEventId As String, ByVal vRowNum As Integer) As Boolean

        Dim dt As New DataTable
        Dim da As New OracleDataAdapter
        Dim con As New OracleConnection
        Dim cmd As New OracleCommand
        con = getAssetConnection()
        cmd.Connection = con
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = """sp_DeleteCommitteeMember"""
        cmd.Parameters.Add(New OracleParameter("vEventId", OracleDbType.NVarchar2)).Value = vEventId
        cmd.Parameters.Add(New OracleParameter("vRowNum", OracleDbType.Int32)).Value = vRowNum

        Try
            cmd.ExecuteNonQuery()
            Return True
        Catch ex As Exception
            Throw ex
            'Return False
        Finally
            con.Close()
        End Try

    End Function
End Class
