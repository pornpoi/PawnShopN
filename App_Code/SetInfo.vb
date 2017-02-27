Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Public Class SetInfo
    Public Property Tickets As List(Of String)
    Public Property qty As Decimal
    Public Property weight As Decimal
    Public Property amt As Decimal
    Public Property estimate As Decimal

End Class
Public Class Branch
    Public Property BranchId As Integer
End Class

Public Class Tikets
    Public Property ticketString As String
End Class

Public Class TicketEstimate
    Public Property id As Integer
    Public Property TicketId As String
    Public Property TicketNo As String
    'Public Property CreatedDate As String
    Public Property BookNo As String
    Public Property Amount As Decimal
    Public Property FirstEstimate As Decimal
    Public Property SecondEstimate As Decimal

    Public Property ReportNo As Integer


End Class

