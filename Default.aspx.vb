Imports System.Data
Imports System.Web.UI
Imports PSCS.Libary.Models
Imports DataConnection.DataAccessClassAsset
Partial Class _Default
    Inherits System.Web.UI.Page
    Dim session_username As String, session_roleid As Integer, session_branchID As Integer
    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim UserName As String = "TOT00"
        Dim UserPwd As String = "1234"

        Dim UserIPAddr As String = WebUtilFn.GetClientIPAddress(Request)
        Dim tokenObj As New PSCS.Libary.Models.TokenClass
        Dim pwsObj As New PawnWSShopService.PawnShopServices

        'session_username = "TOT00"
        'session_roleid = 2
        'session_branchID = 18

        Dim retJSONStr As String = pwsObj.GetToken(UserName, UserPwd, UserIPAddr)
        tokenObj = Newtonsoft.Json.JsonConvert.DeserializeObject(Of PSCS.Libary.Models.TokenClass)(retJSONStr)
        PawnUtilFn.SetSessionUserObj(tokenObj)


        Dim tokenOb As New PSCS.Libary.Models.TokenClass
        If Not PawnUtilFn.GetSessionUserObj(tokenOb) Then
            Response.Redirect("../../login.aspx")
            Exit Sub
        End If

        If Not IsPostBack And Not IsCallback Then
            LoadDefault()


        End If
    End Sub
    Sub LoadDefault()
        Dim branchid As Integer = session_branchID
        'ต้องใส่เป็น 7
        gvEstimateFallOff.DataSource = DataConnection.DataAccessClassAsset.getEstimateTiket(5, CType(Session(WebConstant.SessionName_UserObj), TokenClass).BranchId)
        gvEstimateFallOff.DataBind()
    End Sub

    Protected Sub gvEstimateFallOff_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvEstimateFallOff.RowCommand
        If e.CommandName = "Detail" Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim selectedRow As GridViewRow = gvEstimateFallOff.Rows(index)
            Dim Detail As TableCell = selectedRow.Cells(1)
            Dim ticketNo As String = Detail.Text
            gvEstimateDetail.DataSource = DataConnection.DataAccessClassAsset.getEstimateDetial(ticketNo.ToString())
            gvEstimateDetail.DataBind()

            Dim modalName As String = "modalAlert"
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "AlertModal('" + modalName + "');", True)
        End If
    End Sub
    Protected Sub gvEstimateFallOff_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvEstimateFallOff.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim lblEstimate As Label = DirectCast(e.Row.FindControl("lblEstimate"), Label)
            If Not IsNothing(lblEstimate) Then
                lblEstimate.Text = DataConnection.DataAccessClassAsset.fomatNumber(e.Row.DataItem("Estimate"))
            End If

            Dim txtEstimate As TextBox = DirectCast(e.Row.FindControl("txtEstimateFirst"), TextBox)
            If Not IsNothing(lblEstimate) Then
                txtEstimate.Text = DataConnection.DataAccessClassAsset.fomatNumber(e.Row.DataItem("Estimate"))
            End If

            Dim lblEstimateSecond As Label = DirectCast(e.Row.FindControl("lblEstimateSecond"), Label)
            If Not IsNothing(lblEstimate) Then
                lblEstimateSecond.Text = DataConnection.DataAccessClassAsset.fomatNumber(e.Row.DataItem("EstimateSecond"))
            End If

            Dim txtEstimateSecond As TextBox = DirectCast(e.Row.FindControl("txtEstimateSecond"), TextBox)
            If Not IsNothing(lblEstimate) Then
                txtEstimateSecond.Text = DataConnection.DataAccessClassAsset.fomatNumber(e.Row.DataItem("EstimateSecond"))
            End If


        End If
    End Sub

    Protected Sub OnCheckedChanged(sender As Object, e As EventArgs)
        Dim isUpdateVisible As Boolean = False
        Dim chk As CheckBox = TryCast(sender, CheckBox)
        If chk.ID = "chkAll" Then
            For Each row As GridViewRow In gvEstimateFallOff.Rows
                If row.RowType = DataControlRowType.DataRow Then
                    row.Cells(0).Controls.OfType(Of CheckBox)().FirstOrDefault().Checked = chk.Checked
                End If
            Next
        End If
        Dim chkAll As CheckBox = TryCast(gvEstimateFallOff.HeaderRow.FindControl("chkAll"), CheckBox)
        chkAll.Checked = True
        For Each row As GridViewRow In gvEstimateFallOff.Rows
            If row.RowType = DataControlRowType.DataRow Then
                Dim isChecked As Boolean = row.Cells(0).Controls.OfType(Of CheckBox)().FirstOrDefault().Checked
                For i As Integer = 3 To row.Cells.Count - 1
                    'row.Cells(i).Controls.OfType(Of Label)().FirstOrDefault().Visible = Not isChecked
                    If row.Cells(i).Controls.OfType(Of TextBox)().ToList().Count > 0 Then
                        row.Cells(i).Controls.OfType(Of TextBox)().FirstOrDefault().Visible = isChecked
                    End If
                    If row.Cells(i).Controls.OfType(Of TextBox)().ToList().Count > 0 Then
                        row.Cells(i).Controls.OfType(Of TextBox)().FirstOrDefault().Visible = isChecked
                    End If
                    If isChecked AndAlso Not isUpdateVisible Then
                        isUpdateVisible = True
                    End If
                    If Not isChecked Then
                        chkAll.Checked = False
                    End If
                Next
            End If
        Next
    End Sub
    Protected Sub btnUpdateEstimate_Click(sender As Object, e As EventArgs) Handles btnUpdateEstimate.Click
        For Each row As GridViewRow In gvEstimateFallOff.Rows
            If row.RowType = DataControlRowType.DataRow Then
                Dim isChecked As Boolean = row.Cells(0).Controls.OfType(Of CheckBox)().FirstOrDefault().Checked
                If isChecked Then
                    'update 

                    Dim ticketID As String = row.Cells(1).Text.ToString()
                    'update estimate first 
                    Dim estimateFirst As String = row.Cells(4).Controls.OfType(Of TextBox)().FirstOrDefault().Text
                    'estimate Second
                    Dim estimateSecond As String = row.Cells(5).Controls.OfType(Of TextBox)().FirstOrDefault().Text

                    updateEstimateFirst(ticketID, CInt(estimateFirst))
                End If
            End If
        Next

        Dim modalName As String = "modalAlertSuccess"
        lblAlert.Text = "แก้ไขข้อมูลเรียบร้อย"
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "AlertModal('" + modalName + "');", True)
        LoadDefault()

    End Sub
End Class
