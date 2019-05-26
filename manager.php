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
    <link rel="stylesheet" href="css/manager.css">
    <link rel="stylesheet" href="css/forms.css">
</head>
<body>
    <a href="logout.php"> ВЫЙТИ </a>

    <h2 id="title"> ИЗДЕЛИЯ: </h2>
    <form id="products" action="" method="POST">
        <?
            $query = "SELECT * FROM products";
            $result = mysqli_query($link, $query);

            while ($cloth_info = mysqli_fetch_row($result))
            {
                echo "<div id='info'>";
                    echo "<img src='$cloth_info[4]'>";
                    echo "<p> Имя: $cloth_info[1] </p>"; 
                    echo "<p> Ширина: $cloth_info[2] </p>";
                    echo "<p> Длина: $cloth_info[3] </p>";
                    echo "<p> Краткая информация: $cloth_info[5] </p>"; 
                echo "</div>";
            }
        ?>
    </form>
</body>
</html>