Imports System.Data
Imports System.Web.UI
Imports System.Linq
Imports DataConnection.DataAccessClassAsset
Partial Class Login
    Inherits System.Web.UI.Page
    Private Sub Login_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim username As String = txtUsername.Text.ToString().Trim()
        Dim password As String = txtPassword.Text.ToString().Trim()

        If username = "" Then
            AlertModal("modalAlertSuccess", "กรุณากรอกชื่อผู้ใช้งาน")
        ElseIf password = "" Then
            AlertModal("modalAlertSuccess", "กรุณากรอกรหัสผ่าน")
        ElseIf username = "" And password = "" Then
            AlertModal("modalAlertSuccess", "กรุณากรอกชื่อผู้ใช้งานและรหัสผ่าน")
        End If

    End Sub
    Sub AlertModal(ByVal modalNames As String, ByVal alertText As String)
        Dim modalName As String = modalNames
        lblAlert.Text = alertText
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "AlertModal('" + modalName + "');", True)
    End Sub
End Class
