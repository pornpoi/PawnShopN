Imports System.Data
Imports Newtonsoft.Json
Imports System.IO
Imports System.Collections.Generic
Partial Class ajax_PopulateProductType
    Inherits System.Web.UI.Page

    Private Sub ajax_PopulateProductType_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim dt As New DataTable
        dt = DataConnection.DataAccessClassAsset.getProductType()
        Dim json = JsonConvert.SerializeObject(dt, Formatting.Indented)
        Response.Write(json)
    End Sub
End Class
