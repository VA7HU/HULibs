Imports System.Windows.Forms

Public Class HUMessagesLibrary

  '========================================================================================
  '
  '   Filename : HUMessagesLibrary.vb
  '
  '   Description:
  '
  '   Called By:  
  '
  '   Calls:
  '
  '   Version:  1.0.0
  '
  '   Date: 25 Feb 2018
  '
  '========================================================================================

  '========================================================================================
  '         GLOBAL STUFF
  '========================================================================================
  'Message, Caption, Buttons, Icon, DefaultButton, BoxOptions, HelpFile, HelpNavigator,
  'HelpTopic, HelpKeyword

  '----------------------------------------------------------------------------------------
  '          PRIVATE CONSTANTS
  '----------------------------------------------------------------------------------------
  Private cstrConfirmationCaptionString = "Confirmation : "
  Private cstrErrorCaptionString = "Error : "
  Private cstrInformationCaptionString = "Information : "
  Private cstrWarningCaptionString = "Warning : "

  '----------------------------------------------------------------------------------------
  '          PRIVATE VARIABLES
  '----------------------------------------------------------------------------------------
  Private vstrCaptionString As String

  '========================================================================================
  '          CONFIRMATION MESSAGES
  '========================================================================================
  Public Function HUConfirmationMessageOK(vstrMsg As String,
                                         vstrCaption As String) As MsgBoxResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrConfirmationCaptionString
    Else
      vstrCaptionString = cstrConfirmationCaptionString + vstrCaption
    End If 'If vstrCaption = Nothing

    Return MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OK,
                               MessageBoxIcon.Exclamation)

  End Function 'Public Function HUConfirmationMessageOK()

  '--------------------------------------------------------------------------------------
  Public Function HUConfirmationMessageOKCancel(vstrMsg As String,
                                               vstrCaption As String) As MsgBoxResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrConfirmationCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Return MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
                               MessageBoxIcon.Exclamation)

  End Function 'Public Function HUConfirmationMessageOKCancel()

  ''--------------------------------------------------------------------------------------
  Public Function HUConfirmationMessagMessageRetryCancel(vstrMsg As String,
                                           vstrCaption As String) As MsgBoxResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrConfirmationCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Return MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
                               MessageBoxIcon.Exclamation)

  End Function 'Public Function HUConfirmationMessageRetryCancel()

  '========================================================================================
  '          ERROR MESSAGES
  '========================================================================================
  'Message, Caption, Buttons, Icon, DefaultButton, BoxOptions, HelpFile, HelpNavigator,
  'HelpTopic, HelpKeyword

  Public Function HUErrorMessageOK(vstrMsg As String,
                                  vstrCaption As String) As MsgBoxResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrErrorCaptionString
    Else
      vstrCaptionString = cstrErrorCaptionString + vstrCaption
    End If 'If vstrCaption = Nothing

    Return MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OK,
                               MessageBoxIcon.Error)

  End Function 'Public Function HUErrorMessageOK()

  '--------------------------------------------------------------------------------------
  Public Function HUErrorMessageOKCancel(vstrMsg As String,
                                        vstrCaption As String) As MsgBoxResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrErrorCaptionString
    Else
      vstrCaptionString = cstrErrorCaptionString + vstrCaption
    End If 'If vstrCaption = Nothing


    Return MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
                               MessageBoxIcon.Error)

  End Function 'Public Function HUErrorMessageOKCancel()

  '--------------------------------------------------------------------------------------
  Public Function HUErrorMessageRetryCancel(vstrMsg As String,
                                           vstrCaption As String) As MsgBoxResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrErrorCaptionString
    Else
      vstrCaptionString = cstrErrorCaptionString + vstrCaption
    End If 'If vstrCaption = Nothing

    Return MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.RetryCancel,
                             MessageBoxIcon.Error)

  End Function 'Public Function HUErrorMessageRetryCancel()

  '========================================================================================
  '          INFORMATION MESSAGES
  '========================================================================================
  Public Function HUInformationMessageOK(vstrMsg As String,
                                         vstrCaption As String) As MsgBoxResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrInformationCaptionString
    Else
      vstrCaptionString = cstrInformationCaptionString + vstrCaption
    End If 'If vstrCaption = Nothing

    Return MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OK,
                               MessageBoxIcon.Information)

  End Function 'Public Function HUInformationMessageOK()

  '--------------------------------------------------------------------------------------
  Public Function HUInformationMessageOKCancel(vstrMsg As String,
                                               vstrCaption As String) As MsgBoxResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrInformationCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Return MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
                               MessageBoxIcon.Information)

  End Function 'Public Function HUInformationMessageOKCancel()

  '''--------------------------------------------------------------------------------------
  Public Function HUInformationnMessageRetryCancel(vstrMsg As String,
                                           vstrCaption As String) As MsgBoxResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrInformationCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Return MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
                               MessageBoxIcon.Information)

  End Function 'Public Function HUInformationMessageRetryCancel()

  '========================================================================================
  '          QUERY MESSAGES
  '========================================================================================
  'Public Function HUConfirmationMessageOK(vstrMsg As String,
  '                                       vstrCaption As String) As MsgBoxResult

  '  Dim Result As DialogResult

  '  If vstrCaption = Nothing Then
  '    vstrCaptionString = cstrConfirmationCaptionString
  '  Else
  '    vstrCaptionString = vstrCaption
  '  End If 'If vstrCaption = Nothing

  '  Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OK,
  '                             MessageBoxIcon.Exclamation)

  'End Function 'Public Function HUConfirmationMessageOK()

  ''--------------------------------------------------------------------------------------
  'Public Function HUConfirmationMessageOKCancel(vstrMsg As String,
  '                                             vstrCaption As String) As MsgBoxResult

  '  Dim Result As DialogResult

  '  If vstrCaption = Nothing Then
  '    vstrCaptionString = cstrConfirmationCaptionString
  '  Else
  '    vstrCaptionString = vstrCaption
  '  End If 'If vstrCaption = Nothing

  '  Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
  '                             MessageBoxIcon.Exclamation)

  'End Function 'Public Function HUConfirmationMessageOKCancel()

  '''--------------------------------------------------------------------------------------
  'Public Function HUConfirmationMessageRetryCancel(vstrMsg As String,
  '                                         vstrCaption As String) As MsgBoxResult

  '  Dim Result As DialogResult


  '  If vstrCaption = Nothing Then
  '    vstrCaptionString = cstrConfirmationCaptionString
  '  Else
  '    vstrCaptionString = vstrCaption
  '  End If 'If vstrCaption = Nothing

  '  Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
  '                             MessageBoxIcon.Exclamation)

  'End Function 'Public Function HUConfirmationMessageRetryCancel()

  '========================================================================================
  '          WARNING MESSAGES
  '========================================================================================
  Public Function HUWarningMessageOK(vstrMsg As String,
                                  vstrCaption As String) As MsgBoxResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrErrorCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Return MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OK,
                                 MessageBoxIcon.Warning)

  End Function 'Public Function HUWarningMessageOK()

  '--------------------------------------------------------------------------------------
  Public Function HUWarningMessageOKCancel(vstrMsg As String,
                                        vstrCaption As String) As MsgBoxResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrErrorCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Return MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
                               MessageBoxIcon.Warning)

  End Function 'Public Function HUWarningMessageOKCancel()

  '--------------------------------------------------------------------------------------
  Public Function HUWarningMessageRetryCancel(vstrMsg As String,
                                           vstrCaption As String) As MsgBoxResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrErrorCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Return MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.RetryCancel,
                             MessageBoxIcon.Warning)

  End Function 'Public Function HUWarningMessageRetryCancel()

  '======================================================================================

End Class ' Public Class HUMessagesLibrary
