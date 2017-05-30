Imports System.IO
Imports cllHUStringsLibrary

Public Class HUFilesLibrary

  Public Class HUSetupFiles
    '========================================================================================
    '
    '   Filename : HUSetupFiles.vb
    '
    '   Description:
    '
    '   Called By:  AppInit : Initialise
    '
    '   Calls:
    '
    '   Version:
    '
    '   Date: 30 May 2017
    '
    '========================================================================================

    '========================================================================================
    '          PRIVATE CONSTANTS
    '========================================================================================
    Dim cstrDefaultSetupFileName As String = "Setup"
    Dim cstrSetupFileExtension As String = ".sup"

    'Dim cstrDefaultSettingsFileName As String = "Setttings"
    'Dim cstrSettingsFileExtension As String = ".stg"

    '========================================================================================
    '          PUBLIC CONSTANTS
    '========================================================================================
    'Public Enum HUSettingsFileMode
    '  fmBackup = 0
    '  fmReplace = 1
    'End Enum ' husettingsfilemode

    '========================================================================================
    '          PRIVATE VARIABLES
    '========================================================================================
    'Dim vstrOriginalFileExtension As String
    'Dim vstrOriginalFileName As String
    'Dim vstrOriginalFullFileName As String
    'Dim vstrOriginalFullFilePath As String

    '========================================================================================
    '          PUBLIC VARIABLES
    '========================================================================================

    '========================================================================================
    '          PRIVATE PROPERTIES
    '========================================================================================

    '========================================================================================
    '          PUBLIC PROPERTIES
    '========================================================================================

    '========================================================================================
    '          PRIVATE PROPERTY ROUTINES
    '========================================================================================

    '========================================================================================
    '          PUBLIC PROPERTY ROUTINES
    '========================================================================================

    '========================================================================================
    '          PRIVATE EVENT ROUTINES
    '========================================================================================

    '========================================================================================
    '          PUBLIC EVENT ROUTINES
    '========================================================================================

    '========================================================================================
    '          PRIVATE METHOD ROUTINES
    '========================================================================================

    '========================================================================================
    '          PUBLIC METHOD ROUTINES
    '========================================================================================

    '========================================================================================
    '          PRIVATE ROUTINES
    '========================================================================================

    '========================================================================================
    '          PUBLIC ROUTINES
    '========================================================================================

    '========================================================================================
    '          FILE ROUTINES
    '========================================================================================

    '==============================
    '     SETUP FILES
    '==============================
    Public Sub ParseSetupStringData(vstrStringData As String,
                             ByRef vstrProperty As String,
                             ByRef vstrValue As String)
      ' Each record consists of one or two parts. If only one part exists it is returned as 
      ' it is returned as the Value. If both parts (separated by the equals sign) exists,
      ' then the first part is returned as the Property and the second part is returned as
      ' the Value'

      ' first find the POS of the equals sign
      Dim Pos As Integer
      Pos = InStr(vstrStringData, "=")

      ' Now deternine number of returned parts
      If Pos = 0 Then
        vstrProperty = Nothing
        vstrValue = Right(vstrStringData, Len(vstrStringData) - Pos)
      Else
        vstrProperty = Left(vstrStringData, (Pos - 1))
        vstrValue = Right(vstrStringData, Len(vstrStringData) - Pos)
      End If ' If Pos > 0

    End Sub ' Sub ParseSetupStringData() 

    '----------------------------------------------------------------------------------------
    Public Sub ParseSetupBooleanData(vstrStringData As String,
                             ByRef vstrProperty As String,
                             ByRef vblnValue As Boolean)
      ' Each record consists of one or two parts. If only one part exists it is returned as 
      ' it is returned as the Value. If both parts (separated by the equals sign) exists,
      ' then the first part is returned as the Property and the second part is returned as
      ' the Value'

      ' first find the POS of the equals sign
      Dim Pos As Integer
      Pos = InStr(vstrStringData, "=")

      ' Now deternine number of returned parts
      If Pos = 0 Then
        vstrProperty = Nothing
        vblnValue = CBool(Right(vstrStringData, Len(vstrStringData) - Pos))
      Else
        vstrProperty = Left(vstrStringData, (Pos - 1))
        vblnValue = CBool(Right(vstrStringData, Len(vstrStringData) - Pos))
      End If ' If Pos > 0

    End Sub ' Sub ParseSetupBooleanData()

    '----------------------------------------------------------------------------------------
    Public Sub ParseSetupIntegerData(vstrStringData As String,
                             ByRef vstrProperty As String,
                             ByRef vintValue As Integer)
      ' Each record consists of one or two parts. If only one part exists it is returned as 
      ' it is returned as the Value. If both parts (separated by the equals sign) exists,
      ' then the first part is returned as the Property and the second part is returned as
      ' the Value'

      ' first find the POS of the equals sign
      Dim Pos As Integer
      Pos = InStr(vstrStringData, "=")

      ' Now deternine number of returned parts
      If Pos = 0 Then
        vstrProperty = Nothing
        vintValue = CInt(Right(vstrStringData, Len(vstrStringData) - Pos))
      Else
        vstrProperty = Left(vstrStringData, (Pos - 1))
        vintValue = CInt(Right(vstrStringData, Len(vstrStringData) - Pos))
      End If ' If Pos > 0

    End Sub ' Sub ParseSetupIntegerData() 

    '----------------------------------------------------------------------------------------
    Public Sub ParseSetupDoubleData(vstrStringData As String,
                             ByRef vstrProperty As String,
                             ByRef vdblDouble As Integer)
      ' Each record consists of one or two parts. If only one part exists it is returned as 
      ' it is returned as the Value. If both parts (separated by the equals sign) exists,
      ' then the first part is returned as the Property and the second part is returned as
      ' the Value'

      ' first find the POS of the equals sign
      Dim Pos As Integer
      Pos = InStr(vstrStringData, "=")

      ' Now deternine number of returned parts
      If Pos = 0 Then
        vstrProperty = Nothing
        vdblDouble = CDbl(Right(vstrStringData, Len(vstrStringData) - Pos))
      Else
        vstrProperty = Left(vstrStringData, (Pos - 1))
        vdblDouble = CDbl(Right(vstrStringData, Len(vstrStringData) - Pos))
      End If ' If Pos > 0

    End Sub ' Sub ParseSetupDoubleData() 

    '========================================================================================

    ''==============================
    ''     SETTING FILES
    ''==============================
    'Public Function FormatSettingStringData(vstrProperty As String, vstrValue As String) As String
    '  ' Each record consists of two parts. Both parts are concatenated using and equal sign
    '  ' and returned as the formatted string "vstrProperty=vstrValue"

    '  ' Format and return the String data
    '  Return vstrProperty + "=" + vstrValue

    'End Function ' Function FormatSettingStringData() 

    ''----------------------------------------------------------------------------------------
    'Public Function FormatSettingBooleanData(vstrProperty As String, vblnValue As Boolean) As String
    '  ' Each record consists of two parts. Both parts are concatenated using and equal sign
    '  ' and returned as the formatted string "vstrProperty=vblnValue"

    '  ' Format and return the String data
    '  Dim vstrTStr As String
    '  vstrTStr = HUBooltoTFString(vblnValue)
    '  Return vstrProperty + "=" + vstrTStr

    'End Function ' Function FormatSettingBooleanData() 

    ''----------------------------------------------------------------------------------------
    'Public Function FormatSetupIntegerData(vstrProperty As String, vintValue As Integer) As String
    '  ' Each record consists of two parts. Both parts are concatenated using and equal sign
    '  ' and returned as the formatted string "vstrProperty=vintValue"

    '  ' Format and return the String data
    '  Dim vstrTStr As String
    '  Try
    '    vstrTStr = CInt(vintValue)
    '  Catch ex As Exception
    '    vstrTStr = "Integer Conversion Error"
    '  End Try
    '  Return vstrProperty + "=" + vstrTStr

    'End Function ' Function FormatSetupBooleanData() 

    ''----------------------------------------------------------------------------------------
    'Public Function FormatSetupDoubleData(vstrProperty As String, vdblValue As Double) As String
    '  ' Each record consists of two parts. Both parts are concatenated using and equal sign
    '  ' and returned as the formatted string "vstrProperty=vdblValue"

    '  ' Format and return the String data
    '  Dim vstrTStr As String
    '  Try
    '    vstrTStr = CDbl(vdblValue)
    '  Catch ex As Exception
    '    vstrTStr = "Double Conversion Error"
    '  End Try
    '  Return vstrProperty + "=" + vstrTStr

    'End Function ' Function FormatSetupDoubleData() 

    ''========================================================================================
    'Public Sub ParseSettingsStringData(vstrStringData As String,
    '                          vstrProperty As String,
    '                          vstrValue As String)
    '  ' Each record consists of one or two parts. If only one part exists it is returned as 
    '  '  ' it is returned as the Value. If both parts (separated by the equals sign) exists,
    '  '  ' then the first part is returned as the Property and the second part is returned as
    '  '  ' the Value'

    '  ' first find the POS of the equals sign
    '  Dim Pos As Integer
    '  Pos = InStr(vstrStringData, "=")

    '  ' Now deternine number of returned parts
    '  If Pos = 0 Then
    '    vstrProperty = Nothing
    '    vstrValue = Right(vstrStringData, Len(vstrStringData) - Pos)
    '  Else
    '    vstrProperty = Left(vstrStringData, (Pos - 1))
    '    vstrValue = Right(vstrStringData, Len(vstrStringData) - Pos)
    '  End If ' If Pos > 0

    'End Sub ' Sub ParseSettingsStringData() 

    ''----------------------------------------------------------------------------------------
    'Public Sub ParseSettingsBooleanData(vstrStringData As String,
    '                            ByRef vstrProperty As String,
    '                            ByRef vblnValue As Boolean)
    '  ' Each record consists of one or two parts. If only one part exists it is returned as 
    '  ' it is returned as the Value. If both parts (separated by the equals sign) exists,
    '  ' then the first part is returned as the Property and the second part is returned as
    '  ' the Value'

    '  Dim vstrTStr As String

    '  MsgBox(vstrStringData)

    '  ' first find the POS of the equals sign
    '  Dim Pos As Integer
    '  Pos = InStr(vstrStringData, "=")
    '  MsgBox(Right(vstrStringData, Len(vstrStringData) - Pos))

    '  ' Now deternine number of returned parts
    '  If Pos = 0 Then
    '    vstrProperty = Nothing
    '    MsgBox(Right(vstrStringData, Len(vstrStringData) - Pos))
    '    vblnValue = Right(vstrStringData, Len(vstrStringData) - Pos)
    '    'vblnValue = CBool(Right(vstrStringData, Len(vstrStringData) - Pos))
    '  Else
    '    vstrProperty = Left(vstrStringData, (Pos - 1))
    '    MsgBox(Right(vstrStringData, Len(vstrStringData) - Pos))
    '    'If Right(vstrStringData, Len(vstrStringData) - Pos) = "True" Then
    '    '  vblnValue = True
    '    'Else
    '    '  vblnValue = False
    '    'End If
    '    vblnValue = HUTFStringToBool(Right(vstrStringData, Len(vstrStringData) - Pos))

    '  End If ' If Pos > 0

    'End Sub ' Sub ParseSettingsBooleanData()

    ''----------------------------------------------------------------------------------------
    'Public Sub ParseSettingsIntegerData(vstrStringData As String,
    '                         ByRef vstrProperty As String,
    '                         ByRef vintValue As Integer)
    '  ' Each record consists of one or two parts. If only one part exists it is returned as 
    '  ' it is returned as the Value. If both parts (separated by the equals sign) exists,
    '  ' then the first part is returned as the Property and the second part is returned as
    '  ' the Value'

    '  ' first find the POS of the equals sign
    '  Dim Pos As Integer
    '  Pos = InStr(vstrStringData, "=")

    '  ' Now deternine number of returned parts
    '  If Pos = 0 Then
    '    vstrProperty = Nothing
    '    vintValue = CInt(Right(vstrStringData, Len(vstrStringData) - Pos))
    '  Else
    '    vstrProperty = Left(vstrStringData, (Pos - 1))
    '    vintValue = CInt(Right(vstrStringData, Len(vstrStringData) - Pos))
    '  End If ' If Pos > 0

    'End Sub ' Sub ParseSettingsIntegerData() 

    ''----------------------------------------------------------------------------------------
    'Public Sub ParseSettingsDoubleData(vstrStringData As String,
    '                         ByRef vstrProperty As String,
    '                         ByRef vdblDouble As Integer)
    '  ' Each record consists of one or two parts. If only one part exists it is returned as 
    '  ' it is returned as the Value. If both parts (separated by the equals sign) exists,
    '  ' then the first part is returned as the Property and the second part is returned as
    '  ' the Value'

    '  ' first find the POS of the equals sign
    '  Dim Pos As Integer
    '  Pos = InStr(vstrStringData, "=")

    '  ' Now deternine number of returned parts
    '  If Pos = 0 Then
    '    vstrProperty = Nothing
    '    vdblDouble = CDbl(Right(vstrStringData, Len(vstrStringData) - Pos))
    '  Else
    '    vstrProperty = Left(vstrStringData, (Pos - 1))
    '    vdblDouble = CDbl(Right(vstrStringData, Len(vstrStringData) - Pos))
    '  End If ' If Pos > 0

    'End Sub ' Sub ParseSettingsDoubleData() 

    '========================================================================================

  End Class ' Public Class HUSetupFiles

  Public Class HUSettingsFiles
    '========================================================================================
    '
    '   Filename : HUSettingsFiles.vb
    '
    '   Description:
    '
    '   Called By:  AppInit : Initialise
    '
    '   Calls:
    '
    '   Version:
    '
    '   Date: 30 May 2017
    '
    '========================================================================================

    '========================================================================================
    '          PRIVATE CONSTANTS
    '========================================================================================
    'Dim cstrDefaultSetupFileName As String = "Setup"
    'Dim cstrSetupFileExtension As String = ".sup"

    Dim cstrDefaultSettingsFileName As String = "Setttings"
    Dim cstrSettingsFileExtension As String = ".stg"

    '========================================================================================
    '          PUBLIC CONSTANTS
    '========================================================================================
    'Public Enum HUSettingsFileMode
    '  fmBackup = 0
    '  fmReplace = 1
    'End Enum ' husettingsfilemode

    '========================================================================================
    '          PRIVATE VARIABLES
    '========================================================================================
    'Dim vstrOriginalFileExtension As String
    'Dim vstrOriginalFileName As String
    'Dim vstrOriginalFullFileName As String
    'Dim vstrOriginalFullFilePath As String

    '========================================================================================
    '          PUBLIC VARIABLES
    '========================================================================================

    '========================================================================================
    '          PRIVATE PROPERTIES
    '========================================================================================

    '========================================================================================
    '          PUBLIC PROPERTIES
    '========================================================================================

    '========================================================================================
    '          PRIVATE PROPERTY ROUTINES
    '========================================================================================

    '========================================================================================
    '          PUBLIC PROPERTY ROUTINES
    '========================================================================================

    '========================================================================================
    '          PRIVATE EVENT ROUTINES
    '========================================================================================

    '========================================================================================
    '          PUBLIC EVENT ROUTINES
    '========================================================================================

    '========================================================================================
    '          PRIVATE METHOD ROUTINES
    '========================================================================================

    '========================================================================================
    '          PUBLIC METHOD ROUTINES
    '========================================================================================

    '========================================================================================
    '          PRIVATE ROUTINES
    '========================================================================================

    '========================================================================================
    '          PUBLIC ROUTINES
    '========================================================================================

    '========================================================================================
    '          FILE ROUTINES
    '========================================================================================

    '==============================
    '     SETUP FILES
    '==============================
    'Public Sub ParseSetupStringData(vstrStringData As String,
    '                         ByRef vstrProperty As String,
    '                         ByRef vstrValue As String)
    '  ' Each record consists of one or two parts. If only one part exists it is returned as 
    '  ' it is returned as the Value. If both parts (separated by the equals sign) exists,
    '  ' then the first part is returned as the Property and the second part is returned as
    '  ' the Value'

    '  ' first find the POS of the equals sign
    '  Dim Pos As Integer
    '  Pos = InStr(vstrStringData, "=")

    '  ' Now deternine number of returned parts
    '  If Pos = 0 Then
    '    vstrProperty = Nothing
    '    vstrValue = Right(vstrStringData, Len(vstrStringData) - Pos)
    '  Else
    '    vstrProperty = Left(vstrStringData, (Pos - 1))
    '    vstrValue = Right(vstrStringData, Len(vstrStringData) - Pos)
    '  End If ' If Pos > 0

    'End Sub ' Sub ParseSetupStringData() 

    ''----------------------------------------------------------------------------------------
    'Public Sub ParseSetupBooleanData(vstrStringData As String,
    '                         ByRef vstrProperty As String,
    '                         ByRef vblnValue As Boolean)
    '  ' Each record consists of one or two parts. If only one part exists it is returned as 
    '  ' it is returned as the Value. If both parts (separated by the equals sign) exists,
    '  ' then the first part is returned as the Property and the second part is returned as
    '  ' the Value'

    '  ' first find the POS of the equals sign
    '  Dim Pos As Integer
    '  Pos = InStr(vstrStringData, "=")

    '  ' Now deternine number of returned parts
    '  If Pos = 0 Then
    '    vstrProperty = Nothing
    '    vblnValue = CBool(Right(vstrStringData, Len(vstrStringData) - Pos))
    '  Else
    '    vstrProperty = Left(vstrStringData, (Pos - 1))
    '    vblnValue = CBool(Right(vstrStringData, Len(vstrStringData) - Pos))
    '  End If ' If Pos > 0

    'End Sub ' Sub ParseSetupBooleanData()

    ''----------------------------------------------------------------------------------------
    'Public Sub ParseSetupIntegerData(vstrStringData As String,
    '                         ByRef vstrProperty As String,
    '                         ByRef vintValue As Integer)
    '  ' Each record consists of one or two parts. If only one part exists it is returned as 
    '  ' it is returned as the Value. If both parts (separated by the equals sign) exists,
    '  ' then the first part is returned as the Property and the second part is returned as
    '  ' the Value'

    '  ' first find the POS of the equals sign
    '  Dim Pos As Integer
    '  Pos = InStr(vstrStringData, "=")

    '  ' Now deternine number of returned parts
    '  If Pos = 0 Then
    '    vstrProperty = Nothing
    '    vintValue = CInt(Right(vstrStringData, Len(vstrStringData) - Pos))
    '  Else
    '    vstrProperty = Left(vstrStringData, (Pos - 1))
    '    vintValue = CInt(Right(vstrStringData, Len(vstrStringData) - Pos))
    '  End If ' If Pos > 0

    'End Sub ' Sub ParseSetupIntegerData() 

    ''----------------------------------------------------------------------------------------
    'Public Sub ParseSetupDoubleData(vstrStringData As String,
    '                         ByRef vstrProperty As String,
    '                         ByRef vdblDouble As Integer)
    '  ' Each record consists of one or two parts. If only one part exists it is returned as 
    '  ' it is returned as the Value. If both parts (separated by the equals sign) exists,
    '  ' then the first part is returned as the Property and the second part is returned as
    '  ' the Value'

    '  ' first find the POS of the equals sign
    '  Dim Pos As Integer
    '  Pos = InStr(vstrStringData, "=")

    '  ' Now deternine number of returned parts
    '  If Pos = 0 Then
    '    vstrProperty = Nothing
    '    vdblDouble = CDbl(Right(vstrStringData, Len(vstrStringData) - Pos))
    '  Else
    '    vstrProperty = Left(vstrStringData, (Pos - 1))
    '    vdblDouble = CDbl(Right(vstrStringData, Len(vstrStringData) - Pos))
    '  End If ' If Pos > 0

    'End Sub ' Sub ParseSetupDoubleData() 

    ''========================================================================================

    '==============================
    '     SETTING FILES
    '==============================
    Public Function FormatSettingStringData(vstrProperty As String, vstrValue As String) As String
      ' Each record consists of two parts. Both parts are concatenated using and equal sign
      ' and returned as the formatted string "vstrProperty=vstrValue"

      ' Format and return the String data
      Return vstrProperty + "=" + vstrValue

    End Function ' Function FormatSettingStringData() 

    '----------------------------------------------------------------------------------------
    Public Function FormatSettingBooleanData(vstrProperty As String, vblnValue As Boolean) As String
      ' Each record consists of two parts. Both parts are concatenated using and equal sign
      ' and returned as the formatted string "vstrProperty=vblnValue"

      ' Format and return the String data
      Dim vstrTStr As String
      vstrTStr = HUBooltoTFString(vblnValue)
      Return vstrProperty + "=" + vstrTStr

    End Function ' Function FormatSettingBooleanData() 

    '----------------------------------------------------------------------------------------
    Public Function FormatSetupIntegerData(vstrProperty As String, vintValue As Integer) As String
      ' Each record consists of two parts. Both parts are concatenated using and equal sign
      ' and returned as the formatted string "vstrProperty=vintValue"

      ' Format and return the String data
      Dim vstrTStr As String
      Try
        vstrTStr = CInt(vintValue)
      Catch ex As Exception
        vstrTStr = "Integer Conversion Error"
      End Try
      Return vstrProperty + "=" + vstrTStr

    End Function ' Function FormatSetupBooleanData() 

    '----------------------------------------------------------------------------------------
    Public Function FormatSetupDoubleData(vstrProperty As String, vdblValue As Double) As String
      ' Each record consists of two parts. Both parts are concatenated using and equal sign
      ' and returned as the formatted string "vstrProperty=vdblValue"

      ' Format and return the String data
      Dim vstrTStr As String
      Try
        vstrTStr = CDbl(vdblValue)
      Catch ex As Exception
        vstrTStr = "Double Conversion Error"
      End Try
      Return vstrProperty + "=" + vstrTStr

    End Function ' Function FormatSetupDoubleData() 

    '========================================================================================
    Public Sub ParseSettingsStringData(vstrStringData As String,
                              vstrProperty As String,
                              vstrValue As String)
      ' Each record consists of one or two parts. If only one part exists it is returned as 
      '  ' it is returned as the Value. If both parts (separated by the equals sign) exists,
      '  ' then the first part is returned as the Property and the second part is returned as
      '  ' the Value'

      ' first find the POS of the equals sign
      Dim Pos As Integer
      Pos = InStr(vstrStringData, "=")

      ' Now deternine number of returned parts
      If Pos = 0 Then
        vstrProperty = Nothing
        vstrValue = Right(vstrStringData, Len(vstrStringData) - Pos)
      Else
        vstrProperty = Left(vstrStringData, (Pos - 1))
        vstrValue = Right(vstrStringData, Len(vstrStringData) - Pos)
      End If ' If Pos > 0

    End Sub ' Sub ParseSettingsStringData() 

    '----------------------------------------------------------------------------------------
    Public Sub ParseSettingsBooleanData(vstrStringData As String,
                                ByRef vstrProperty As String,
                                ByRef vblnValue As Boolean)
      ' Each record consists of one or two parts. If only one part exists it is returned as 
      ' it is returned as the Value. If both parts (separated by the equals sign) exists,
      ' then the first part is returned as the Property and the second part is returned as
      ' the Value'

      Dim vstrTStr As String

      MsgBox(vstrStringData)

      ' first find the POS of the equals sign
      Dim Pos As Integer
      Pos = InStr(vstrStringData, "=")
      MsgBox(Right(vstrStringData, Len(vstrStringData) - Pos))

      ' Now deternine number of returned parts
      If Pos = 0 Then
        vstrProperty = Nothing
        MsgBox(Right(vstrStringData, Len(vstrStringData) - Pos))
        vblnValue = Right(vstrStringData, Len(vstrStringData) - Pos)
        'vblnValue = CBool(Right(vstrStringData, Len(vstrStringData) - Pos))
      Else
        vstrProperty = Left(vstrStringData, (Pos - 1))
        MsgBox(Right(vstrStringData, Len(vstrStringData) - Pos))
        'If Right(vstrStringData, Len(vstrStringData) - Pos) = "True" Then
        '  vblnValue = True
        'Else
        '  vblnValue = False
        'End If
        vblnValue = HUTFStringToBool(Right(vstrStringData, Len(vstrStringData) - Pos))

      End If ' If Pos > 0

    End Sub ' Sub ParseSettingsBooleanData()

    '----------------------------------------------------------------------------------------
    Public Sub ParseSettingsIntegerData(vstrStringData As String,
                             ByRef vstrProperty As String,
                             ByRef vintValue As Integer)
      ' Each record consists of one or two parts. If only one part exists it is returned as 
      ' it is returned as the Value. If both parts (separated by the equals sign) exists,
      ' then the first part is returned as the Property and the second part is returned as
      ' the Value'

      ' first find the POS of the equals sign
      Dim Pos As Integer
      Pos = InStr(vstrStringData, "=")

      ' Now deternine number of returned parts
      If Pos = 0 Then
        vstrProperty = Nothing
        vintValue = CInt(Right(vstrStringData, Len(vstrStringData) - Pos))
      Else
        vstrProperty = Left(vstrStringData, (Pos - 1))
        vintValue = CInt(Right(vstrStringData, Len(vstrStringData) - Pos))
      End If ' If Pos > 0

    End Sub ' Sub ParseSettingsIntegerData() 

    '----------------------------------------------------------------------------------------
    Public Sub ParseSettingsDoubleData(vstrStringData As String,
                             ByRef vstrProperty As String,
                             ByRef vdblDouble As Integer)
      ' Each record consists of one or two parts. If only one part exists it is returned as 
      ' it is returned as the Value. If both parts (separated by the equals sign) exists,
      ' then the first part is returned as the Property and the second part is returned as
      ' the Value'

      ' first find the POS of the equals sign
      Dim Pos As Integer
      Pos = InStr(vstrStringData, "=")

      ' Now deternine number of returned parts
      If Pos = 0 Then
        vstrProperty = Nothing
        vdblDouble = CDbl(Right(vstrStringData, Len(vstrStringData) - Pos))
      Else
        vstrProperty = Left(vstrStringData, (Pos - 1))
        vdblDouble = CDbl(Right(vstrStringData, Len(vstrStringData) - Pos))
      End If ' If Pos > 0

    End Sub ' Sub ParseSettingsDoubleData() 

    '========================================================================================

  End Class ' Public Class HUSettingsFiles

End Class ' HUFilesLibrary
