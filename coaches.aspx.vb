Option Strict On
Option Explicit On
'Developer:Leonard McGhie
'Purpose: Redirect user to login page if not logged in. If logged in, display players based on session team_id value.

Partial Class coaches
    Inherits System.Web.UI.Page


    'Get label from session value assigned by coach page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim disp_coachfname As String = CStr(Session("First_Name"))
        Dim disp_coachlname As String = CStr(Session("Last_Name"))

        lblCoach.Text = "Welcome Coach " + disp_coachfname + " " + disp_coachlname



        'If user is not logged in, then redirect to login page
        If HttpContext.Current.Session("user") Is Nothing Then
            Response.Redirect("login.aspx")
        End If


    End Sub

End Class
