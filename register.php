<?
require "connection.php";
session_start();

if (isset($_SESSION['role'])) 
{
    header('Location: index.php');
}
?>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title> РЕГИСТРАЦИЯ </title>
    <link rel="stylesheet" href="css/auth.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>

<div id="login">
    <h2> РЕГИСТРАЦИЯ </h2>
    <form method="POST" action=""> 
        <input class="enter" type="text" name="register_name" placeholder="НАИМЕНОВАНИЕ">
        <input class="enter" required type="text" name="register_login" placeholder="ЛОГИН">
        <input class="enter" required type="text" name="register_password" placeholder="ПАРОЛЬ">
        <input id="registration" type="submit" name="register_button" value="ЗАРЕГИСТРИРОВАТЬСЯ">
        <?
            if (isset($_POST['register_button']))
            {
                $name = $_POST['register_name'];
                $login = $_POST['register_login'];
                $password = $_POST['register_password'];

                $queryLoginCheck = "SELECT user.login FROM user WHERE user.login = '$login'";
                $resultLoginCheck = mysqli_query($link, $queryLoginCheck);
                $dataLoginCheck = mysqli_num_rows($resultLoginCheck);

                if ($dataLoginCheck == 0)
                {
                    $checkLogin = true;
                }
                else
                {
                    echo "<h3> ЛОГИН ЗАНЯТ </h3>";
                }

                if (strlen($password) >= 6)
                {
                    $checkOne = true;
                }
                else
                {
                    echo "<h3> МЕНЕЕ 6 СИМВОЛОВ </h3>";
                }

                if (preg_match("/[A-Z]/", $password))
                {
                    $checkTwo = true;
                }
                else
                {
                    echo "<h3> НЕТ БОЛШИХ БУКВ </h3>";
                }

                if (preg_match("/[0-9]/", $password))
                {
                    $checkThree = true;
                }
                else
                {
                    echo "<h3> НЕТ ЦИФР </h3>";
                }

                if (preg_match("/[!@#$%^]/", $password))
                {
                    $checkFour = true;
                }
                else
                {
                    echo "<h3> НЕТ СПЕЦ. СИМВОЛОВ </h3>";
                }

                if ($checkOne && $checkTwo && $checkThree && $checkFour && $checkLogin)
                {
                    $queryRegistration = "INSERT INTO user VALUES ('$login', '$password', 'Заказчик', '$name')";
                    $resultRegistration = mysqli_query($link, $queryRegistration);
                    if (isset($resultRegistration))
                    {
                        echo "<script> location.href='login.php'; </script>";
                    }
                }
            }
        ?>
    </form>

    <a href="login.php"> АВТОРИЗАЦИЯ </a>
</div>



</body>
</html>