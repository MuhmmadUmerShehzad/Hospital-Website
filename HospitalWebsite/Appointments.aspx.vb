Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Partial Class Appointments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Security: Check if user is logged in
        If Session("User") Is Nothing Then
            Response.Redirect("login.aspx")
        End If

        If Session("User") IsNot Nothing Then
            btnLogout.Visible = True
            If Session("Role") = "admin" Then
                phAdminLinks.Visible = True
            End If
        End If

        If Not IsPostBack Then
            LoadDropdowns()
            LoadAppointments()
        End If
    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As EventArgs)
        Session.Abandon()
        Response.Redirect("login.aspx")
    End Sub

    Private Sub LoadDropdowns()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            conn.Open()
            Dim cmdPat As New SqlCommand("SELECT patient_id, p_name FROM Patients", conn)
            ddlPatients.DataSource = cmdPat.ExecuteReader()
            ddlPatients.DataTextField = "p_name"
            ddlPatients.DataValueField = "patient_id"
            ddlPatients.DataBind()
            ddlPatients.Items.Insert(0, New ListItem("-- Select Patient --", ""))
            conn.Close()

            conn.Open()
            Dim cmdDoc As New SqlCommand("SELECT e.emp_id, e.emp_name FROM Employees e JOIN Designations d ON e.designation_id = d.designation_id WHERE d.designation_name = 'Doctor'", conn)
            ddlDoctors.DataSource = cmdDoc.ExecuteReader()
            ddlDoctors.DataTextField = "emp_name"
            ddlDoctors.DataValueField = "emp_id"
            ddlDoctors.DataBind()
            ddlDoctors.Items.Insert(0, New ListItem("-- Select Doctor --", ""))
        Catch ex As Exception
            lblMsg.Text = "Error: " & ex.Message
        Finally
            conn.Close()
        End Try
    End Sub

    Private Sub LoadAppointments()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            Dim query As String = "SELECT v.visit_id, p.p_name as Patient, e.emp_name as Doctor, v.visit_date, v.diagnosis FROM Visits v JOIN Patients p ON v.patient_id = p.patient_id JOIN Employees e ON v.doctor_id = e.emp_id"
            Dim da As New SqlDataAdapter(query, conn)
            Dim dt As New DataTable()
            da.Fill(dt)
            gvAppointments.DataSource = dt
            gvAppointments.DataBind()
        Catch ex As Exception
            lblMsg.Text = "Error: " & ex.Message
        End Try
    End Sub

    Protected Sub btnBook_Click(sender As Object, e As EventArgs)
        If Not Page.IsValid Then Return

        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            Dim query As String = "INSERT INTO Visits (patient_id, doctor_id, visit_date, diagnosis) VALUES (@pat, @doc, @date, @diag)"
            Dim cmd As New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@pat", ddlPatients.SelectedValue)
            cmd.Parameters.AddWithValue("@doc", ddlDoctors.SelectedValue)
            cmd.Parameters.AddWithValue("@date", txtDate.Text)
            cmd.Parameters.AddWithValue("@diag", txtDiagnosis.Text)
            conn.Open()
            cmd.ExecuteNonQuery()
            lblMsg.Text = "Success!"
            LoadAppointments()
        Catch ex As Exception
            lblMsg.Text = "Error: " & ex.Message
        Finally
            conn.Close()
        End Try
    End Sub
End Class
