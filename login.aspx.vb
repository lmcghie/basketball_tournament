'Login Page
'Purpose: Verify username and passowrd against team name and password of the coach's table from basketballDB database.
'           Created session and add values for coaches.aspx 
'Developer: Leonard McGhie

Option Strict On
Option Explicit On

Imports System.Data
Imports System.Data.SqlClient
Partial Class login
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(sender As Object, e As System.EventArgs) Handles btnLogin.Click
        Dim d_id, d_team_id, d_fname, d_lname As String

        'Get username and password values
        Dim strUsername As String = Trim(txtUsername.Text)
        Dim strPass As String = Trim(txtPassword.Text)

        'Connection String
        Dim strCnn As String = "Server=STLAP64; Database=basketballDB; User Id=sa; password=student"
        'SQL: INNER JOIN Coach on Teams to select id, team id, first name, last name, password, and team name based on 
        'submitted username (team name).

        Dim strSQL As String = "SELECT Coaches.id, Coaches.Team_Id, Coaches.fname, Coaches.lname, Coaches.pwd, Teams.Team_Name " +
            "FROM Coaches INNER JOIN [Teams] ON " + "Coaches.Team_Id = [Teams].id " + "WHERE Teams.Team_Name = " + "'" +
            strUsername + "';"

        Dim cnn As SqlConnection = New SqlConnection(strCnn)     'Create connection
        cnn.Open() ' Open connection

        'Create sql command
        Dim cmd As SqlCommand = New SqlCommand(strSQL, cnn)
    
        'Populate reader object
        Dim rdr = cmd.ExecuteReader
        If rdr.HasRows Then
            rdr.Read()
            If strPass = rdr("Pwd").ToString Then           'Check password
                d_id = rdr("id").ToString
                d_team_id = rdr("Team_Id").ToString
                d_fname = rdr("fname").ToString
                d_lname = rdr("lname").ToString

                'Add to session
                Session("User") = d_id
                Session("Team_Id") = d_team_id
                Session("First_Name") = d_fname
                Session("Last_Name") = d_lname
                Response.Redirect("coaches.aspx")
            Else
                lbllogin.Text = "Incorrect Password"
            End If
        Else
            lbllogin.Text = "Incorrect Username"

        End If
        'Close reader and connection
            If Not (rdr Is Nothing) Then
                If Not rdr.IsClosed Then
                    rdr.Close()
                End If
                If cnn.State = ConnectionState.Open Then
                    cnn.Close()
                End If
            End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        txtUsername.Focus()
    End Sub
End Class
