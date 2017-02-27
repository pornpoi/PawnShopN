Imports Microsoft.VisualBasic
Imports System.Globalization
Public Class WebUtilFn

    '------ WEBPAGE FUNCTION -------'
#Region "WEBPAGE FUNCTION"
    Public Shared Sub SetAutoCompleteOff(ctl As WebControls.TextBox)
        ctl.Attributes.Add("autocomplete", "off")
    End Sub
#End Region


    '------ COMMON FUNCTION -------'
#Region "COMMON FUNCTION"
    Public Shared Function GetClientDeviceStr(Request As HttpRequest) As String
        Return Request.ServerVariables("HTTP_USER_AGENT").ToLower()
    End Function

    Public Shared Function GetClientIPAddress(ByVal Request As HttpRequest) As String
        Dim strIp As String = ""
        strIp = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
        If strIp = "" Then
            strIp = Request.ServerVariables("REMOTE_ADDR")
        End If

        Return strIp
    End Function

    Public Shared Function GetClientRemoteIPAddress(ByVal Request As HttpRequest) As String
        Dim strIp As String = ""
        strIp = Request.ServerVariables("REMOTE_ADDR")

        Return strIp
    End Function

    Public Shared Function GetBrowserHeader(Request As HttpRequest) As String
        Dim retStr As String = ""
        Dim loop1, loop2 As Integer
        Dim arr1(), arr2() As String
        Dim coll As NameValueCollection


        ' Load Header collection into NameValueCollection object.
        coll = Request.Headers

        ' Put the names of all keys into a string array.
        arr1 = coll.AllKeys
        For loop1 = 0 To arr1.GetUpperBound(0)
            retStr += arr1(loop1) & vbCrLf
            arr2 = coll.GetValues(loop1)
            ' Get all values under this key.
            For loop2 = 0 To arr2.GetUpperBound(0)
                retStr += CStr(loop2) & ": " & vbTab & arr2(loop2) & vbCrLf
            Next loop2
            retStr += vbCrLf
        Next loop1

        Return retStr
    End Function
#End Region


    '------ DATETIME FUNCTION -------'
#Region "DATETIME FUNCTON"
    'Public Shared Function getDatetimeFormat() As Globalization.CultureInfo
    '    Dim dtFM As New Globalization.CultureInfo("th-TH")
    '    dtFM.DateTimeFormat.DateSeparator = "/"
    '    dtFM.DateTimeFormat.ShortDatePattern = "dd/MM/yyyy"
    '    dtFM.DateTimeFormat.TimeSeparator = ":"
    '    dtFM.DateTimeFormat.ShortTimePattern = "HH:mm:ss"

    '    Return dtFM
    'End Function

    'Public Shared Function getFullDateTHStr(dt As DateTime) As String
    '    Dim dtf As Globalization.CultureInfo = WebUtilFn.getDatetimeFormat
    '    Return dt.ToString("dd", dtf) & " " & WebUtilFn.getDateMonthTHStr(dt.Month) & " " & dt.ToString("yyyy", dtf)
    'End Function

    'Public Shared Function getFullDateTHShortStr(dt As DateTime) As String
    '    Dim dtf As Globalization.CultureInfo = WebUtilFn.getDatetimeFormat
    '    Return dt.ToString("dd", dtf) & " " & WebUtilFn.getDateMonthShortTHStr(dt.Month) & " " & dt.ToString("yyyy", dtf)
    'End Function

    'Public Shared Function getDateMonthTHStr(dmonth As Integer) As String
    '    Dim retStr As String = ""
    '    Select Case dmonth
    '        Case 1
    '            retStr = "มกราคม"
    '        Case 2
    '            retStr = "กุมภาพันธ์"
    '        Case 3
    '            retStr = "มีนาคม"
    '        Case 4
    '            retStr = "เมษายน"
    '        Case 5
    '            retStr = "พฤษภาคม"
    '        Case 6
    '            retStr = "มิถุนายน"
    '        Case 7
    '            retStr = "กรกฎาคม"
    '        Case 8
    '            retStr = "สิงหาคม"
    '        Case 9
    '            retStr = "กันยายน"
    '        Case 10
    '            retStr = "ตุลาคม"
    '        Case 11
    '            retStr = "พฤศจิกายน"
    '        Case 12
    '            retStr = "ธันวาคม"
    '        Case Else
    '            retStr = "-"
    '    End Select

    '    Return retStr
    'End Function

    'Public Shared Function getDateMonthShortTHStr(dmonth As Integer) As String
    '    Dim retStr As String = ""
    '    Select Case dmonth
    '        Case 1
    '            retStr = "ม.ค."
    '        Case 2
    '            retStr = "ก.พ."
    '        Case 3
    '            retStr = "มี.ค."
    '        Case 4
    '            retStr = "เม.ษ."
    '        Case 5
    '            retStr = "พ.ค."
    '        Case 6
    '            retStr = "มิ.ย."
    '        Case 7
    '            retStr = "ก.ค."
    '        Case 8
    '            retStr = "ส.ค."
    '        Case 9
    '            retStr = "ก.ย."
    '        Case 10
    '            retStr = "ต.ค."
    '        Case 11
    '            retStr = "พ.ย."
    '        Case 12
    '            retStr = "ธ.ค."
    '        Case Else
    '            retStr = "-"
    '    End Select

    '    Return retStr
    'End Function
#End Region


    '------ LOG FUNCTION ------'
#Region "LOG FUNCTION"
    Public Shared Function GetJSScriptString(strfn As String) As String
        Return "<script language=""javascript"" type=""text/javascript"">" & strfn & "</script>"
    End Function

    Public Shared Sub LogError(ByVal txt As String, Optional ByVal dir As String = WebConstant.LogPath_CommonLog)
        If WebConstant.isShowLogError Then
            HttpContext.Current.Response.Write(txt.Replace(vbCrLf, "<br>"))
        End If

        Log("ErrorLog", txt, dir)
    End Sub

    Public Shared Sub Log(titleFileName As String, ByVal txt As String, ByVal dir As String)
        If Not dir.EndsWith("\") Then
            dir = dir & "\"
        End If

        Dim logFilePath As String = dir & titleFileName & DateTime.Now.ToString("yyyyMMdd") + ".log"
        Dim fInfo As System.IO.FileInfo = New System.IO.FileInfo(logFilePath)
        Dim logWriter As System.IO.StreamWriter
        If (fInfo.Exists) Then
            logWriter = fInfo.AppendText()
        Else
            logWriter = fInfo.CreateText()
        End If
        If Not (logWriter Is Nothing) Then
            logWriter.AutoFlush = True
            logWriter.WriteLine(DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") + " : " + txt)
            logWriter.Close()
            logWriter.Dispose()
        End If
    End Sub

#End Region

End Class
