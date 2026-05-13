Partial Class homePage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") IsNot Nothing Then
            btnLogout.Visible = True
            
            ' Show admin links if user is admin
            If Session("Role") = "admin" Then
                phAdminLinks.Visible = True
            End If
        End If
    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As EventArgs)
        Session.Abandon()
        Response.Redirect("login.aspx")
    End Sub
End Class
