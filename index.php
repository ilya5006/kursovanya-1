<?
session_start();

if(isset($_SESSION['role']))
{
    $role = $_SESSION['role'];

    if ($role == 'Заказчик')
    {
        header('Location: zakazchik.php');
    }

    if ($role == 'Менеджер')
    {
        header('Location: manager.php');
    }

    if ($role == 'Кладовщик')
    {
        header('Location: kladman.php');
    }

    if ($role == 'Директор')
    {
        header('Location: director.php');
    }
}
else
{
    header('Location: login.php');
}
?>