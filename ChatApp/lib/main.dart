// ignore_for_file: dead_code

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login/Signup App',
      home: LoginSignupPage(),
    );
  }
}

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({Key? key});

  @override
  LoginSignupPageState createState() => LoginSignupPageState();
}

class LoginSignupPageState extends State<LoginSignupPage> {
  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String confirmPassword = '';
  bool isSignUp = true;
  bool isCheckboxChecked = false;
  String errorMessage = '';

  void handleAuth() {
    // Your authentication logic here
    if (isSignUp) {
      // Handle signup logic
      if (password != confirmPassword) {
        setState(() {
          errorMessage = 'Passwords do not match.';
        });
        return;
      }

      // Replace the following line with your actual signup logic
      // For simplicity, I'm assuming signup is successful here
      bool signupSuccess = true;

      if (signupSuccess) {
        // Redirect to the login page after successful signup
        setState(() {
          isSignUp = false;
          errorMessage = ''; // Clear error message
        });
      } else {
        // Handle signup failure
      }
    } else {
      // Handle login logic
      // Replace the following line with your actual login logic
      // For simplicity, I'm assuming login is successful here
      bool loginSuccess = true;

      if (loginSuccess) {
        // Navigate to the home page after successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        // Handle login failure
        setState(() {
          errorMessage = 'Invalid email or password.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.teal],
            ),
          ),
          child: Center(
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isSignUp ? 'Sign Up' : 'Login',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (errorMessage.isNotEmpty)
                    Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 20),
                  if (isSignUp)
                    Column(
                      children: [
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              firstName = value;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: 'First Name',
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              lastName = value;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: 'Last Name',
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (isSignUp)
                    Column(
                      children: [
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              confirmPassword = value;
                            });
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Confirm Password',
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  if (isSignUp)
                    Row(
                      children: [
                        Checkbox(
                          value: isCheckboxChecked,
                          onChanged: (value) {
                            setState(() {
                              isCheckboxChecked = value ?? false;
                            });
                          },
                        ),
                        const Text(
                          'Agree to terms and conditions',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: handleAuth,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFff4141),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      isSignUp ? 'Sign Up' : 'Login',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    isSignUp
                        ? 'Already have an account?'
                        : "Don't have an account?",
                    style: const TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isSignUp = !isSignUp;
                        errorMessage = ''; // Clear error message on switch
                      });
                    },
                    child: Text(
                      isSignUp ? 'Login Here' : 'Sign Up Here',
                      style: const TextStyle(
                        color: Color(0xFFff4141),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Chat App!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add logic for actions on the home page
              },
              child: const Text('Start Chatting'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Redirect to the signup page after clicking logout
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginSignupPage()),
                );
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
