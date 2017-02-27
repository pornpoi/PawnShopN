Imports System.Data
Imports System.Web.UI
Imports System.Linq
Imports DataConnection.DataAccessClassAsset_Toey
Imports Newtonsoft.Json
Imports System.IO
Imports System.Collections.Generic

Partial Class ajax_ajax_AuctionArea_GetDataEventAll
    Inherits System.Web.UI.Page
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim type As String = Request.Form("type")
        Dim EventID As String = Request.Form("eventId")
        'MsgBox(EventID)
        'getforUpdateEvent(EventID)


        'Response.Write(getforUpdateEvent(EventID))

        Dim dt As New DataTable
        dt = DataConnection.DataAccessClassAsset_Toey.getforUpdateEvent(EventID)
        Dim json = JsonConvert.SerializeObject(dt, Formatting.Indented)
        Response.Write(json)



    End Sub


End Class
