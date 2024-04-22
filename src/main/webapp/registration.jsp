<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reg Log</title>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #913ae8;
        margin: 0;
        padding: 0;
    }

    .registration-container {
        width: 300px;
        margin: 50px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #333;
        font-size: 24px;
        text-align: center;
        margin-bottom: 20px;
    }

    label {
        color: #333;
        font-weight: bold;
    }

    input[type="text"],
    input[type="password"] {
        width: calc(100% - 24px);
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>

<body>
    <div class="registration-container">
        <h2>Registration Form</h2>
        <form action="save" method="post">
            <label>Name:</label><br>
            <input type="text" name="name" required><br><br>
            <label>Course:</label><br>
            <input type="text" name="course" required><br><br>
            <label>Email:</label><br>
            <input type="text" name="email" required><br><br>
            <label>Mobile:</label><br>
            <input type="text" name="mobile" required><br><br>
            <label>Password:</label><br>
            <input type="password" name="password" required><br><br>
            
            <input type="submit" value="Save">
        </form>
    </div>
</body>
</html>