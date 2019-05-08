<?php
include('classes/DB.php');

if(isset($_POST['submit'])) {
  $username = $_POST['username'];
  $password = $_POST['password'];

  if(DB::query('SELECT username FROM users WHERE username=:username', array(':username' =>$username))){
      if (password_verify($password , DB::query('SELECT password FROM users WHERE username=:username', array(':username'=>$username))[0]['password'])) {

        $cstrong = True;
        $token = bin2hex(openssl_random_pseudo_bytes(64, $cstrong));
        $user_id = DB::query('SELECT id FROM users WHERE username=:username', array(':username' => $username))[0]['id'];
       DB::query('INSERT INTO login_tokens VALUES (0, :token, :user_id)', array(':token'=>sha1($token), ':user_id'=>$user_id));
       setcookie('SNID', $token, time() + 60 * 60 * 24 * 7, '/', NULL, NULL, TRUE);
       setcookie('SNID_', 1, time() + 60 * 60 * 24 * 3, '/', NULL, NULL, TRUE);
       echo "Logged In";

      }
      else{
        echo "Incorrect Username Or Password";
      }
  }else {
    echo "Incorrect Username Or Password";
  }
}

?>
<h1> Login to your account</h1>
<form method="post">
<input type="username" name="username" placeholder="Username..."/><br>
<input type="password" name="password" placeholder="Password..."/><br>
<input type="submit" name="submit" value="Submit"/>
</form>
