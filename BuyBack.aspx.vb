Imports Newtonsoft.Json
Imports System.Data
Imports System.Web.UI
Imports DataConnection.DataAccessClassAsset
Partial Class BuyBack
    Inherits System.Web.UI.Page
    Dim session_username As String, session_roleid As Integer, session_branchID As Integer
    Private Sub BuyBack_Load(sender As Object, e As EventArgs) Handles Me.Load
        session_username = "TOT00"
        session_roleid = 2
        session_branchID = 18

        If Not IsPostBack And Not IsCallback Then

        End If
    End Sub


    'Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
    '    Dim ticketNo As String = txtTicketNumber.Text.ToString().Trim()
    '    hddTicketID.Value = ticketNo
    '    Dim CitizenNo As String = txtIDCard.Text.ToString().Trim()
    '    Dim dt As New DataTable
    '    Dim dt2 As New DataTable
    '    Dim dt3 As New DataTable
    '    dt = getCustomerInfo(CitizenNo)
    '    dt2 = getTicketDetailFullPath(ticketNo)
    '    dt3 = getBuyBackInfoBranch(CitizenNo, ticketNo)


    '    If (ticketNo = "" And CitizenNo = "") Then
    '        AlertModal("modalAlertSuccess", "กรุณากรอกเลขตัวและรหัสบัตรประชาชน")
    '        Exit Sub
    '    ElseIf ticketNo = "" And CitizenNo <> "" Then
    '        AlertModal("modalAlertSuccess", "กรุณากรอกเลขตัว")
    '        Exit Sub
    '    ElseIf ticketNo <> "" And CitizenNo = "" Then
    '        AlertModal("modalAlertSuccess", "กรุณากรอกรหัสบัตรประชาชน")
    '        Exit Sub
    '    Else
    '        If (dt2.Rows.Count = 0) Then
    '            AlertModal("modalAlertSuccess", "ไม่พบข้อมูลโปรดตรวจสอบเลขที่ตั๋ว")
    '            Exit Sub
    '        ElseIf (dt3.Rows.Count = 0) Then
    '            AlertModal("modalAlertSuccess", "เลขบัตรประชาชนไม่ถูกต้อง")
    '            Exit Sub
    '        End If
    '        panelDisplaySearch.Visible = True

    '        gvCustomer.DataSource = dt
    '        gvCustomer.DataBind()

    '        lblBranchNameSelect.Text = dt3.Rows(0)("Name").ToString()
    '        lblBookAndNoSelect.Text = dt3.Rows(0)("TicketNoAndBookNo").ToString()
    '        lblPricePawnSumSelect.Text = fomatNumber(Integer.Parse(dt3.Rows(0)("Amount").ToString()))


    '        gvAssetDetail.DataSource = dt2
    '        gvAssetDetail.DataBind()
    '    End If

    'End Sub

    'Sub AlertModal(ByVal modalNames As String, ByVal alertText As String)
    '    Dim modalName As String = modalNames
    '    lblAlert.Text = alertText
    '    ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "AlertModal('" + modalName + "');", True)
    'End Sub
    'Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click

    '    Dim dt As New DataTable
    '    Dim vCode As String = txtCodeOperation.Text.ToString().Trim()
    '    dt = DataConnection.DataAccessClassAsset.getCodeSecure(session_username.ToString(), vCode)
    '    Dim code As String = ""

    '    Dim check_decimal As Decimal
    '    If Not Decimal.TryParse(txtPawBuyback.Text.ToString(), check_decimal) Then
    '        AlertModal("modalAlertSuccess", "กรุณากรอกให้เป็นตัวเลขเท่านั้น")
    '        Exit Sub
    '    ElseIf txtPawBuyback.Text = "" Then
    '        AlertModal("modalAlertSuccess", "กรุณากรอกตัวเลขในช่องว่าง")
    '        Exit Sub
    '    End If



    '    If dt.Rows.Count() = 0 Then
    '        AlertModal("modalAlertSuccess", "รหัสความปลอดภัยไม่ถูกต้อง")
    '        Exit Sub
    '    Else
    '        code = dt.Rows(0)("Code").ToString()

    '        lblAlertBuyBackSelect.Text = hddTicketID.Value.ToString()
    '        Dim modalName As String = "modalAlertBuyBack"
    '        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "AlertModal('" + modalName + "');", True)

    '    End If

    'End Sub
    'Protected Sub btnSubmitBuy_Click(sender As Object, e As EventArgs) Handles btnSubmitBuy.Click
    '    Dim ticketID As String
    '    Dim price As Decimal
    '    Dim state As Integer

    '    ticketID = hddTicketID.Value.ToString()
    '    price = Decimal.Parse(txtPawBuyback.Text.ToString())
    '    state = Integer.Parse(ddlState.SelectedValue.ToString())

    '    Dim status As Boolean

    '    status = InsertBuyBack(ticketID, price)
    '    If status = True Then
    '        panelDisplaySearch.Visible = False
    '        updateStateTicket(state, ticketID)
    '        'ClearForm()
    '        AlertModal("modalAlertSuccess", "บันทึกข้อมูลเรียบร้อย")
    '    End If

    'End Sub

    'Sub ClearForm()
    '    txtIDCard.Text = ""
    '    txtTicketNumber.Text = ""
    '    txtPawBuyback.Text = ""
    '    txtCodeOperation.Text = ""
    'End Sub
End Class
