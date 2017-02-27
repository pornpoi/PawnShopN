Imports System.Data
Imports System.Web.UI
Imports System.Linq
Imports DataConnection.DataAccessClassAsset
Partial Class ManageAsset
    Inherits System.Web.UI.Page
    Dim session_username As String, session_roleid As Integer, session_branchID As Integer
    Private Sub ManageAsset_Load(sender As Object, e As EventArgs) Handles Me.Load
        session_username = "TOT00"
        session_roleid = 2
        session_branchID = 18

        If Not IsPostBack And Not IsCallback Then
            LoadDefault()

        End If
    End Sub


    Sub LoadDefault()

        ddlBranch.DataSource = DataConnection.DataAccessClassAsset.getAllBracnh()
        ddlBranch.DataValueField = "BranchId"
        ddlBranch.DataTextField = "Name"
        ddlBranch.DataBind()

        ddlCategory.DataSource = DataConnection.DataAccessClassAsset.getAllCategoryTicket()
        ddlCategory.DataValueField = "ProductTypeId"
        ddlCategory.DataTextField = "Name"
        ddlCategory.DataBind()

        gvSetResult.DataSource = getAllSet()
        gvSetResult.DataBind()


    End Sub
    Protected Sub txtScan_TextChanged(sender As Object, e As EventArgs) Handles txtScan.TextChanged
        Dim ticketID As String = txtScan.Text.ToString()
        Dim dt As New DataTable
        dt = getTicketForPrePreSet(ticketID)

        Dim dtpre As New DataTable
        Dim status As New Boolean

        If dt.Rows.Count = 0 Then

            AlertModal("modalAlertSuccess", "ข้อมูลเลขตั๋วไม่ถูกต้อง")

        ElseIf dt.Rows.Count = 1 And dt.Rows(0)("TicketId") <> "" Then
            status = prepareSet(dt.Rows(0)("TicketId").ToString(), dt.Rows(0)("BookNoAndNumNo").ToString(), "", Integer.Parse(dt.Rows(0)("Quantity").ToString()), Integer.Parse(dt.Rows(0)("Weight").ToString()), Integer.Parse(dt.Rows(0)("Amount").ToString()), Integer.Parse(dt.Rows(0)("Estimate").ToString()))
            dtpre = getShowSetGroupAll()
            gvScan.DataSource = dtpre
            gvScan.DataBind()
            txtScan.Text = ""
        ElseIf dt.Rows.Count > 1 Then

            AlertModal("modalAlertSuccess", "ข้อมูลซ้ำ")

        End If

        Dim dtprepare As New DataTable
        dtprepare = getShowSetGroupAll()

        gvScan.DataSource = dtprepare
        gvScan.DataBind()

        Dim totalQty As Integer = dtprepare.AsEnumerable.Sum(Function(row) row.Field(Of Integer)("Quantity"))
        Dim totalWeight As Integer = dtprepare.AsEnumerable.Sum(Function(row) row.Field(Of Integer)("Weight"))
        Dim totalPrice As Integer = dtprepare.AsEnumerable.Sum(Function(row) row.Field(Of Integer)("Price"))
        Dim totalEstimatePrice As Decimal = dtprepare.AsEnumerable.Sum(Function(row) row.Field(Of Decimal)("EstimatePrice"))

        txtNumberThing.Text = totalQty.ToString("N2")
        txtWeightsum.Text = totalWeight.ToString("N2")
        txtPrice.Text = totalPrice.ToString("N2")
        txtEstimateSum.Text = totalEstimatePrice.ToString("N2")

    End Sub
    Protected Sub btnAddSet_Click(sender As Object, e As EventArgs) Handles btnAddSet.Click
        panelAddSet.Visible = True
        'Dim i As Integer
        ' gvScan.FooterRow.Cells(1).Text = "Total"
        'gvScan.FooterRow.Cells(1).HorizontalAlign = HorizontalAlign.Right
        'gvScan.FooterRow.Cells(3).Text = totalQty.ToString("N2")
        'gvScan.FooterRow.Cells(4).Text = totalWeight.ToString("N2")
        'gvScan.FooterRow.Cells(5).Text = totalPrice.ToString("N2")
    End Sub
    Protected Sub gvScan_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvScan.RowCommand
        If e.CommandName = "DeleteTicket" Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim selectedRow As GridViewRow = gvScan.Rows(index)
            Dim SetID As TableCell = selectedRow.Cells(0)
            Dim SetIDSelect As String = SetID.Text
            hddSetID.Value = SetIDSelect.ToString()

            Dim dt As New DataTable
            dt = SelectSet(SetIDSelect.ToString())
            lblSelectTicketIDSelect.Text = dt.Rows(0)("TicketID").ToString()
            Dim modalName As String = "modalDelete"

            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "AlertModal('" + modalName + "');", True)
        End If
    End Sub
    Protected Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click
        Dim setID As String = hddSetID.Value.ToString
        Dim status As Boolean
        status = updateSetIsEnable(setID.ToString())

        If status Then

            AlertModal("modalAlertSuccess", "ลบเรียบร้อย")
        Else

            AlertModal("modalAlertSuccess", "ไม่สามารถลบข้อมูลได้")
        End If

        Dim dtprepare As New DataTable
        dtprepare = getShowSetGroupAll()

        gvScan.DataSource = dtprepare
        gvScan.DataBind()


        Dim totalQty As Integer = dtprepare.AsEnumerable.Sum(Function(row) row.Field(Of Integer)("Quantity"))
        Dim totalWeight As Integer = dtprepare.AsEnumerable.Sum(Function(row) row.Field(Of Integer)("Weight"))
        Dim totalPrice As Integer = dtprepare.AsEnumerable.Sum(Function(row) row.Field(Of Integer)("Price"))
        Dim totalEstimatePrice As Decimal = dtprepare.AsEnumerable.Sum(Function(row) row.Field(Of Decimal)("EstimatePrice"))

        txtNumberThing.Text = totalQty.ToString("N2")
        txtWeightsum.Text = totalWeight.ToString("N2")
        txtPrice.Text = totalPrice.ToString("N2")
        txtEstimateSum.Text = totalEstimatePrice.ToString("N2")

    End Sub
    Protected Sub LbkRefresh_Click(sender As Object, e As EventArgs) Handles LbkRefresh.Click
        Dim modalName As String = "modalAlertClearData"
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "AlertModal('" + modalName + "');", True)
    End Sub
    Protected Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        DataConnection.DataAccessClassAsset.ResetSet()

        txtNumberThing.Text = ""
        txtWeightsum.Text = ""
        txtPrice.Text = ""
        txtEstimateSum.Text = ""

        Dim dtprepare As New DataTable
        dtprepare = getShowSetGroupAll()
        gvScan.DataSource = dtprepare
        gvScan.DataBind()

        AlertModal("modalAlertSuccess", "ล้างข้อมูลเรียบร้อย")
    End Sub
    Protected Sub btnConfirm_Click(sender As Object, e As EventArgs) Handles btnConfirm.Click

        Dim dt As New DataTable
        Dim vCode As String = txtCode.Text.ToString().Trim()
        dt = DataConnection.DataAccessClassAsset.getCodeSecure(session_username.ToString(), vCode)
        Dim code As String = ""

        Dim branch As String = ddlBranch.SelectedValue.ToString()
        Dim category As String = ddlCategory.SelectedValue.ToString()
        Dim numthing As String = txtNumberThing.Text.ToString()
        Dim weight As String = txtWeightsum.Text.ToString()
        Dim estimateSum As String = txtEstimateSum.Text.ToString()

        If dt.Rows.Count() = 0 Then
            AlertModal("modalAlertSuccess", "รหัสความปลอดภัยไม่ถูกต้อง")
            Exit Sub
        Else
            code = dt.Rows(0)("Code").ToString()
        End If


        If txtCode.Text = "" Then
            AlertModal("modalAlertSuccess", "กรุณากรอกรหัสความปลอดภัย")
            Exit Sub
        ElseIf txtCode.Text = code And numthing = "" And weight = "" And estimateSum = "" Then
            AlertModal("modalAlertSuccess", "กรุณากรอกข้อมูลให้ครบถ้วน")
        ElseIf txtCode.Text = code And numthing <> "" And weight <> "" And estimateSum <> "" Then
            Dim eventID As String = "xxxx"
            'Dummy Event 

            Dim statusInsert As Boolean
            statusInsert = InsertSetGroupReal(Integer.Parse(branch), Integer.Parse(category), Decimal.Parse(numthing), Decimal.Parse(weight), Decimal.Parse(estimateSum), 1, eventID)

            Dim dtSetGroup As New DataTable
            dtSetGroup = getSetGroupID()
            Dim setGroup = dtSetGroup.Rows(0)("SetGroupID").ToString()

            If statusInsert Then
                For Each gr As GridViewRow In gvScan.Rows
                    Dim setID As String = gvScan.Rows(gr.RowIndex).Cells(0).Text.ToString()
                    UpdateForSetGroup(setGroup, eventID, setID)
                Next
                AlertModal("modalAlertSuccess", "จัดชุดเรียบร้อย")
                LoadDefault()
                panelAddSet.Visible = False
            Else
                AlertModal("modalAlertSuccess", "ไม่สามารถจัดชุดได้ ")
            End If

        End If
    End Sub

    Sub AlertModal(ByVal modalNames As String, ByVal alertText As String)
        Dim modalName As String = modalNames
        lblAlert.Text = alertText
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "AlertModal('" + modalName + "');", True)
    End Sub

    Protected Sub gvSetResult_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvSetResult.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim setGropId As String = gvSetResult.DataKeys(e.Row.RowIndex).Value.ToString()
            Dim gvChild As GridView = TryCast(e.Row.FindControl("gvChild"), GridView)
            gvChild.DataSource = getChildTicket(setGropId)
            gvChild.DataBind()
        End If
    End Sub
    Protected Sub gvSetResult_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvSetResult.RowCommand
        If e.CommandName = "EditSet" Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim selectedRow As GridViewRow = gvSetResult.Rows(index)
            Dim Detail As TableCell = selectedRow.Cells(2)
            Dim SetGroupID As String = Detail.Text

            ddlBranchEdit.DataSource = DataConnection.DataAccessClassAsset.getAllBracnh()
            ddlBranchEdit.DataValueField = "BranchId"
            ddlBranchEdit.DataTextField = "Name"
            ddlBranchEdit.DataBind()

            ddlCategoryEdit.DataSource = DataConnection.DataAccessClassAsset.getAllCategoryTicket()
            ddlCategoryEdit.DataValueField = "ProductTypeId"
            ddlCategoryEdit.DataTextField = "Name"
            ddlCategoryEdit.DataBind()


            Dim dt As New DataTable
            dt = getSetGroupIDByID(SetGroupID.ToString())
            ddlBranchEdit.SelectedValue = Integer.Parse(dt.Rows(0)("Branch").ToString())
            ddlCategoryEdit.SelectedValue = Integer.Parse(dt.Rows(0)("Category").ToString())
            txtNumthingEdit.Text = dt.Rows(0)("NumThing").ToString()
            txtWeightEdit.Text = dt.Rows(0)("Weight").ToString()
            txtEstimateEdit.Text = dt.Rows(0)("EstimateSum").ToString()

            gvChildToModal.DataSource = getChildTicket(SetGroupID.ToString())
            gvChildToModal.DataBind()


            Dim modalName As String = "modalEditSet"
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "AlertModal('" + modalName + "');", True)

        ElseIf e.CommandName = "CancelSet" Then

            Dim modalName As String = "modalDelete"
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "AlertModal('" + modalName + "');", True)
        End If
    End Sub
    Protected Sub btnEditSet_Click(sender As Object, e As EventArgs) Handles btnEditSet.Click

    End Sub
End Class
