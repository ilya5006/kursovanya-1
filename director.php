<?
session_start();

if($_SESSION['role'] != 'Директор' || empty($_SESSION['role']))
{
    header('Location: index.php');
}
?>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title> РУКОВОДИТЕЛЬ </title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
    <a href="logout.php"> ВЫЙТИ </a>
</body>
</html>