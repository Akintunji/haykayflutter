import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dashboard_class/dashboard.dart' as dashboard;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: WelcomeScreen(),
    );
  }
}


class WelcomeScreen{
     @override
widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Haykaytelecoms"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                 Text(
                 "Login",
               style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 20),

           onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
           }
    Text(
              "Register",
                style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>RegisterScreen()),
                );
             
 }
        
            SizedBox(height: 20),
            
          Image.asset('assets/Mtn.png');
          Image.asset('assets/Glo.png');
          Image.asset('assets/airtel.png');
          Image.asset('assets/9mobile.png');
  Text(
              "Welcome",
               style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
         
          ],
        ),
      ),
       
    );
  }
}

class LoginScreen extends StatefulWidget {

   String errorMessage = '';

  Future<void> login() async {
    String email = emailController.text;
    String password = passwordController.text;

    Map<String, String> data = {
      'email': email,
      'password': password,
    };

    var response = await http.post(
      Uri.parse('https://haykaytelecoms.com.ng/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
 if (response.statusCode == 200) {
  
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      setState(() {
        errorMessage = 'Invalid email or password';
      });
    }
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ), 
      body: Container(
          color: Colors.#307D7E,
          padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              controller: emailController, 
     
            ),
            SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
               controller:passwordController,
                      
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
            login();

 },
              child: Text('Login'),
            ),
            SizedBox(height: 16),
            TextButton(
             
             
              child: Text('Don\'t have an account? Register here.'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override

  String errorMessage = '';

  Future<void> register() async {

    String email = emailController.text;
   String password = passwordController.text; 
String cpassword = cpasswordController.text; 
if(password !== cpassword){
  errorMessage='Password do not match!';
}
    Map<String, String> data = {
      'email': email,
      'password': password,
    };

    var response = await http.post(
      Uri.parse('https://haykaytelecoms.com.ng/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
 if (response.statusCode == 200) {
  
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        errorMessage = 'Invalid email or password';
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),  controller:emailController,
            ),
            SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),  controller:passwordController,
            ),
            SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              controller:cpasswordController,
            ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
              register()
              },
              child: Text('Register'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pop(context, '/LoginScreen');
              },
              child: Text('Already have an account? Login here.'),
            ),
          ],
        ),
      ),
    );
  }
}