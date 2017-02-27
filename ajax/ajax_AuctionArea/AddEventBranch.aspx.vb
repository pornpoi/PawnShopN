Imports System.Data
Imports System.Web.UI
Imports System.Linq
Imports DataConnection.DataAccessClassAsset_Toey

Partial Class ajax_ajax_AuctionArea_AddEventBranch
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim type As String = Request.Form("type")
        If (type = "AddEventBranch") Then
            Dim EventID As String = Request.Form("eventid")
            Dim BranchID As String = Request.Form("branchid")

            InsertEventBranch(EventID, BranchID)
        End If
    End Sub
End Class
