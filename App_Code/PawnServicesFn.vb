Imports Microsoft.VisualBasic

Public Class PawnServicesFn

    Public Shared Function GetTicketHistoryList(ByRef thObjList As List(Of PSCS.Libary.Models.TicketHistoryClass), _
                                                tokenID As String, customerID As String, _
                                                Optional skip As Integer = 0, Optional take As Integer = 0) As Boolean
        Dim ret As Boolean = False
        Try
            Dim psws As New PawnWSShopService.PawnShopServices
            Dim retJSONStr As String = psws.GetTicketHistories(tokenID, customerID, skip, take)
            thObjList = Newtonsoft.Json.JsonConvert.DeserializeObject(Of List(Of PSCS.Libary.Models.TicketHistoryClass))(retJSONStr)
            ret = True

        Catch ex As Exception
            thObjList = New List(Of PSCS.Libary.Models.TicketHistoryClass)
            WebUtilFn.LogError("[PawnServiceFn.GetTicketHistoryList]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try

        Return ret
    End Function

    'Public Shared Function GetCustomerObj(tokenID As String, ccardTypeID As Integer, ccardNo As String, cfingerprint As String, ByRef custObj As PSCS.Libary.Models.CustomerClass) As Boolean
    '    Dim ret As Boolean = False
    '    Try
    '        Dim psws As New PawnWSShopService.PawnShopServices
    '        Dim retJSONStr As String = psws.GetCustomer(tokenID, ccardTypeID, ccardNo, cfingerprint)
    '        custObj = Newtonsoft.Json.JsonConvert.DeserializeObject(Of PSCS.Libary.Models.CustomerClass)(retJSONStr)
    '        ret = True

    '    Catch ex As Exception
    '        custObj = New PSCS.Libary.Models.CustomerClass
    '        WebUtilFn.LogError("[PawnServiceFn.GetCustomerObj1]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
    '    End Try

    '    Return ret
    'End Function

    Public Shared Function GetCustomerObj(tokenID As String, customerID As String, ByRef custObj As PSCS.Libary.Models.CustomerClass) As Boolean
        Dim ret As Boolean = False
        Try
            Dim psws As New PawnWSShopService.PawnShopServices
            Dim retJSONStr As String = psws.GetCustomerDetail(tokenID, customerID)
            custObj = Newtonsoft.Json.JsonConvert.DeserializeObject(Of PSCS.Libary.Models.CustomerClass)(retJSONStr)
            ret = True

        Catch ex As Exception
            custObj = New PSCS.Libary.Models.CustomerClass
            WebUtilFn.LogError("[PawnServiceFn.GetCustomerObj2]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try

        Return ret
    End Function

    Public Shared Function GetCustomerAmount(tokenID As String, customerID As String) As Decimal
        Dim ret As Decimal = 0.0
        Try
            Dim psws As New PawnWSShopService.PawnShopServices
            ret = Convert.ToDecimal(psws.GetCustomerAmount(tokenID, customerID))

        Catch ex As Exception
            WebUtilFn.LogError("[PawnServiceFn.GetCustomerAmount]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try

        Return ret
    End Function

    'Public Shared Function InsertCustomer(tokenID As String, ByRef custObj As PSCS.Libary.Models.CustomerClass) As Boolean
    '    Dim ret As Boolean = False
    '    Try
    '        Dim psws As New PawnWSShopService.PawnShopServices
    '        Dim retJSONStr As String = psws.InsertCustomer(tokenID, _
    '                                                       custObj.CardTypeId, _
    '                                                       custObj.CardNo, _
    '                                                       custObj.PrefixId, _
    '                                                       custObj.FirstName, _
    '                                                       custObj.LastName, _
    '                                                       custObj.BirthDate.ToString("yyyy-MM-dd"), _
    '                                                       custObj.Sex, _
    '                                                       custObj.AddressLine1, _
    '                                                       custObj.AddressLine2, _
    '                                                       custObj.Street, _
    '                                                       custObj.SubDistrictId, _
    '                                                       custObj.DistrictId, _
    '                                                       custObj.ProvinceId, _
    '                                                       custObj.Postcode, _
    '                                                       custObj.IssueBy, _
    '                                                       custObj.IssueDate.ToString("yyyy-MM-dd"), _
    '                                                       custObj.ExpireDate.ToString("yyyy-MM-dd"), _
    '                                                       custObj.MobileNo, _
    '                                                       custObj.HomeTel, _
    '                                                       custObj.Email, _
    '                                                       custObj.OccupationId, _
    '                                                       custObj.NationId, _
    '                                                       custObj.Nationality, _
    '                                                       custObj.Memo, _
    '                                                       custObj.HomeCode, _
    '                                                       custObj.PersonCode, _
    '                                                       custObj.CountryId, _
    '                                                       custObj.Finger, _
    '                                                       custObj.PhotoBitMap)

    '        custObj = New PSCS.Libary.Models.CustomerClass
    '        custObj = Newtonsoft.Json.JsonConvert.DeserializeObject(Of PSCS.Libary.Models.CustomerClass)(retJSONStr)
    '        ret = True

    '    Catch ex As Exception
    '        custObj = New PSCS.Libary.Models.CustomerClass
    '        WebUtilFn.LogError("[PawnServiceFn.InsertCustomer]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
    '    End Try

    '    Return ret
    'End Function

    'Public Shared Function UpdateCustomer(tokenID As String, ByRef custObj As PSCS.Libary.Models.CustomerClass) As Boolean
    '    Dim ret As Boolean = False
    '    Try
    '        Dim psws As New PawnWSShopService.PawnShopServices
    '        Dim retJSONStr As String = psws.UpdateCustomer(tokenID, _
    '                                                       custObj.CustomerId, _
    '                                                       custObj.CardTypeId, _
    '                                                       custObj.CardNo, _
    '                                                       custObj.PrefixId, _
    '                                                       custObj.FirstName, _
    '                                                       custObj.LastName, _
    '                                                       custObj.BirthDate.ToString("yyyy-MM-dd"), _
    '                                                       custObj.Sex, _
    '                                                       custObj.AddressLine1, _
    '                                                       custObj.AddressLine2, _
    '                                                       custObj.Street, _
    '                                                       custObj.SubDistrictId, _
    '                                                       custObj.DistrictId, _
    '                                                       custObj.ProvinceId, _
    '                                                       custObj.Postcode, _
    '                                                       custObj.IssueBy, _
    '                                                       custObj.IssueDate.ToString("yyyy-MM-dd"), _
    '                                                       custObj.ExpireDate.ToString("yyyy-MM-dd"), _
    '                                                       custObj.MobileNo, _
    '                                                       custObj.HomeTel, _
    '                                                       custObj.Email, _
    '                                                       custObj.OccupationId, _
    '                                                       custObj.NationId, _
    '                                                       custObj.Nationality, _
    '                                                       custObj.Memo, _
    '                                                       custObj.HomeCode, _
    '                                                       custObj.PersonCode, _
    '                                                       custObj.CountryId, _
    '                                                       custObj.Finger, _
    '                                                       custObj.PhotoBitMap)

    '        custObj = New PSCS.Libary.Models.CustomerClass
    '        custObj = Newtonsoft.Json.JsonConvert.DeserializeObject(Of PSCS.Libary.Models.CustomerClass)(retJSONStr)
    '        ret = True

    '    Catch ex As Exception
    '        custObj = New PSCS.Libary.Models.CustomerClass
    '        WebUtilFn.LogError("[PawnServiceFn.UpdateCustomer]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
    '    End Try

    '    Return ret
    'End Function

    
    Public Shared Function InsertTicketDetail(tokenID As String, ticketID As String, line As Integer, ByRef tDetailObj As PSCS.Libary.Models.TicketDetailClass) As Boolean
        Dim ret As Boolean = False
        Try
            Dim psws As New PawnWSShopService.PawnShopServices
            Dim retJSONStr As String = psws.InsertTicketDetail(tokenID, _
                                                           ticketID, _
                                                           ticketID, _
                                                           tDetailObj.ProductTypeId, _
                                                           tDetailObj.Description, _
                                                           tDetailObj.Brand, _
                                                           tDetailObj.SerialNo, _
                                                           tDetailObj.Quantity, _
                                                           tDetailObj.Weight)

            tDetailObj = New PSCS.Libary.Models.TicketDetailClass
            tDetailObj = Newtonsoft.Json.JsonConvert.DeserializeObject(Of PSCS.Libary.Models.TicketDetailClass)(retJSONStr)
            ret = True

        Catch ex As Exception
            tDetailObj = New PSCS.Libary.Models.TicketDetailClass
            WebUtilFn.LogError("[PawnServiceFn.InsertTicketDetail]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try

        Return ret
    End Function


    '*********************stock In************************

    Public Shared Function GetStockLocations(tokenID As String, ByRef Locations As List(Of PSCS.Libary.Models.LocationStockClass)) As Boolean
        Dim ret As Boolean = False
        Try

            Dim psws As New PawnWSShopService.PawnShopServices
            Dim retJSONStr As String = psws.GetStockLocations(tokenID)
            Locations = Newtonsoft.Json.JsonConvert.DeserializeObject(Of List(Of PSCS.Libary.Models.LocationStockClass))(retJSONStr)

            ret = True

        Catch ex As Exception
            Locations = New List(Of PSCS.Libary.Models.LocationStockClass)
            WebUtilFn.LogError("[PawnServiceFn.GetStockLocations]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try

        Return ret
    End Function

    Public Shared Function GetTicketDetail(tokenID As String, TicketId As String, ByRef TicketDetail As PSCS.Libary.Models.TicketHistoryClass) As Boolean
        Dim ret As Boolean = False
        Try

            Dim psws As New PawnWSShopService.PawnShopServices
            Dim retJSONStr As String = psws.GetTicketDetail(tokenID, TicketId)

            TicketDetail = Newtonsoft.Json.JsonConvert.DeserializeObject(Of PSCS.Libary.Models.TicketHistoryClass)(retJSONStr)

            ret = True

        Catch ex As Exception
            TicketDetail = New PSCS.Libary.Models.TicketHistoryClass
            WebUtilFn.LogError("[PawnServiceFn.GetTicketDetail]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try
        Return ret


    End Function


    Public Shared Function CheckTicketDetailLocation(TokenId As String, TransactionId As String, BranchId As Integer, ByRef TicketT As List(Of PSCS.Libary.Models.ProductStockLocationClass), ByRef retError As String) As Boolean
        Dim ret As Boolean = False
        Dim retJSONStr As String = ""
        Try

            Dim psws As New PawnWSShopService.PawnShopServices
            retJSONStr = psws.CheckTicketDetailLocation(TokenId, TransactionId, BranchId)

            If retJSONStr.Equals("""Error:Transaction Id is invalid. Please check!!!""") Then
                retError = retJSONStr
                Exit Try
            End If

            TicketT = Newtonsoft.Json.JsonConvert.DeserializeObject(Of List(Of PSCS.Libary.Models.ProductStockLocationClass))(retJSONStr)

            ret = True

        Catch ex As Exception
            retError = retJSONStr
            TicketT = New List(Of PSCS.Libary.Models.ProductStockLocationClass)
            WebUtilFn.LogError("[PawnServiceFn.CheckTicketDetailLocation]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)

        End Try

        Return ret
    End Function


    Public Shared Function InsertInventory(TokenId As String, TransactionId As String, BranchId As Integer, TransactionObjective As Integer, Remark As String, ByRef insertObj As PSCS.Libary.Models.TransactionHeaderClass, ByRef retError As String) As Boolean
        Dim ret As Boolean = False
        Dim retJSONStr As String = ""
        Try
            Dim psws As New PawnWSShopService.PawnShopServices
            retJSONStr = psws.PushToInventory(TokenId, TransactionId, BranchId, TransactionObjective, Remark)

            If retJSONStr.Equals("""Error:This Ticket Id is already push to inventory!!!""") Then
                retError = retJSONStr
                Exit Try
            End If

            insertObj = New PSCS.Libary.Models.TransactionHeaderClass
            insertObj = Newtonsoft.Json.JsonConvert.DeserializeObject(Of PSCS.Libary.Models.TransactionHeaderClass)(retJSONStr)
            ret = True

        Catch ex As Exception
            retError = retJSONStr
            insertObj = New PSCS.Libary.Models.TransactionHeaderClass
            WebUtilFn.LogError("[PawnServiceFn.InsertTicketDetail]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try

        Return ret
    End Function

    Public Shared Function InsertInventoryDetail(TokenId As String, TransactionId As String, TicketId As String, TicketLine As Integer, ProductTypeID As Integer, BranchId As Integer, LocationId As Integer, ByRef insertObjD As PSCS.Libary.Models.TransactionDetailClass) As Boolean
        Dim ret As Boolean = False
        Try
            Dim psws As New PawnWSShopService.PawnShopServices
            Dim retJSONStr As String = psws.PushDetailToInventory(TokenId, TransactionId, TicketId, TicketLine, ProductTypeID, BranchId, LocationId)

            insertObjD = New PSCS.Libary.Models.TransactionDetailClass
            insertObjD = Newtonsoft.Json.JsonConvert.DeserializeObject(Of PSCS.Libary.Models.TransactionDetailClass)(retJSONStr)
            ret = True

        Catch ex As Exception
            insertObjD = New PSCS.Libary.Models.TransactionDetailClass
            WebUtilFn.LogError("[PawnServiceFn.InsertTicketDetail]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try

        Return ret
    End Function


'created by Nook
    Public Shared Function GetTransactionData(tokenID As String, ticketID As String, ticketTransactionID As String, ByRef ctObjList As PSCS.Libary.Models.TransactionClass) As Boolean
        Dim ret As Boolean = False
        Try
            Dim pws As New PawnWSShopService.PawnShopServices
            Dim retJSONStr As String = pws.GetTransactionData(tokenID, ticketID, ticketTransactionID)
            ctObjList = Newtonsoft.Json.JsonConvert.DeserializeObject(Of PSCS.Libary.Models.TransactionClass)(retJSONStr)
            ret = True

        Catch ex As Exception
            ctObjList = New PSCS.Libary.Models.TransactionClass
            WebUtilFn.LogError("[PawnServiceFn.GetTransactionData]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try

        Return ret
    End Function



    'created by Nook
    Public Shared Function GetInventoryQueue(tokenID As String, branchID As Integer, skip As Integer, take As Integer, ByRef ctObjList As List(Of PSCS.Libary.Models.InventoryQueueClass)) As Boolean
        Dim ret As Boolean = False
        Try
            Dim pws As New PawnWSShopService.PawnShopServices
            Dim retJSONStr As String = pws.GetInventoryQueue(tokenID, branchID, skip, take)
            ctObjList = Newtonsoft.Json.JsonConvert.DeserializeObject(Of List(Of PSCS.Libary.Models.InventoryQueueClass))(retJSONStr)
            ret = True


        Catch ex As Exception
            ctObjList = New List(Of PSCS.Libary.Models.InventoryQueueClass)
            WebUtilFn.LogError("[PawnServiceFn.GetInventoryQueue]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try

        Return ret
    End Function

    'created by Nook
    Public Shared Function PullFromInventory(tokenID As String, transactionID As String, ticketID As String, branchID As Integer, transactionObjective As Integer, ByRef ctObjList As PSCS.Libary.Models.TransactionClass) As Boolean
        Dim ret As Boolean = False
        Try
            Dim pws As New PawnWSShopService.PawnShopServices
            Dim retJSONStr As String = pws.PullFromInventory(tokenID, transactionID, ticketID, branchID, transactionObjective)
            ctObjList = Newtonsoft.Json.JsonConvert.DeserializeObject(Of PSCS.Libary.Models.TransactionClass)(retJSONStr)
            ret = True

        Catch ex As Exception
            ctObjList = New PSCS.Libary.Models.TransactionClass
            WebUtilFn.LogError("[PawnServiceFn.GetInventoryQueue]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try

        Return ret
    End Function

    'created by Nook
    Public Shared Function GetOnProcessingQueue(tokenID As String, branchID As Integer, skip As Integer, take As Integer, ByRef ctObjList As List(Of PSCS.Libary.Models.InventoryQueueClass)) As Boolean
        Dim ret As Boolean = False
        Try
            Dim pws As New PawnWSShopService.PawnShopServices
            Dim retJSONStr As String = pws.GetOnProcessingQueue(tokenID, branchID, skip, take)
            ctObjList = Newtonsoft.Json.JsonConvert.DeserializeObject(Of List(Of PSCS.Libary.Models.InventoryQueueClass))(retJSONStr)
            ret = True


        Catch ex As Exception
            ctObjList = New List(Of PSCS.Libary.Models.InventoryQueueClass)
            WebUtilFn.LogError("[PawnServiceFn.GetOnProcessingQueue]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try

        Return ret
    End Function



    '*********************stock cancel in************************
     Public Shared Function CancelInventoryTransection(TokenId As String, BranchId As Integer, TransectionId As String, TicketId As String, ByRef cancelObj As PSCS.Libary.Models.TransactionHeaderClass) As Boolean
        Dim ret As Boolean = False
        Try
            Dim psws As New PawnWSShopService.PawnShopServices
            Dim retJSONStr As String = psws.CancelInventoryTransaction(TokenId, BranchId, TransectionId, TicketId)

            If retJSONStr.Equals("""OK""") Then
                ret = True

            Else
                cancelObj = New PSCS.Libary.Models.TransactionHeaderClass
                cancelObj = Newtonsoft.Json.JsonConvert.DeserializeObject(Of PSCS.Libary.Models.TransactionHeaderClass)(retJSONStr)
                ret = False
            End If
        Catch ex As Exception
            cancelObj = New PSCS.Libary.Models.TransactionHeaderClass
            WebUtilFn.LogError("[PawnServiceFn.CancelInventoryTransection]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try
        Return ret
    End Function




    Public Shared Function GetTransactionDetails(TokenId As String, TransectionId As String, ByRef ListcancelObj As List(Of PSCS.Libary.Models.TransactionDetailClass)) As Boolean
        Dim ret As Boolean = False
        Try
            Dim psws As New PawnWSShopService.PawnShopServices
            Dim retJSONStr As String = psws.GetTransactionDetails(TokenId, TransectionId)

            ListcancelObj = New List(Of PSCS.Libary.Models.TransactionDetailClass)
            ListcancelObj = Newtonsoft.Json.JsonConvert.DeserializeObject(Of List(Of PSCS.Libary.Models.TransactionDetailClass))(retJSONStr)

            ret = True

        Catch ex As Exception
            ListcancelObj = New List(Of PSCS.Libary.Models.TransactionDetailClass)
            WebUtilFn.LogError("[PawnServiceFn.CancelInventoryTransection]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try
        Return ret
    End Function

    Public Shared Function SearchInventory(TokenId As String, BranchId As Integer, LocationId As Integer, DateFrom As String, DateTo As String, BookNo As String, TicketNo As String, EmployeeId As String, Skip As Integer, Take As Integer, ByRef InventoryDetail As List(Of PSCS.Libary.Models.TransactionHeaderClass)) As Boolean
        Dim ret As Boolean = False
        Try

            Dim psws As New PawnWSShopService.PawnShopServices
            Dim retJSONStr As String = psws.SearchInventory(TokenId, BranchId, LocationId, DateFrom, DateTo, BookNo, TicketNo, EmployeeId, 0, Take)

            InventoryDetail = New List(Of PSCS.Libary.Models.TransactionHeaderClass)
            InventoryDetail = Newtonsoft.Json.JsonConvert.DeserializeObject(Of List(Of PSCS.Libary.Models.TransactionHeaderClass))(retJSONStr)

            ret = True


        Catch ex As Exception
            InventoryDetail = New List(Of PSCS.Libary.Models.TransactionHeaderClass)
            WebUtilFn.LogError("[PawnShopServices.GetSearchInventory] : " & ex.ToString(), WebConstant.LogPath_WebServiceLog)

        End Try

        Return ret

    End Function

Public Shared Function GetTransactionData2(tokenID As String, ticketID As String, ticketTransactionID As String, ByRef ctObjList As PSCS.Libary.Models.TransactionClass, ByRef retError As String) As Boolean
        Dim ret As Boolean = False
        Dim retJSONStr As String = ""
        Try
            Dim pws As New PawnWSShopService.PawnShopServices
            retJSONStr = pws.GetTransactionData(tokenID, ticketID, ticketTransactionID)

            If retJSONStr.Equals("""Error:Invalid Transaction ID!!!""") Then
                retError = retJSONStr
                Exit Try
            End If

            ctObjList = Newtonsoft.Json.JsonConvert.DeserializeObject(Of PSCS.Libary.Models.TransactionClass)(retJSONStr)
            ret = True

        Catch ex As Exception
            retError = retJSONStr
            ctObjList = New PSCS.Libary.Models.TransactionClass
            WebUtilFn.LogError("[PawnServiceFn.GetTransactionData]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try

        Return ret
    End Function

    '********************Check permission************************

    Public Shared Function GetInventoryEmployees(TokenId As String, BranchId As Integer, Skip As Integer, Take As Integer, ByRef EmployeesIDob As List(Of PSCS.Libary.Models.EmployeeClass), ByRef retError As String) As Boolean
        Dim ret As Boolean = False
        Dim retJSONStr As String = ""
        Try

            Dim psws As New PawnWSShopService.PawnShopServices
            retJSONStr = psws.GetInventoryEmployees(TokenId, BranchId, Skip, Take)

            If retJSONStr.Equals("""Error:Transaction Id is invalid. Please check!!!""") Then
                retError = retJSONStr
                Exit Try
            End If

            EmployeesIDob = Newtonsoft.Json.JsonConvert.DeserializeObject(Of List(Of PSCS.Libary.Models.EmployeeClass))(retJSONStr)

            ret = True


        Catch ex As Exception
            retError = retJSONStr
            EmployeesIDob = New List(Of PSCS.Libary.Models.EmployeeClass)
            WebUtilFn.LogError("[PawnServiceFn.GetInventoryEmployees]: " & ex.ToString(), WebConstant.LogPath_WebServiceLog)
        End Try

        Return ret
    End Function



End Class
