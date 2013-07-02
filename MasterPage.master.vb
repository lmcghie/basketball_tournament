Option Strict On
Option Explicit On
'Purpose: Get date and display logout button based on session activity.

Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim sysDate As Date = System.DateTime.Now
        lblDate.Text = CType(sysDate, String)

        'Display logout button if user is logged in
        If Session("User") Is Nothing Then
            btnLogout.Visible = False
        Else
            btnLogout.Visible = True
        End If

    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As System.EventArgs) Handles btnLogout.Click
        Session.Abandon()     'End session on button click and return to home page
        Response.Redirect("home.aspx")
    End Sub
End Class

