<?php
$host = 'mysql';
$user = 'root';
$pass = 'pass';
$dbname = 'mydb';

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$conn->query("CREATE TABLE IF NOT EXISTS visits (id INT AUTO_INCREMENT PRIMARY KEY, count INT DEFAULT 1)");

$conn->query("INSERT INTO visits (count) VALUES (1) ON DUPLICATE KEY UPDATE count = count + 1");

$result = $conn->query("SELECT SUM(count) AS total FROM visits");
$row = $result->fetch_assoc();
$visits = $row['total'];

echo "<h1>Hello World</h1>";
echo "<p>Page views: " . $visits . "</p>";

$conn->close();
?>