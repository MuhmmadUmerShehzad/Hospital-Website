Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Partial Class pat_reg
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        if Not IsPostBack Then
            LoadEmployees()
            LoadPatients()
        End If
    End Sub

    Private Sub LoadEmployees()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            Dim cmd As New SqlCommand("SELECT emp_id, emp_name FROM Employees", conn)
            conn.Open()
            ddlEmployees.DataSource = cmd.ExecuteReader()
            ddlEmployees.DataTextField = "emp_name"
            ddlEmployees.DataValueField = "emp_id"
            ddlEmployees.DataBind()
            ddlEmployees.Items.Insert(0, New ListItem("-- Select Staff --", ""))
        Catch ex As Exception
            lblMsg.Text = "Error: " & ex.Message
        Finally
            conn.Close()
        End Try
    End Sub

    Private Sub LoadPatients()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            Dim query As String = "SELECT p.patient_id, p.p_name, p.date_of_birth, e.emp_name as Registered_By " & _
                                 "FROM Patients p " & _
                                 "LEFT JOIN Employees e ON p.registered_by = e.emp_id"
            Dim da As New SqlDataAdapter(query, conn)
            Dim dt As New DataTable()
            da.Fill(dt)
            gvPatients.DataSource = dt
            gvPatients.DataBind()
        Catch ex As Exception
            lblMsg.Text = "Error: " & ex.Message
        Finally
            conn.Close()
        End Try
    End Sub

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs)
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            Dim query As String = "INSERT INTO Patients (p_name, date_of_birth, registered_by) VALUES (@name, @dob, @regBy)"
            Dim cmd As New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@name", txtPatientName.Text)
            cmd.Parameters.AddWithValue("@dob", txtDOB.Text)
            
            If ddlEmployees.SelectedValue <> "" Then
                cmd.Parameters.AddWithValue("@regBy", ddlEmployees.SelectedValue)
            Else
                cmd.Parameters.AddWithValue("@regBy", DBNull.Value)
            End If
            
            conn.Open()
            cmd.ExecuteNonQuery()
            lblMsg.Text = "Patient registered successfully!"
            lblMsg.ForeColor = System.Drawing.Color.Green
            LoadPatients()
        Catch ex As Exception
            lblMsg.Text = "Error registering patient: " & ex.Message
            lblMsg.ForeColor = System.Drawing.Color.Red
        Finally
            conn.Close()
        End Try
    End Sub
End Class
