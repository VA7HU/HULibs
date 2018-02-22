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
  '   Date: 22 Feb 2018
  '
  '=========================================================================================
  'Message, Caption, Buttons, Icon, DefaultButton, BoxOptions, HelpFile, HelpNavigator,
  'HelpTopic, HelpKeyword

  '========================================================================================
  '          PRIVATE CONSTANTS
  '========================================================================================
  Private cstrErrorCaptionString = "Error"
  Private cstrWarningCaptionString = "Warning"
  Private cstrConfirmationCaptionString = "Confirmation"

  '========================================================================================
  '          PRIVATE VARIABLES
  '========================================================================================
  Private vstrCaptionString As String






  '========================================================================================
  '          CONFIRMATION MESSAGES
  '========================================================================================
  Public Function HUConfirmationMessagOK(vstrMsg As String,
                                         vstrCaption As String) As MsgBoxResult

    Dim Result As DialogResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrConfirmationCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OK,
                               MessageBoxIcon.Exclamation)

  End Function 'Public Function HUConfirmationMessagOK()

  '--------------------------------------------------------------------------------------
  Public Function HUConfirmationMessagOKCancel(vstrMsg As String,
                                               vstrCaption As String) As MsgBoxResult

    Dim Result As DialogResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrConfirmationCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
                               MessageBoxIcon.Exclamation)

  End Function 'Public Function HUConfirmationMessagOKCancel()

  ''--------------------------------------------------------------------------------------
  Public Function HUConfirmationMessagRetryCancel(vstrMsg As String,
                                           vstrCaption As String) As MsgBoxResult

    Dim Result As DialogResult


    If vstrCaption = Nothing Then
      vstrCaptionString = cstrConfirmationCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
                               MessageBoxIcon.Exclamation)

  End Function 'Public Function HUConfirmationMessagRetryCancel()






  '========================================================================================
  '          ERROR MESSAGES
  '========================================================================================
  'Message, Caption, Buttons, Icon, DefaultButton, BoxOptions, HelpFile, HelpNavigator,
  'HelpTopic, HelpKeyword

  Public Function HUErrorMessagOK(vstrMsg As String,
                                  vstrCaption As String) As MsgBoxResult

    Dim Result As DialogResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrErrorCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OK,
                               MessageBoxIcon.Error)

  End Function 'Public Function HUErrorMessagOK()

  '--------------------------------------------------------------------------------------
  Public Function HUErrorMessagOKCancel(vstrMsg As String,
                                        vstrCaption As String) As MsgBoxResult

    Dim Result As DialogResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrErrorCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing


    Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
                               MessageBoxIcon.Error)

  End Function 'Public Function HUErrorMessagOKCancel()

  '--------------------------------------------------------------------------------------
  Public Function HUErrorMessagRetryCancel(vstrMsg As String,
                                           vstrCaption As String) As MsgBoxResult

    Dim Result As DialogResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrErrorCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.RetryCancel,
                             MessageBoxIcon.Error)

  End Function 'Public Function HUErrorMessagRetryCancel()






  '========================================================================================
  '          INFORMATION MESSAGES
  '========================================================================================
  Public Function HUInformationMessagOK(vstrMsg As String,
                                         vstrCaption As String) As MsgBoxResult

    Dim Result As DialogResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrConfirmationCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OK,
                               MessageBoxIcon.Information)

  End Function 'Public Function HUInformationMessagOK()

  '--------------------------------------------------------------------------------------
  Public Function HUInformationMessagOKCancel(vstrMsg As String,
                                               vstrCaption As String) As MsgBoxResult

    Dim Result As DialogResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrConfirmationCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
                               MessageBoxIcon.Information)

  End Function 'Public Function HUInformationMessagOKCancel()

  '''--------------------------------------------------------------------------------------
  Public Function HUInformationnMessagRetryCancel(vstrMsg As String,
                                           vstrCaption As String) As MsgBoxResult

    Dim Result As DialogResult


    If vstrCaption = Nothing Then
      vstrCaptionString = cstrConfirmationCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
                               MessageBoxIcon.Information)

  End Function 'Public Function HUInformationMessagRetryCancel()






  '========================================================================================
  '          QUERY MESSAGES
  '========================================================================================
  'Public Function HUConfirmationMessagOK(vstrMsg As String,
  '                                       vstrCaption As String) As MsgBoxResult

  '  Dim Result As DialogResult

  '  If vstrCaption = Nothing Then
  '    vstrCaptionString = cstrConfirmationCaptionString
  '  Else
  '    vstrCaptionString = vstrCaption
  '  End If 'If vstrCaption = Nothing

  '  Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OK,
  '                             MessageBoxIcon.Exclamation)

  'End Function 'Public Function HUConfirmationMessagOK()

  ''--------------------------------------------------------------------------------------
  'Public Function HUConfirmationMessagOKCancel(vstrMsg As String,
  '                                             vstrCaption As String) As MsgBoxResult

  '  Dim Result As DialogResult

  '  If vstrCaption = Nothing Then
  '    vstrCaptionString = cstrConfirmationCaptionString
  '  Else
  '    vstrCaptionString = vstrCaption
  '  End If 'If vstrCaption = Nothing

  '  Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
  '                             MessageBoxIcon.Exclamation)

  'End Function 'Public Function HUConfirmationMessagOKCancel()

  '''--------------------------------------------------------------------------------------
  'Public Function HUConfirmationMessagRetryCancel(vstrMsg As String,
  '                                         vstrCaption As String) As MsgBoxResult

  '  Dim Result As DialogResult


  '  If vstrCaption = Nothing Then
  '    vstrCaptionString = cstrConfirmationCaptionString
  '  Else
  '    vstrCaptionString = vstrCaption
  '  End If 'If vstrCaption = Nothing

  '  Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
  '                             MessageBoxIcon.Exclamation)

  'End Function 'Public Function HUConfirmationMessagRetryCancel()






  '========================================================================================
  '          WARNING MESSAGES
  '========================================================================================
  Public Function HUWarningMessagOK(vstrMsg As String,
                                  vstrCaption As String) As MsgBoxResult

    Dim Result As DialogResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrErrorCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OK,
                                 MessageBoxIcon.Warning)

  End Function 'Public Function HUWarningMessagOK()

  '--------------------------------------------------------------------------------------
  Public Function HUWarningMessagOKCancel(vstrMsg As String,
                                        vstrCaption As String) As MsgBoxResult

    Dim Result As DialogResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrErrorCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.OKCancel,
                               MessageBoxIcon.Warning)

  End Function 'Public Function HUWarningMessagOKCancel()

  '--------------------------------------------------------------------------------------
  Public Function HUMessagRetryCancel(vstrMsg As String,
                                           vstrCaption As String) As MsgBoxResult

    Dim Result As DialogResult

    If vstrCaption = Nothing Then
      vstrCaptionString = cstrErrorCaptionString
    Else
      vstrCaptionString = vstrCaption
    End If 'If vstrCaption = Nothing

    Result = MessageBox.Show(vstrMsg, vstrCaptionString, MessageBoxButtons.RetryCancel,
                             MessageBoxIcon.Warning)

  End Function 'Public Function HUWarningMessagRetryCancel()

  '======================================================================================

End Class ' Public Class HUMessagesLibrary
