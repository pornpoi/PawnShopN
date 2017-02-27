Imports System.Data
Imports System.Web.UI
Imports System.Linq
Imports DataConnection.DataAccessClassAsset_Toey

Partial Class ajax_ajax_AuctionArea_AddEvent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim type As String = Request.Form("type")
        If (type = "AddEvent") Then
            Dim EventID As String = Guid.NewGuid.ToString("D").ToUpper()
            Dim DateStartEvent As String = Request.Form("DateStartEvent")
            Dim EventNo As String = Request.Form("EventNo")
            Dim ProductType As Integer = Request.Form("ProductType")
            Dim Time As String = Request.Form("Time")
            Dim Location As String = Request.Form("Location")

            InsertEvent(EventID, DateStartEvent, EventNo, ProductType, Time, Location)

            Response.Write(EventID)


        End If
    End Sub
End Class
