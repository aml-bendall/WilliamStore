Imports System.Data.OleDb
Imports System.Data
Imports System.Web.Configuration

Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub LoginButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LoginButton.Click
        Dim connect As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data source=C:\Users\Demystify\Desktop\WilliamStore\WebSite2\TeamA_WSC_Website_Database.accdb;User ID=Admin;Password=;"
        Dim query As String
        query = "Select Count(*) From Customer Where LoginName = ? And Password = ?"
        Dim result As Integer = 0
        Using conn As New OleDbConnection(connect)
            Using cmd As New OleDbCommand(query, conn)
                cmd.Parameters.AddWithValue("", UserName.Text)
                cmd.Parameters.AddWithValue("", Password.Text)
                conn.Open()
                Session("User") = UserName.Text
                result = DirectCast(cmd.ExecuteScalar(), Integer)
            End Using
        End Using
        If result > 0 Then
            FormsAuthentication.RedirectFromLoginPage(UserName.Text, RememberMe.Checked)
            Response.Redirect("wscHome.aspx")
        Else
            InvalidCredentialsMessage.Visible = True
        End If
    End Sub
End Class
