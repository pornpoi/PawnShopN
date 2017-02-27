Imports System.Data
Imports System.Web.UI
Imports System.Linq
Imports DataConnection.DataAccessClassAsset_Toey


Partial Class ajax_ajax_AuctionArea_GetEventBranch
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim type As String = Request.Form("type")
        If (type = "getEventBranch") Then
            Dim EventID As String = Request.Form("eventId")
            Dim ProductType As Integer = Request.Form("ProductType")
            'getEventBranch(EventID)
            LoadBranchDataForEdit(EventID)

        End If

    End Sub

    Sub LoadBranchDataForEdit(ByVal EventId As String)

        Dim dt As New DataTable
        Dim result As String = ""
        Dim branchSet As String = ""
        Dim count As Integer = 0
        dt = getEventBranch(EventId)
        Dim distDTBranch = dt.AsEnumerable().Select(Function(rowData) New With {
                Key .BranchId = rowData.Field(Of Decimal)("BranchID")
                }).Distinct()
        For Each distDTBranchRow In distDTBranch
            branchSet &= "," & distDTBranchRow.BranchId
            count = count + 1
        Next
        result &= count & branchSet
        'MsgBox(result)
        Response.Write(result)

    End Sub

End Class
