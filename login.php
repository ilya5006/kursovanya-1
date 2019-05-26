<?
require "connection.php";
session_start();

if (isset($_SESSION['role'])) 
{
    header('Location: index.php');
}

if (isset($_POST['login_button']))
{
    $login = $_POST['login_login'];
    $password = $_POST['login_password'];

    $login_query = "SELECT 
                        user.login,
                        user.password,
                        user.role
                    FROM
                        user
                    WHERE
                        user.login = '$login'
                    AND
                        user.password = '$password'
                    ";
    $login_result = mysqli_query($link, $login_query);
    $user = mysqli_fetch_row($login_result);

    if (isset($user[2]))
    {
        $_SESSION['role'] = $user[2];
        header('Location: index.php');
    }
}
?>


<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title> АВТОРИЗАЦИЯ </title>
    <link rel="stylesheet" href="css/auth.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>

<div id="login">
    <h2> АВТОРИЗАЦИЯ </h2>
    <form method="POST" action=""> 
        <input class="enter" required type="text" name="login_login" placeholder="ЛОГИН">
        <input class="enter" required type="text" name="login_password" placeholder="ПАРОЛЬ">
        <input type="submit" required name="login_button" value="ВОЙТИ">
        <?
            if(isset($login_result))
            {
                echo "<h3> ВЫ ОШИБЛИСЬ </h3>";
            }
        ?>
    </form>

    <a href="register.php"> РЕГИСТРАЦИЯ </a>
</div>

</body>
</html>