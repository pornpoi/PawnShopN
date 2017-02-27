Imports Newtonsoft.Json
Imports System.Data
Imports DataConnection.DataAccessClassAsset_Toey


Partial Class ajax_ajax_AuctionArea_LoadEventAll
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dt As New DataTable
        dt = DataConnection.DataAccessClassAsset_Toey.getEventAll()
        Dim json = JsonConvert.SerializeObject(dt, Formatting.Indented)
        Response.Write(json)
    End Sub
End Class
