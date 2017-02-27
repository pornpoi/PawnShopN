Imports System.Data
Imports System.Web.UI
Imports System.Linq
Imports DataConnection.DataAccessClassAsset_Toey


Partial Class ajax_ajax_AuctionArea_UpdateEvent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim type As String = Request.Form("type")
        If (type = "UpdateEvent") Then
            Dim EventID As String = Request.Form("eventid")
            Dim DateStartEvent As String = Request.Form("DateStartEvent")
            Dim EventNo As String = Request.Form("EventNo")
            Dim ProductType As Integer = Request.Form("ProductType")
            Dim Time As String = Request.Form("Time")
            Dim Location As String = Request.Form("Location")

            UpdateEvent(EventID, DateStartEvent, EventNo, ProductType, Time, Location)
            'Response.Write(InsertEvent(EventID, DateStartEvent, EventNo, ProductType, Time, Location))


        End If
    End Sub
End Class
