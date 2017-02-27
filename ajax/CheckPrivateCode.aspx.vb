
Imports Newtonsoft.Json
Imports PSCS.Libary.Models
Imports System.Data
Imports DataConnection

Partial Class ajax_CheckPrivateCode
    Inherits System.Web.UI.Page

    Private Sub ajax_CheckPrivateCode_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim tokenOb As New PSCS.Libary.Models.TokenClass
        'Dim tokenID As String = CStr(tokenOb.TokenId)
        Dim BranchId As Integer = CType(Session(WebConstant.SessionName_UserObj), TokenClass).BranchId
        Dim Emid As String = CType(Session(WebConstant.SessionName_UserObj), TokenClass).PrivateCode
        Dim UserName As String = Request.Form("confirmcodeval")

        If UserName = Emid Then
            Response.Write("OK")
        Else
            Response.Write("คุณกรอกรหัสยืนยันไม่ถูกต้อง")
            'Response.Write(Emid + "." + UserName + "." + ticketTranID + "." + Request.Form("aa"))

        End If
    End Sub
End Class
