Option Strict On
Option Explicit On

Imports System.Data
Imports System.Data.SqlClient

'Purpose New User Registration


Partial Class contactUs
    Inherits System.Web.UI.Page

    Protected Sub btnUSubmit_Click(sender As Object, e As System.EventArgs) Handles btnUSubmit.Click
        '---------------------------------------------------Change back to original!!!!!!!!!!
        'Connection String
        Dim strCnn As String = "Server=STLAP64; Database=basketballDB2; User Id=sa; password=student"

        Dim strSQL As String = "INSERT INTO Teams(Team_Name) VALUES(@tname); " + _
             "INSERT INTO Coaches(fname, lname, pwd) VALUES(@fname, @lname, @pwd); "

        Dim cnn As SqlConnection = New SqlConnection(strCnn)     'Create connection
        cnn.Open() ' Open connection

        'Create sql command
        Dim cmd As SqlCommand = New SqlCommand(strSQL, cnn)

        With cmd.Parameters
            .AddWithValue("tname", txtNusername.Text)
            .AddWithValue("fname", txtfname.Text)
            .AddWithValue("lname", txtlname.Text)
            .AddWithValue("pwd", txtNPassword.Text)

        End With

        cmd.ExecuteNonQuery()

        'Run second SQL statement
        Dim strSQL2 As String = "UPDATE Coaches SET Team_Id = (SELECT id FROM Teams WHERE Team_Name = " + _
           "'" + txtNusername.Text + "');" + _
           "UPDATE Teams SET Coach_Id = (SELECT id FROM Coaches WHERE Coaches.id = Teams.id) "

        Dim cmd2 As SqlCommand = New SqlCommand(strSQL2, cnn)
        cmd2.ExecuteNonQuery()
        cnn.Close()

        'Close connection

        If cnn.State = ConnectionState.Open Then
            cnn.Close()
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtNusername.Focus()
        End If

    End Sub
End Class
