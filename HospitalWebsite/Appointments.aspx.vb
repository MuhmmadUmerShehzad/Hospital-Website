Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Partial Class Appointments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadDropdowns()
            LoadAppointments()
        End If
    End Sub

    Private Sub LoadDropdowns()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            conn.Open()
            ' Load Patients
            Dim cmdPat As New SqlCommand("SELECT patient_id, p_name FROM Patients", conn)
            ddlPatients.DataSource = cmdPat.ExecuteReader()
            ddlPatients.DataTextField = "p_name"
            ddlPatients.DataValueField = "patient_id"
            ddlPatients.DataBind()
            ddlPatients.Items.Insert(0, New ListItem("-- Select Patient --", ""))
            conn.Close()

            ' Load Doctors (Employees with Doctor designation)
            conn.Open()
            Dim cmdDoc As New SqlCommand("SELECT e.emp_id, e.emp_name FROM Employees e JOIN Designations d ON e.designation_id = d.designation_id WHERE d.designation_name = 'Doctor'", conn)
            ddlDoctors.DataSource = cmdDoc.ExecuteReader()
            ddlDoctors.DataTextField = "emp_name"
            ddlDoctors.DataValueField = "emp_id"
            ddlDoctors.DataBind()
            ddlDoctors.Items.Insert(0, New ListItem("-- Select Doctor --", ""))
        Catch ex As Exception
            lblMsg.Text = "Error loading dropdowns: " & ex.Message
        Finally
            conn.Close()
        End Try
    End Sub

    Private Sub LoadAppointments()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            Dim query As String = "SELECT v.visit_id, p.p_name as Patient, e.emp_name as Doctor, v.visit_date, v.diagnosis " & _
                                 "FROM Visits v " & _
                                 "JOIN Patients p ON v.patient_id = p.patient_id " & _
                                 "JOIN Employees e ON v.doctor_id = e.emp_id"
            Dim da As New SqlDataAdapter(query, conn)
            Dim dt As New DataTable()
            da.Fill(dt)
            gvAppointments.DataSource = dt
            gvAppointments.DataBind()
        Catch ex As Exception
            lblMsg.Text = "Error loading appointments: " & ex.Message
        Finally
            conn.Close()
        End Try
    End Sub

    Protected Sub btnBook_Click(sender As Object, e As EventArgs)
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
            lblMsg.Text = "Appointment booked successfully!"
            lblMsg.ForeColor = System.Drawing.Color.Green
            LoadAppointments()
        Catch ex As Exception
            lblMsg.Text = "Error booking appointment: " & ex.Message
            lblMsg.ForeColor = System.Drawing.Color.Red
        Finally
            conn.Close()
        End Try
    End Sub
End Class
