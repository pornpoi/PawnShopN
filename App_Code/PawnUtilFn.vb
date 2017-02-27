Imports Microsoft.VisualBasic

Public Class PawnUtilFn

    Public Shared Function IsLogin() As Boolean
        If Not IsNothing(HttpContext.Current.Session(WebConstant.SessionName_UserObj)) Then
            Return True
        End If

        Return False
    End Function

    Public Shared Sub SetSessionUserObj(userObj As PSCS.Libary.Models.TokenClass)
        HttpContext.Current.Session(WebConstant.SessionName_UserObj) = userObj
    End Sub

    Public Shared Function GetSessionUserObj(ByRef userObj As PSCS.Libary.Models.TokenClass) As Boolean
        If Not IsNothing(HttpContext.Current.Session(WebConstant.SessionName_UserObj)) Then
            userObj = HttpContext.Current.Session(WebConstant.SessionName_UserObj)
            Return True
        End If

        Return False
    End Function

End Class
