<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="css/login.css">
    </head>
    <body>
        <div class="container">
            <div class="Login">
                <div class="logo-container">
                    <img style="width: 120%;" src="image/logo1_2.png" alt="Logo">
                </div>
                <h2>Login</h2>

                <form class="Login-form" action="login" method="POST">
                    <div style="color: red;" class="alert alert-danger" role="alert">
                        <p class="text-danger">${loginFail} </p>
                    </div>
                    <label for="username">UserName/Email</label>
                    <input type="text" id="userName" name="userName" required>

                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                    <!--                <div class"GM">
                                    <button  type="submit">Đăng nhập bằng  Gmail</button>
                                    </div>-->
                    <button type="submit">Login</button>

                    <div class="mt-4 text-center">
                        <p class="text-sm">Do not have an account ? <a href="register.jsp"
                                                                      class="text-red-700 hover:underline">Register</a></p>
                    </div>
                </form>
            </div>
            <div class="image">
                <img src="image/bglogin.png" alt="Image">
            </div>
        </div>
    </body>
</html>
