Imports System.Data
Imports System.Web.UI
Imports PSCS.Libary.Models
Imports DataConnection.DataAccessClassAsset
Partial Class Default3
    Inherits System.Web.UI.Page

    Private Sub Default3_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim tokenOb As New PSCS.Libary.Models.TokenClass
        'Dim tokenID As String = CStr(tokenOb.TokenId)
        Dim BranchId As Integer = CType(Session(WebConstant.SessionName_UserObj), TokenClass).BranchId
        Dim Emid As String = CType(Session(WebConstant.SessionName_UserObj), TokenClass).PrivateCode
        Dim RoleID As String = CType(Session(WebConstant.SessionName_UserObj), TokenClass).RoleId

        'hiddenBranch.Value = BranchId

        If Not PawnUtilFn.GetSessionUserObj(tokenOb) Then
            Response.Redirect("../../login.aspx")
            Exit Sub
        End If


    End Sub
End Class
