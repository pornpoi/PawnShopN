Imports Microsoft.VisualBasic
Imports System.Data
Imports Oracle.DataAccess.Client
Imports System.IO
Imports System.Exception
Namespace DataConnection
    Public Class DataAccessClassAsset
        Public con As OracleConnection

        Public Shared Function getConnection() As OracleConnection
            Dim con As New OracleConnection(ConfigurationManager.ConnectionStrings("PawnShopData").ToString)
            con.Open()
            Return con
        End Function
        Public Shared Function getPwAssetConnection() As OracleConnection
            Dim con As New OracleConnection(ConfigurationManager.ConnectionStrings("PawnAsset").ToString)
            con.Open()
            Return con
        End Function
        Public Shared Function fomatNumber(param As Integer) As String
            Return param.ToString("###,###.00")
        End Function
        Public Shared Function getEstimateTiket(ByVal ticketStatus As Integer, ByVal branch As Integer) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_EstimateTicketResult"""
            cmd.Parameters.Add(New OracleParameter("VTicketTypeID ", OracleDbType.Int32)).Value = ticketStatus
            cmd.Parameters.Add(New OracleParameter("VBranchId ", OracleDbType.Int32)).Value = branch
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output

            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception

            Finally
                con.Close()
            End Try

            Return dt
        End Function
        Public Shared Function getEstimateDetial(ByVal ticketID As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_TicketInfoDetail"""
            cmd.Parameters.Add(New OracleParameter("TicketTypeId ", OracleDbType.Varchar2)).Value = ticketID
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output

            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception

            Finally
                con.Close()
            End Try

            Return dt
        End Function
        Public Shared Function InsertEstimate(ByVal ticketID As String, ByVal EstimatePrice As Int32, ByVal EstimateBy As String) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """InsertEstimate"""
            cmd.Parameters.Add(New OracleParameter("V_TicketId ", OracleDbType.Varchar2)).Value = ticketID
            cmd.Parameters.Add(New OracleParameter("V_EstimatePrice ", OracleDbType.Int32)).Value = EstimatePrice
            cmd.Parameters.Add(New OracleParameter("V_EstimateBy ", OracleDbType.Varchar2)).Value = EstimateBy
            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()
        End Function
        Public Shared Function getEstimateByTicketID(ByVal ticketID As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_EstimateByTicketID"""
            cmd.Parameters.Add(New OracleParameter("TicketID ", OracleDbType.Varchar2)).Value = ticketID
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output

            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception

            Finally
                con.Close()
            End Try

            Return dt

        End Function

        Public Shared Function updateEstimateFirst(ByVal ticketID As String, ByVal EstimatePrice As Integer) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_updateEstimateFirst"""
            cmd.Parameters.Add(New OracleParameter("tkID", OracleDbType.Varchar2)).Value = ticketID
            cmd.Parameters.Add(New OracleParameter("EstimatePrice", OracleDbType.Int32)).Value = EstimatePrice
            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()
        End Function


        Public Shared Function getAllBracnh() As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getAllBranch"""
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output

            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception

            Finally
                con.Close()
            End Try

            Return dt
        End Function
        Public Shared Function getAllCategoryTicket() As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getCategoryTicket"""

            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output

            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception

            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function getTicketForPrePreSet(ByVal ticketID As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getTicketPrepareForSet"""
            cmd.Parameters.Add(New OracleParameter("tkID", OracleDbType.Varchar2)).Value = ticketID
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output

            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception

            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function prepareSet(ByVal ticketID As String, ByVal bookNoAndNumno As String, ByVal description As String, ByVal qty As Integer, ByVal weight As Integer, ByVal price As String, ByVal estimate As Integer) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_InsertPrepareSetGroup"""
            cmd.Parameters.Add(New OracleParameter("vSetID", OracleDbType.Varchar2)).Value = Guid.NewGuid.ToString("D").ToUpper()
            cmd.Parameters.Add(New OracleParameter("vTicketID", OracleDbType.Varchar2)).Value = ticketID
            cmd.Parameters.Add(New OracleParameter("vBookNoAndNumNo", OracleDbType.Varchar2)).Value = bookNoAndNumno
            cmd.Parameters.Add(New OracleParameter("vDescription", OracleDbType.Varchar2)).Value = description
            cmd.Parameters.Add(New OracleParameter("vQuantity", OracleDbType.Int32)).Value = qty
            cmd.Parameters.Add(New OracleParameter("vWeight", OracleDbType.Int32)).Value = weight
            cmd.Parameters.Add(New OracleParameter("vPrice", OracleDbType.Int32)).Value = price
            cmd.Parameters.Add(New OracleParameter("vEstimatePrice", OracleDbType.Int32)).Value = estimate
            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()
        End Function

        Public Shared Function getShowSetGroupAll() As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_SetGroupAll"""
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception

            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function getTicketBeforeSet(ByVal ticketID As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_TicketInfoBeforeSet"""
            cmd.Parameters.Add(New OracleParameter("vTicketId", OracleDbType.Varchar2)).Value = ticketID
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception

            Finally
                con.Close()
            End Try

            Return dt
        End Function


        Public Shared Function updateSetIsEnable(ByVal vSetID As String) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_upDateSetIsEanble"""
            cmd.Parameters.Add(New OracleParameter("vSetID", OracleDbType.Varchar2)).Value = vSetID
            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()
        End Function

        Public Shared Function SelectSet(ByVal vSetID As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_SelectSetBySetID"""
            cmd.Parameters.Add(New OracleParameter("vSetID", OracleDbType.Varchar2)).Value = vSetID
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function ResetSet() As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_ResetSetGroup"""
            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()
        End Function

        Public Shared Function getCodeSecure(ByVal vUsername As String, ByVal vCode As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getCodeOperate"""
            cmd.Parameters.Add(New OracleParameter("VUserName", OracleDbType.Varchar2)).Value = vUsername
            cmd.Parameters.Add(New OracleParameter("VCode", OracleDbType.Varchar2)).Value = vCode
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function InsertSetGroupReal(ByVal branch As Integer, ByVal category As Integer, ByVal numthing As Decimal, ByVal weight As Decimal, ByVal estimatesum As Decimal, ByVal isSet As Integer, ByVal eventID As String) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_InsertSetGroupReal"""
            cmd.Parameters.Add(New OracleParameter("vSetGroupID", OracleDbType.Varchar2)).Value = Guid.NewGuid.ToString("D").ToUpper()
            cmd.Parameters.Add(New OracleParameter("vBranch", OracleDbType.Int32)).Value = branch
            cmd.Parameters.Add(New OracleParameter("vCategory", OracleDbType.Int32)).Value = category
            cmd.Parameters.Add(New OracleParameter("vNumThing", OracleDbType.Int32)).Value = numthing
            cmd.Parameters.Add(New OracleParameter("vWeight", OracleDbType.Int32)).Value = weight
            cmd.Parameters.Add(New OracleParameter("vEstimateSum", OracleDbType.Int32)).Value = estimatesum
            cmd.Parameters.Add(New OracleParameter("visSet", OracleDbType.Int32)).Value = isSet
            cmd.Parameters.Add(New OracleParameter("vEventID", OracleDbType.Varchar2)).Value = eventID

            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()
        End Function


        Public Shared Function UpdateForSetGroup(ByVal SetGroupID As String, ByVal eventID As String, ByVal SetID As String) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_UpdateSetForGroup"""
            cmd.Parameters.Add(New OracleParameter("vSetGroupID", OracleDbType.Varchar2)).Value = SetGroupID
            cmd.Parameters.Add(New OracleParameter("vEventID", OracleDbType.Varchar2)).Value = eventID
            cmd.Parameters.Add(New OracleParameter("vSetID", OracleDbType.Varchar2)).Value = SetID
            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()
        End Function
        Public Shared Function getSetGroupID() As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_GetSetGroupID"""
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function getAllSet() As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getAllSet"""
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt
        End Function


        Public Shared Function getChildTicket(ByVal setGroupID As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_ChildTicket"""
            cmd.Parameters.Add(New OracleParameter("vSetGroupID", OracleDbType.Varchar2)).Value = setGroupID
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function getSetGroupIDByID(ByVal setGroupID As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getSEtGroupBySetGroupId"""
            cmd.Parameters.Add(New OracleParameter("vSetGroupID", OracleDbType.Varchar2)).Value = setGroupID
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function getCustomerInfo(ByVal vCitizenNo As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getCustomerInfo"""
            cmd.Parameters.Add(New OracleParameter("vCitizenNo", OracleDbType.Varchar2)).Value = vCitizenNo
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function getTicketDetailFullPath(ByVal ticketID As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getTicketDetailInfoFull"""
            cmd.Parameters.Add(New OracleParameter("TicketID", OracleDbType.Varchar2)).Value = ticketID
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function getCustomerFromTicket(ByVal ticketID As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getCustomerFromTicket"""
            cmd.Parameters.Add(New OracleParameter("vTicketId", OracleDbType.Varchar2)).Value = ticketID
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function getBuyBackInfoBranch(ByVal CitizenNo As String, ByVal ticketID As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getBuyBackInfoBranch"""
            cmd.Parameters.Add(New OracleParameter("vCitizenNo", OracleDbType.Varchar2)).Value = CitizenNo
            cmd.Parameters.Add(New OracleParameter("vTicketId", OracleDbType.Varchar2)).Value = ticketID
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function getStateTicketBuyBack(ByVal ticketIDs As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_countStateBuyBack"""
            cmd.Parameters.Add(New OracleParameter("vTicketID", OracleDbType.Varchar2)).Value = ticketIDs
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function getBuyAll() As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_buyAll"""
            'cmd.Parameters.Add(New OracleParameter("vTicketID", OracleDbType.Varchar2)).Value = ticketIDs
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function getBuySelect(ByVal ticketIDs As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_BuySelect"""
            cmd.Parameters.Add(New OracleParameter("vTicketID", OracleDbType.Varchar2)).Value = ticketIDs
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function InsertBuyBack(ByVal tiketID As String, ByVal price As Decimal, ByVal name As String, ByVal remark As String) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_InsertBuyBack"""
            cmd.Parameters.Add(New OracleParameter("vID", OracleDbType.Varchar2)).Value = Guid.NewGuid.ToString("D").ToUpper()
            cmd.Parameters.Add(New OracleParameter("vTicketID", OracleDbType.Varchar2)).Value = tiketID
            cmd.Parameters.Add(New OracleParameter("vPrice", OracleDbType.Decimal)).Value = price
            cmd.Parameters.Add(New OracleParameter("vName", OracleDbType.Varchar2)).Value = name
            cmd.Parameters.Add(New OracleParameter("vRemark", OracleDbType.Varchar2)).Value = remark
            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()
        End Function
        Public Shared Function updateStateTicket(ByVal StateID As Integer, ByVal tiketID As String) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_UpdateTicketState"""
            cmd.Parameters.Add(New OracleParameter("vSetStateID", OracleDbType.Int32)).Value = StateID
            cmd.Parameters.Add(New OracleParameter("vTicket", OracleDbType.Varchar2)).Value = tiketID

            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()
        End Function

        Public Shared Function getAssetFall(ByVal Branchid As Integer, ByVal RoldID As Integer) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getAssestFall"""
            cmd.Parameters.Add(New OracleParameter("vBranchId", OracleDbType.Int32)).Value = Branchid
            cmd.Parameters.Add(New OracleParameter("vRoleID", OracleDbType.Int32)).Value = RoldID
            cmd.Parameters.Add(New OracleParameter("cur", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt
        End Function

        Public Shared Function getAssetFallDB(ByVal Branchid As Integer, ByVal RoldID As Integer) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getAssetFall"""
            cmd.Parameters.Add(New OracleParameter("vBranchId", OracleDbType.Int32)).Value = Branchid
            cmd.Parameters.Add(New OracleParameter("vRoleID", OracleDbType.Int32)).Value = RoldID
            cmd.Parameters.Add(New OracleParameter("cur", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt
        End Function
        Public Shared Function updateBothEstimateTicket(ByVal firstEstimate As Decimal, ByVal secondEstimate As Decimal, ByVal ticketID As String, ByVal reportNo As Integer) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_UpdateAssetBothEstimate"""
            cmd.Parameters.Add(New OracleParameter("vFirstEstimate", OracleDbType.Decimal)).Value = firstEstimate
            cmd.Parameters.Add(New OracleParameter("vSecondEstimate", OracleDbType.Decimal)).Value = secondEstimate
            cmd.Parameters.Add(New OracleParameter("vTicketId", OracleDbType.Varchar2)).Value = ticketID
            cmd.Parameters.Add(New OracleParameter("vReportNo", OracleDbType.Int32)).Value = reportNo

            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()
        End Function

        Public Shared Function updateFirstEstimateTicket(ByVal firstEstimate As Decimal, ByVal ticketID As String, ByVal reportNo As Integer) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_UpdateAssetFirstEstimate"""
            cmd.Parameters.Add(New OracleParameter("vFirstEstimate", OracleDbType.Decimal)).Value = firstEstimate
            cmd.Parameters.Add(New OracleParameter("vTicketId", OracleDbType.Varchar2)).Value = ticketID
            cmd.Parameters.Add(New OracleParameter("vReportNo", OracleDbType.Int32)).Value = reportNo

            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()
        End Function

        Public Shared Function updateSecondEstimateTicket(ByVal secondEstimate As Decimal, ByVal ticketID As String, ByVal reportNo As Integer) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_UpdateAssetSecondEstimate"""
            cmd.Parameters.Add(New OracleParameter("vSecondEstimate", OracleDbType.Decimal)).Value = secondEstimate
            cmd.Parameters.Add(New OracleParameter("vTicketId", OracleDbType.Varchar2)).Value = ticketID
            cmd.Parameters.Add(New OracleParameter("vReportNo", OracleDbType.Int32)).Value = reportNo

            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()
        End Function

        Public Shared Function InsertLogEstimateFirst(ByVal ticketId As String, ByVal Username As String, ByVal Price As Decimal) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_InsertLogFirstEstimate"""
            cmd.Parameters.Add(New OracleParameter("vID", OracleDbType.Varchar2)).Value = Guid.NewGuid.ToString("D").ToUpper()
            cmd.Parameters.Add(New OracleParameter("vTicketID", OracleDbType.Varchar2)).Value = ticketId
            cmd.Parameters.Add(New OracleParameter("vUserName", OracleDbType.Varchar2)).Value = Username
            cmd.Parameters.Add(New OracleParameter("vPrice", OracleDbType.Decimal)).Value = Price
            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()
        End Function

        Public Shared Function InsertLogEstimateSecond(ByVal ticketId As String, ByVal Username As String, ByVal Price As Decimal) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_InsertLogSecondEstimate"""
            cmd.Parameters.Add(New OracleParameter("vID", OracleDbType.Varchar2)).Value = Guid.NewGuid.ToString("D").ToUpper()
            cmd.Parameters.Add(New OracleParameter("vTicketID", OracleDbType.Varchar2)).Value = ticketId
            cmd.Parameters.Add(New OracleParameter("vUserName", OracleDbType.Varchar2)).Value = Username
            cmd.Parameters.Add(New OracleParameter("vPrice", OracleDbType.Decimal)).Value = Price
            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()
        End Function

        Public Shared Function InsertSet(ByVal vId As String, ByVal vNo As Integer, ByVal vPriceSum As Decimal, ByVal vQuantity As Decimal, ByVal vWeight As Decimal, ByVal vSecondEstimate As Decimal, ByVal vBranchId As Integer, ByVal Username As String, ByVal EventId As String) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_AddEstimateSet"""
            cmd.Parameters.Add(New OracleParameter("vID", OracleDbType.Varchar2)).Value = vId
            cmd.Parameters.Add(New OracleParameter("vNo", OracleDbType.Int32)).Value = vNo
            cmd.Parameters.Add(New OracleParameter("vPriceSum", OracleDbType.Decimal)).Value = vPriceSum
            cmd.Parameters.Add(New OracleParameter("vQuantity", OracleDbType.Decimal)).Value = vQuantity
            cmd.Parameters.Add(New OracleParameter("vWeight", OracleDbType.Decimal)).Value = vWeight
            cmd.Parameters.Add(New OracleParameter("vSecondEstimate", OracleDbType.Decimal)).Value = vSecondEstimate
            cmd.Parameters.Add(New OracleParameter("vBranchId", OracleDbType.Int32)).Value = vBranchId
            cmd.Parameters.Add(New OracleParameter("vUserName", OracleDbType.Varchar2)).Value = Username
            cmd.Parameters.Add(New OracleParameter("vEventID", OracleDbType.Varchar2)).Value = EventId

            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()

        End Function
        Public Shared Function InsertSetChild(ByVal vSetID As String, ByVal TicketId As String, ByVal Username As String) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_AddSetChid"""
            cmd.Parameters.Add(New OracleParameter("vSetID", OracleDbType.Varchar2)).Value = vSetID
            cmd.Parameters.Add(New OracleParameter("vTicketId", OracleDbType.Varchar2)).Value = TicketId
            cmd.Parameters.Add(New OracleParameter("vUsername", OracleDbType.Varchar2)).Value = Username
            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()

        End Function

        Public Shared Function getEventCnt(ByVal eventid As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_CntEvent"""
            cmd.Parameters.Add(New OracleParameter("vEventID", OracleDbType.Varchar2)).Value = eventid
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt

        End Function

        Public Shared Function getMaxNoSet(ByVal eventid As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getMaxNo"""
            cmd.Parameters.Add(New OracleParameter("vEventID", OracleDbType.Varchar2)).Value = eventid
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt

        End Function

        Public Shared Function getAllSetFromBranch(ByVal BranchId As Integer) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_GetAllSet"""
            cmd.Parameters.Add(New OracleParameter("vBranchId", OracleDbType.Varchar2)).Value = BranchId
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt

        End Function
        Public Shared Function getAllChild(ByVal setID As String) As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getAllChildFromSet"""
            cmd.Parameters.Add(New OracleParameter("vSetID", OracleDbType.Varchar2)).Value = setID
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt

        End Function

        Public Shared Function UpdateSetToZero(ByVal vSetID As String) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_UpdateSetToZero"""
            cmd.Parameters.Add(New OracleParameter("vSetID", OracleDbType.Varchar2)).Value = vSetID
            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()

        End Function

        Public Shared Function sp_UpdateChildToZero(ByVal vSetID As String) As Boolean
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_UpdateChildToZero"""
            cmd.Parameters.Add(New OracleParameter("vSetID", OracleDbType.Varchar2)).Value = vSetID
            Try
                cmd.ExecuteNonQuery()
                Return True

            Catch ex As Exception
                Return False
            End Try
            con.Close()

        End Function
        Public Shared Function getProductType() As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getProductType"""
            cmd.Parameters.Add(New OracleParameter("cur", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt

        End Function

        Public Shared Function getProductGroup() As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getProductGroup"""
            cmd.Parameters.Add(New OracleParameter("cur", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt

        End Function


        Public Shared Function getEventToDropdown() As DataTable
            Dim dt As New DataTable
            Dim da As New OracleDataAdapter
            Dim con As New OracleConnection
            Dim cmd As New OracleCommand
            con = getPwAssetConnection()
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = """sp_getEventToDropDown"""
            cmd.Parameters.Add(New OracleParameter("TicketInfo", OracleDbType.RefCursor)).Direction = ParameterDirection.Output
            Try
                da.SelectCommand = cmd
                da.Fill(dt)
            Catch ex As Exception
                HttpContext.Current.Response.Write(ex.ToString)
            Finally
                con.Close()
            End Try

            Return dt

        End Function

    End Class
End Namespace


