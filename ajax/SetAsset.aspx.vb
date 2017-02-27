Imports System.Data
Imports Newtonsoft.Json
Imports System.IO
Imports System.Collections.Generic
Imports System.Exception
Imports PSCS.Libary.Models
Imports DataConnection.DataAccessClassAsset


Partial Class ajax_SetAsset
    Inherits System.Web.UI.Page

    Private Sub ajax_SetAsset_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim tokenOb As New PSCS.Libary.Models.TokenClass
        Dim tokenID As String = CStr(tokenOb.TokenId)
        Dim BranchId As Integer = CType(Session(WebConstant.SessionName_UserObj), TokenClass).BranchId

        Dim RoleID As String = CType(Session(WebConstant.SessionName_UserObj), TokenClass).RoleId

        Dim Username As String = CType(Session(WebConstant.SessionName_UserObj), TokenClass).UserName

        Dim json As String
        Using reader = New StreamReader(Request.InputStream)
            json = reader.ReadToEnd()
        End Using

        Dim data As SetInfo = JsonConvert.DeserializeObject(Of SetInfo)(json)
        Dim qty As Decimal = data.qty
        Dim weight As Decimal = data.weight
        Dim amt As Decimal = data.amt
        Dim estimate As Decimal = data.estimate

        'For Each tickets As Tikets In data.Tickets
        '    Response.Write(tickets.ticketString)
        'Next

        'Response.Write(data.Tickets(0))
        Dim guids As String = Guid.NewGuid.ToString("D").ToUpper()
        Dim events As String = "xx"
        Dim dt As New DataTable
        dt = getMaxNoSet(events)

        Dim NoSet As Integer = Integer.Parse(dt.Rows(0)("No").ToString())

        If NoSet = 0 Then
            NoSet = 1
        Else
            NoSet = NoSet + 1
        End If

        Try
            InsertSet(guids, NoSet, amt, qty, weight, estimate, BranchId, Username, events)

            For value As Integer = 0 To data.Tickets.Count - 1
                InsertSetChild(guids, data.Tickets(value).ToString(), Username)
            Next
        Catch ex As Exception

        End Try



    End Sub

    Public Function DerializeDataTable(ByVal strJSON As String) As DataTable
        Dim dt As DataTable
        dt = JsonConvert.DeserializeObject(Of DataTable)(strJSON)
        Return dt
    End Function
End Class
