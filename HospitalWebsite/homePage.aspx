<%@ Page Language="VB" AutoEventWireup="false" CodeFile="homePage.aspx.vb" Inherits="homePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>homePage</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- the header of the page is here header -->
    <header>
        <h1>HospitalDB</h1>
        <p>Your Health, Our Priority</p>
    </header>

    <!-- the navbar of the page is here -->
    <nav>
        <ul>
            <li><a href="homePage.aspx" class="active">Home</a></li>
            <li><a href="departments.aspx">Departments</a></li>
            <li><a href="employees.aspx">Our Doctors</a></li>
            <li><a href="Appointments.aspx">Book Appointment</a></li>
            <li><a href="pat_reg.aspx">Register</a></li>
            <li><a href="login.aspx">Staff Login</a></li>
            <li><a href="help.aspx">Help</a></li>
        </ul>
    </nav>

    <!-- main container is here -->
    <div class="main_container">
        <div class="homeBox">
            <h2 style="font-size: 40px">Welcome to our Hospital</h2>
            <p>Providing Quality Healthcare Services with Compassion and Excellence</p>
            <a href="Appointments.aspx" class="btn btn-success">Book Appointment</a>
            <a href="Appointments.aspx" class="btn btn-primary">Register Patient</a>
        </div>

        <!-- this is the grid for departments  -->
        <h2 style="color: #2c3e50; margin-bottom: 25px;">Our Departments</h2>
        <div class="department_info">
            <div class="dept_card">
                <h3>Department_Name</h3>
                <div class="info">
                    <p>Department Info</p>
                </div>
            </div>
            <div class="dept_card">
                <h3>Department_Name</h3>
                <div class="info">
                    <p>Department Info</p>
                </div>
            </div>
            <div class="dept_card">
                <h3>Department_Name</h3>
                <div class="info">
                    <p>Department Info</p>
                </div>
            </div>
        </div>

        <!-- This part is for the about -->
        <div class="about-section">
            <h2 style="color: #2c3e50; margin-bottom: 25px; border-bottom: 3px solid #3498db;">About Hospital</h2>
            <p>
                HospitalDB is committed to providing exceptional healthcare services to our community.
                With state-of-the-art facilities and a team of experienced medical professionals, we offer
                comprehensive care across multiple specialties. Our patient-centered approach ensures that
                every individual receives personalized attention and the highest quality treatment.
            </p>
        </div>

        <!-- this part is for contact -->
        <div class="info-section">
            <h2>Contact Information</h2>
            <div class="contact-info">
                <div class="contact-item">
                    <strong>Emergency</strong>
                    <span>911 / 24/7 Available</span>
                </div>
                <div class="contact-item">
                    <strong>Appointments</strong>
                    <span>+1 (555) 123-4567</span>
                </div>
                <div class="contact-item">
                    <strong>Email</strong>
                    <span>info@hospitaldb.com</span>
                </div>
                <div class="contact-item">
                    <strong>Hours</strong>
                    <span>Mon-Fri: 8AM - 8PM<br>Sat-Sun: 9AM - 5PM</span>
                </div>
            </div>
        </div>
        <footer>
            <p>&copy; 2026 HospitalDB. All Rights Reserved. | Providing Quality Healthcare Since 2000</p>
        </footer>

        <h3><a href="dashboard.aspx">Back to lab dashboard</a></h3>
    </div>
        </div>
    </form>
</body>
</html>
