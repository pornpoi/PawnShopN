Imports DataConnection.DataAccessClassAsset
Imports System.Data
Partial Class ajax_BuyAll
    Inherits System.Web.UI.Page

    Private Sub ajax_BuyAll_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim dt As New DataTable
        dt = getBuyAll()
        gvData.DataSource = dt
        gvData.DataBind()

    End Sub
End Class
