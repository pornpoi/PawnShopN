Imports Microsoft.VisualBasic

Public Class WebConstant
    'web prop
    Public Shared WebTitle As String = "ระบบโรงรับจำนำ สถานธนานุบาล กรุงเทพมหานคร"
    Public Class TicketTypeID
        Public Shared Pawn As Integer = 1
        Public Shared PayInterest As Integer = 2
        Public Shared PayInstall As Integer = 4
        Public Shared ScaleUp As Integer = 5
        Public Shared Redeem As Integer = 3
        Public Shared OffPawn As Integer = 6
        Public Shared Auction As Integer = 7
        Public Shared Cancel As Integer = 8
        Public Shared PayInterest_DiffBranch As Integer = 9
    End Class

    'session
    Public Shared SessionName_UserObj As String = "SESSIONUserObj"
    Public Shared SessionName_PawnMode As String = "SESSSIONPawnMode"
    Public Shared SessionName_PawnCustomerID As String = "SESSSIONPawnCustomerID"

    'log prop
    Public Const isShowLogError As Boolean = True
    Public Const LogPath_CommonLog As String = "C:\data\wwwLog_80\CommonLog\"
    Public Const LogPath_WebServiceLog As String = "C:\data\wwwLog_80\Webservice\"
    Public Const LogPath_LoginLog As String = "C:\data\wwwLog_80\Login\"
    Public Const LogPath_Application As String = "C:\data\wwwLog_80\Application\"

End Class
