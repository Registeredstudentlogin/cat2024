<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Candidate Login - CAT 2024</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
        }
        /* Header styling */
        .header {
            background-color: #008ea2;
            padding: 10px 0;
            color: white;
            text-align: center;
        }
        .header img {
            height: 50px;
            margin: 0 5px;
        }
        /* Login box styling */
        .login-container {
            max-width: 500px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-top: 4px solid #008ea2;
        }
        .login-container h4 {
            color: #008ea2;
            font-weight: bold;
            text-align: center;
        }
        .form-group label {
            font-weight: bold;
            color: #333;
        }
        /* Buttons styling */
        .btn-login, .btn-secondary {
            font-weight: bold;
            width: 100%; /* Center the login button */
        }
        .btn-login {
            background-color: #008ea2;
            color: white;
        }
        .btn-secondary {
            background-color: #006d7d;
            color: white;
        }
        .captcha-box {
            display: block;
            margin: 10px 0;
            padding: 10px;
            text-align: center;
            font-size: 20px;
            background-color: #e0f7fa;
            color: #004d4d;
            font-family: monospace;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .captcha-box span {
            margin-right: 10px;
        }
        .refresh-icon {
            color: #008ea2;
            cursor: pointer;
            font-size: 1.2em;
        }
        .text-center a {
            color: #008ea2;
        }
    </style>
</head>
<body>

    <!-- Header with logos -->
    <div class="header">
        <div class="container">
            <h2>CAT 2024</h2>
            <div class="d-flex justify-content-center">
                <img src="Img1.jpg" alt="IIM Logo">
                <!-- Add more logos as needed -->
            </div>
        </div>
    </div>

    <!-- Login form -->
    <div class="container login-container">
        <h4>Candidate Login</h4>
        <p class="text-center">Login to Fill/Submit/View Application Form</p>
        <form id="loginForm" onsubmit="return validateCaptcha()">
            <div class="form-group">
                <label for="user_id">USER ID:</label>
                <input type="text" class="form-control" id="user_id" name="user_id" required>
            </div>
            <div class="form-group">
                <label for="password">PASSWORD:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group">
                <div class="captcha-box">
                    <span id="captchaText"></span>
                    <i class="fas fa-sync-alt refresh-icon" onclick="generateCaptcha()" title="Reload CAPTCHA"></i>
                </div>
                <input type="text" class="form-control" id="captchaInput" placeholder="Type characters as shown above" required>
            </div>
            <button type="submit" class="btn btn-login">LOGIN</button>
            <div class="d-flex justify-content-between mt-3">
                <button type="button" class="btn btn-secondary">FORGOT PASSWORD</button>
                <button type="button" class="btn btn-secondary">CHANGE PASSWORD</button>
            </div>
        </form>
    </div>

    <script>
        // Generate random CAPTCHA
        function generateCaptcha() {
            const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
            let captcha = '';
            for (let i = 0; i < 6; i++) {
                captcha += characters.charAt(Math.floor(Math.random() * characters.length));
            }
            document.getElementById('captchaText').innerText = captcha;
        }

        // Validate CAPTCHA
        function validateCaptcha() {
            const enteredCaptcha = document.getElementById('captchaInput').value;
            const generatedCaptcha = document.getElementById('captchaText').innerText;
            const userId = document.getElementById('user_id').value;
            const password = document.getElementById('password').value;

            if (enteredCaptcha !== generatedCaptcha) {
                alert('Incorrect CAPTCHA. Please try again.');
                generateCaptcha(); // Generate a new CAPTCHA
                return false; // Prevent form submission
            }

            // Check if credentials match
            if (userId === '2021016400558993' && password === 'Rohan@21') {
                // Redirect to another page if credentials are correct
                window.location.href = 'application.html'; // Replace with the actual page you want to redirect to
                return false; // Prevent form submission
            } else {
                alert('Invalid User ID or Password');
                return false; // Prevent form submission
            }
        }

        // Generate CAPTCHA on page load
        window.onload = generateCaptcha;
    </script>

</body>
</html>
