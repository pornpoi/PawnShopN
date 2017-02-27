Imports Newtonsoft.Json
Imports System.Data
Imports DataConnection.DataAccessClassAsset
Partial Class ajax_DetailCustomer
    Inherits System.Web.UI.Page

    Private Sub ajax_DetailCustomer_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim TicketID As String = Request.Form("TicketID")
        hiddenTicketID.Value = TicketID
        Dim dt As New DataTable
        dt = getCustomerFromTicket(TicketID)
        lblNameSelect.Text = dt.Rows(0)("FirstName").ToString()
        lblSurnameSelect.Text = dt.Rows(0)("LastName").ToString()
        lblCitizenNoSelect.Text = dt.Rows(0)("CitizenNo").ToString()
        lblTickNoSelect.Text = dt.Rows(0)("TicketNo").ToString()
        lblBookNoSelect.Text = dt.Rows(0)("BookNo").ToString()
        lblAmountSelect.Text = fomatNumber(Integer.Parse(dt.Rows(0)("Amount").ToString()))

        Dim dt2 As New DataTable
        dt2 = getTicketDetailFullPath(TicketID)
        gvData.DataSource = dt2
        gvData.DataBind()

        Dim dt3 As New DataTable
        dt3 = getStateTicketBuyBack(TicketID)

        If dt3.Rows(0)("CNT").ToString() = 0 Then
            lblAlertState.Text = "ยังไม่มีการซื้อคืน"
            lblAlertState.ForeColor = Drawing.Color.Red
        Else
            lblAlertState.Text = "ซื้อคืนไปแล้ว"
            lblAlertState.ForeColor = Drawing.Color.Green
        End If


        Dim dt4 As New DataTable
        dt4 = getBuySelect(TicketID)
        gvHistory.DataSource = dt4
        gvHistory.DataBind()

    End Sub
End Class
