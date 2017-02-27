Imports Newtonsoft.Json
Imports System.Data
Imports DataConnection.DataAccessClassAsset
Partial Class ajax_Test
    Inherits System.Web.UI.Page

    Private Sub ajax_Test_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim tokenOb As New PSCS.Libary.Models.TokenClass
        If Not PawnUtilFn.GetSessionUserObj(tokenOb) Then
            Response.Redirect("../../../login.aspx")
            Exit Sub
        End If

        Dim RoleId As Integer = tokenOb.RoleId

        Dim BranchId As Integer = tokenOb.BranchId


        Dim dt As New DataTable
        dt = DataConnection.DataAccessClassAsset.getAssetFallDB(BranchId, RoleId)
        Dim json = JsonConvert.SerializeObject(dt, Formatting.Indented)
        Response.Write(json)
    End Sub
End Class
