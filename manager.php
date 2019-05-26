<?
session_start();
require_once "connection.php";
if($_SESSION['role'] != 'Менеджер' OR empty($_SESSION['role']))
{
    header('Location: index.php');
}
?>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title> МЕНЕДЖЭР </title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
    <a href="logout.php"> ВЫЙТИ </a>
</body>
</html>