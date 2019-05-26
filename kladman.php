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
    <title> КЛАДМЭН </title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/kladman.css">
    <link rel="stylesheet" href="css/forms.css">
</head>
<body>
    <a href="logout.php"> ВЫЙТИ </a>
    
    <h2 id="title"> ТКАНИ: </h2>
    <form id="cloth" action="" method="POST">
        <?
            $query = "SELECT * FROM cloth";
            $result = mysqli_query($link, $query);

            while ($cloth_info = mysqli_fetch_row($result))
            {
                echo "<div id='info'>";
                    echo "<img src='$cloth_info[4]'>";
                    echo "<p> Имя: $cloth_info[1] </p>";
                    echo "<p> Композиция: $cloth_info[5] </p>";
                    echo "<p> Ширина: $cloth_info[6] </p>";
                    echo "<p> Длина: $cloth_info[7] </p>";
                    echo "<p> Цена: $cloth_info[8] </p>";
                echo "</div>";
            }
        ?>
    </form>

    <h2 id="title" style="margin-top: 10px;"> ФУРНИТУРЫ: </h2>
    <form id="furniture" action="" method="POST">
        <?
            $query = "SELECT * FROM furniture";
            $result = mysqli_query($link, $query);

            while ($furniture_info = mysqli_fetch_row($result))
            {
                echo "<div id='info'>";
                    echo "<img src='$furniture_info[6]'>";
                    echo "<p> Имя: $furniture_info[1] </p>";
                    echo "<p> Тип: $furniture_info[2] </p>";
                    echo "<p> Ширина: $furniture_info[3] </p>";
                    echo "<p> Длина: $furniture_info[4] </p>";
                    echo "<p> Вес: $furniture_info[5] </p>";
                    echo "<p> Цена: $furniture_info[7] </p>";  
                echo "</div>";
            }
        ?>
    </form>
</body>
</html>