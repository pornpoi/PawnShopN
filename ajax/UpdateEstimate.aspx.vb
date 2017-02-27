Imports System.Data
Imports Newtonsoft.Json
Imports System.IO
Imports System.Collections.Generic
Imports System.Web
Imports PSCS.Libary.Models
Imports DataConnection.DataAccessClassAsset



Partial Class ajax_UpdateEstimate
    Inherits System.Web.UI.Page

    Private Sub ajax_UpdateEstimate_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim tokenOb As New PSCS.Libary.Models.TokenClass
        Dim tokenID As String = CStr(tokenOb.TokenId)
        Dim BranchId As Integer = CType(Session(WebConstant.SessionName_UserObj), TokenClass).BranchId

        Dim RoleID As String = CType(Session(WebConstant.SessionName_UserObj), TokenClass).RoleId

        Dim Username As String = CType(Session(WebConstant.SessionName_UserObj), TokenClass).UserName


        Dim json As String
        Using reader = New StreamReader(Request.InputStream)
            json = reader.ReadToEnd()
        End Using

        Dim data As List(Of TicketEstimate) = JsonConvert.DeserializeObject(Of List(Of TicketEstimate))(json)

        If RoleID = 2 Then
            For value As Integer = 0 To data.Count() - 1
                Try
                    updateFirstEstimateTicket(data(value).FirstEstimate, data(value).TicketId, data(value).ReportNo)
                    InsertLogEstimateFirst(data(value).TicketId, Username, data(value).FirstEstimate)
                    Response.Write("Success")
                Catch ex As Exception
                    Response.Write("Error" + data(value).TicketId + ":" + ex.ToString)
                End Try

            Next
        Else
            For value As Integer = 0 To data.Count() - 1
                Try
                    updateSecondEstimateTicket(data(value).SecondEstimate, data(value).TicketId, data(value).ReportNo)
                    InsertLogEstimateSecond(data(value).TicketId, Username, data(value).SecondEstimate)
                    Response.Write("Success")
                Catch ex As Exception
                    Response.Write("Error" + data(value).TicketId + ":" + ex.ToString)
                End Try

            Next

        End If


        'For value As Integer = 0 To data.Count() - 1
        '    Try
        '        updateBothEstimateTicket(data(value).FirstEstimate, data(value).SecondEstimate, data(value).TicketId, 1)
        '        Response.Write("Success")
        '    Catch ex As Exception
        '        Response.Write("Error" + data(value).TicketId + ":" + ex.ToString)
        '    End Try

        'Next


    End Sub
End Class
