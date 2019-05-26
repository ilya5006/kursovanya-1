<?
session_start();
require_once "connection.php";
if($_SESSION['role'] != 'Кладовщик' || empty($_SESSION['role']))
{
    header('Location: index.php');
}
?>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title> КЛАДМЕН </title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/kladman.css">
</head>
<body>
    <a href="logout.php"> ВЫЙТИ </a>
    
    <h2> ТКАНИ: </h2>

    <form id="cloth" action="" method="POST">
        <?
            $query = "SELECT * FROM cloth";
            $result = mysqli_query($link, $query);

            while ($cloth_info = mysqli_fetch_row($result))
            {
                echo "<div id='info'>";
                    echo "<img src='$cloth_info[4]'>";
                    echo "<p> Имя: $cloth_info[1] </p>"; // Имя ткани
                    echo "<p> Композиция: $cloth_info[5] </p>"; // Композиция ткани
                    echo "<p> Ширина: $cloth_info[6] </p>"; // Ширина ткани
                    echo "<p> Длина: $cloth_info[7] </p>"; // Длина ткани
                    echo "<p> Цена: $cloth_info[8] </p>"; // Цена ткани
                echo "</div>";
            }
        ?>
    </form>
</body>
</html>