Imports System.Data
Imports System.Web.UI
Imports System.Linq
Imports DataConnection.DataAccessClassAsset_Toey

Partial Class ajax_ajax_AuctionArea_CancelEvent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim type As String = Request.Form("type")
        If (type = "CancelEvent") Then
            Dim EventID As String = Request.Form("eventId")
            CancelEvent(EventID)
        End If

    End Sub
End Class
