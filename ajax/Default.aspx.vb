Imports System.Data
Imports System.Web.UI
Imports PSCS.Libary.Models
Imports DataConnection.DataAccessClassAsset
Imports System.IO
Imports Newtonsoft.Json

Partial Class ajax_Default
    Inherits System.Web.UI.Page

    Private Sub ajax_Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        'Dim UserName As String = "TOT00"
        'Dim UserPwd As String = "1234"

        'Dim UserIPAddr As String = WebUtilFn.GetClientIPAddress(Request)
        'Dim tokenObj As New PSCS.Libary.Models.TokenClass
        'Dim pwsObj As New PawnWSShopService.PawnShopServices


        'Dim retJSONStr As String = pwsObj.GetToken(UserName, UserPwd, UserIPAddr)
        'tokenObj = Newtonsoft.Json.JsonConvert.DeserializeObject(Of PSCS.Libary.Models.TokenClass)(retJSONStr)
        'PawnUtilFn.SetSessionUserObj(tokenObj)


        Dim tokenOb As New PSCS.Libary.Models.TokenClass
        If Not PawnUtilFn.GetSessionUserObj(tokenOb) Then
            Response.Redirect("../../../login.aspx")
            Exit Sub
        End If

        Dim RoleId As Integer = tokenOb.RoleId

        'Dim BranchID As String = Request.Form("Branchid")

        Dim jsonBranch As String
        Using reader = New StreamReader(Request.InputStream)
            jsonBranch = reader.ReadToEnd()
        End Using

        Dim data As Branch = JsonConvert.DeserializeObject(Of Branch)(jsonBranch)

        Dim BranchId As Integer = data.BranchId

        Dim dt As New DataTable
        dt = DataConnection.DataAccessClassAsset.getAssetFallDB(BranchId, RoleId)
        Dim json = JsonConvert.SerializeObject(dt, Formatting.Indented)
        Response.Write(json)


    End Sub



End Class
