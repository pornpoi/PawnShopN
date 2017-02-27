Imports Newtonsoft.Json
Imports System.Data
Imports DataConnection.DataAccessClassAsset
Partial Class ajax_BeforSet
    Inherits System.Web.UI.Page

    Private Sub ajax_BeforSet_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim TicketID As String = Request.Form("TicketID")
        Dim dt As New DataTable
        dt = getTicketBeforeSet(TicketID)
        Dim json = JsonConvert.SerializeObject(dt, Formatting.Indented)
        Response.Write(json)
    End Sub
End Class
