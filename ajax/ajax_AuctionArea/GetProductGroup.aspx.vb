Imports System.Data
Imports Newtonsoft.Json
Imports System.IO
Imports System.Collections.Generic

Partial Class ajax_ajax_AuctionArea_GetProductGroup
    Inherits System.Web.UI.Page

    Private Sub ajax_PopulateProductType_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Dim dt As New DataTable
        dt = DataConnection.DataAccessClassAsset.getProductGroup()
        Dim json = JsonConvert.SerializeObject(dt, Formatting.Indented)
        Response.Write(json)
    End Sub

End Class
