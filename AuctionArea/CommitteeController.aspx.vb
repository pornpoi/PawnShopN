Partial Class AuctionArea_CommitteeController
    Inherits System.Web.UI.Page
    Public Shared eventId As String = "1"
    Public Shared EventNo As String = ""
    Public Shared DateEventStart As String = ""
    Public Shared GroupName As String = ""
    Private Sub AuctionArea_CommitteeController_Load(sender As Object, e As EventArgs) Handles Me.Load
        If (Request.QueryString("EventID") IsNot Nothing) Then
            eventId = "'" & Request.QueryString("EventID").ToString & "'"
            EventNo = Request.QueryString("EventNo").ToString
            DateEventStart = Request.QueryString("DateEventStart").ToString
            GroupName = Request.QueryString("GroupName").ToString
        End If
    End Sub
End Class