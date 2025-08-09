<?php
include 'db.php'; 
$sql = "SELECT * FROM patients WHERE age > 30";
$result = mysqli_query($conn, $sql);


$serverName = "DESKTOP-BCO8OLP\\SQLEXPRESS";
$connectionOptions = [
    "Database" => "clinicDB",
    "TrustServerCertificate" => true,
    "CharacterSet" => "UTF-8"
];
$conn = sqlsrv_connect($serverName, $connectionOptions);

if (!$conn) {
    die("❌ فشل الاتصال: ". print_r(sqlsrv_errors(), true));
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $firstName = $_POST["FirstName"];
    $lastName = $_POST["LastName"];
    $dob = $_POST["DateOfBirth"];
    $genderID = $_POST["GenderID"];

    $sql = "INSERT INTO Patients (FirstName, LastName, DateOfBirth, GenderID)
            VALUES (?,?,?,?)";
    $params = [$firstName, $lastName, $dob, $genderID];

    $stmt = sqlsrv_query($conn, $sql, $params);

    if ($stmt) {
        echo "✅ تم إضافة المريض بنجاح.";
} else {
        echo "❌ حدث خطأ أثناء الإضافة: ";
        print_r(sqlsrv_errors());
}
}
?>
<?php
include 'db.php';

$data = json_decode(file_get_contents("php://input"), true);

$name = $data['name'];
$age = $data['age'];

$sql = "INSERT INTO patients (name, age) VALUES ('$name', '$age')";
if (mysqli_query($conn, $sql)) {
  echo "تم الحفظ بنجاح";
} else {
  echo "خطأ: " . mysqli_error($conn);
}
?>