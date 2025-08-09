IF NOT EXISTS (
    SELECT * FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[Genders]') AND type = 'U'
)
BEGIN
    CREATE TABLE Genders (
        GenderID INT PRIMARY KEY IDENTITY(1,1),
        GenderName NVARCHAR(10) NOT NULL
);
END
IF NOT EXISTS (
    SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Genders]') AND type = 'U'
)
BEGIN
    CREATE TABLE Genders (
        GenderID INT PRIMARY KEY IDENTITY(1,1),
        GenderName NVARCHAR(10) NOT NULL
);
END
IF NOT EXISTS (
    SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StatusTypes]') AND type = 'U'
)
BEGIN
    CREATE TABLE StatusTypes (
        StatusID INT PRIMARY KEY IDENTITY(1,1),
        StatusName NVARCHAR(20) NOT NULL,
        StatusCategory NVARCHAR(20) NOT NULL
);
END
IF NOT EXISTS (
    SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patients]') AND type = 'U'
)
BEGIN
    CREATE TABLE Patients (
        PatientID INT PRIMARY KEY IDENTITY(1,1),
        FirstName NVARCHAR(50) NOT NULL,
        LastName NVARCHAR(50) NOT NULL,
        DateOfBirth DATE NOT NULL,
        GenderID INT NOT NULL,
        PhoneNumber NVARCHAR(15),
        Email NVARCHAR(100),
        Address NVARCHAR(MAX),
        CreatedAt DATETIME DEFAULT GETDATE(),
        UpdatedAt DATETIME,
        FOREIGN KEY (GenderID) REFERENCES Genders(GenderID)
);
END
IF NOT EXISTS (
    SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctors]') AND type = 'U'
)
BEGIN
    CREATE TABLE Doctors (
        DoctorID INT PRIMARY KEY IDENTITY(1,1),
        FirstName NVARCHAR(50) NOT NULL,
        LastName NVARCHAR(50) NOT NULL,
        Specialty NVARCHAR(100) NOT NULL,
        PhoneNumber NVARCHAR(15),
        Email NVARCHAR(100),
        CreatedAt DATETIME DEFAULT GETDATE(),
        UpdatedAt DATETIME
);
END
IF NOT EXISTS (
    SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Appointments]') AND type = 'U'
)
BEGIN
    CREATE TABLE Appointments (
        AppointmentID INT PRIMARY KEY IDENTITY(1,1),
        PatientID INT NOT NULL,
        DoctorID INT NOT NULL,
        AppointmentDate DATETIME NOT NULL,
        Reason NVARCHAR(MAX),
        StatusID INT NOT NULL,
        CreatedAt DATETIME DEFAULT GETDATE(),
        UpdatedAt DATETIME,
        FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
        FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
        FOREIGN KEY (StatusID) REFERENCES StatusTypes(StatusID)
);
END
IF NOT EXISTS (
    SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy]') AND type = 'U'
)
BEGIN
    CREATE TABLE Pharmacy (
        MedicineID INT PRIMARY KEY IDENTITY(1,1),
        MedicineName NVARCHAR(100) NOT NULL,
        Description NVARCHAR(MAX),
        Price DECIMAL(10,2) NOT NULL,
        QuantityInStock INT NOT NULL,
        ExpiryDate DATE,
        CreatedAt DATETIME DEFAULT GETDATE(),
        UpdatedAt DATETIME
);
END
IF NOT EXISTS (
    SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoices]') AND type = 'U'
)
BEGIN
    CREATE TABLE Invoices (
        InvoiceID INT PRIMARY KEY IDENTITY(1,1),
        AppointmentID INT NOT NULL,
        TotalAmount DECIMAL(10,2) NOT NULL,
        PaymentStatusID INT NOT NULL,
        PaymentDate DATETIME,
        CreatedAt DATETIME DEFAULT GETDATE(),
        UpdatedAt DATETIME,
        FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID),
        FOREIGN KEY (PaymentStatusID) REFERENCES StatusTypes(StatusID)
);
END
IF NOT EXISTS (
    SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicalRecords]') AND type = 'U'
)
BEGIN
    CREATE TABLE MedicalRecords (
        RecordID INT PRIMARY KEY IDENTITY(1,1),
        PatientID INT NOT NULL,
        DoctorID INT NOT NULL,
        VisitDate DATETIME NOT NULL,
        Diagnosis NVARCHAR(MAX),
        Treatment NVARCHAR(MAX),
        CreatedAt DATETIME DEFAULT GETDATE(),
        UpdatedAt DATETIME,
        FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
        FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
END
IF NOT EXISTS (
    SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Prescriptions]') AND type = 'U'
)
BEGIN
    CREATE TABLE Prescriptions (
        PrescriptionID INT PRIMARY KEY IDENTITY(1,1),
        RecordID INT NOT NULL,
        MedicineID INT NOT NULL,
        Dosage NVARCHAR(50),
        Duration NVARCHAR(50),
        FOREIGN KEY (RecordID) REFERENCES MedicalRecords(RecordID),
        FOREIGN KEY (MedicineID) REFERENCES Pharmacy(MedicineID)
);
END