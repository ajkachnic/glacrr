<?php
include('./classes/DB.php');
include('./classes/Login.php');
if(!Login::isLoggedIn()){
  die("Not Logged In");
}
if(isset($_POST['confirm'])) {
  if(isset($_POST['alldevices'])) {
      DB::query('DELETE FROM login_tokens WHERE user_id=:userid', array(':userid' => Login::isLoggedIn()));
  }else {
    if(isset($_COOKIE['SNID'])){
      DB::query('DELETE FROM login_tokens WHERE token=:token', array(':token' => sha1($_COOKIE['SNID'])));
  }
  setcookie('SNID', '1', time() - 3600);
  setcookie('SNID_', '1', time() - 3600);
}
}
?>
<h1>Logout of your Account?</h1>
<p>Are you sure you'd like to logout?</p>
<form method="post">
      <input type="checkbox" name="alldevices" value="alldevices"> Logout Of All Devices
      <input type="submit" name="confirm" value="Confirm"/>
</form>
