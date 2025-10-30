// lib/login.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart'; // Import the global 'supabase' client

// --- THIS IS THE FIX ---
// Add imports for all your pages
import 'package:flutter_application_1/student_main_page.dart'; // <-- For students
import 'package:flutter_application_1/lender_main_page.dart';
<<<<<<< HEAD
import 'package:flutter_application_1/signup.dart'; 
=======
<<<<<<< HEAD
import 'package:flutter_application_1/signup.dart'; 
=======
import 'package:flutter_application_1/signup.dart';
>>>>>>> 990da82707506c0533ff2e0fc7d8b01f39620d63
>>>>>>> 51f1a267d40efe37505dbcc6f1f3443f67e7b909
import 'package:flutter_application_1/staff_main_page.dart';
// --- END OF FIX ---

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
<<<<<<< HEAD
  bool _isPasswordObscured = true; 
=======
<<<<<<< HEAD
  bool _isPasswordObscured = true; 
=======
  bool _isPasswordObscured = true;
>>>>>>> 990da82707506c0533ff2e0fc7d8b01f39620d63
>>>>>>> 51f1a267d40efe37505dbcc6f1f3443f67e7b909

  Future<void> _signInAndNavigate() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 1. Sign in the user
      final authResponse = await supabase.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
<<<<<<< HEAD
      
=======
<<<<<<< HEAD
      
=======

>>>>>>> 990da82707506c0533ff2e0fc7d8b01f39620d63
>>>>>>> 51f1a267d40efe37505dbcc6f1f3443f67e7b909
      final userId = authResponse.user?.id;
      if (userId == null) {
        throw Exception('Login successful, but no user ID found.');
      }

      // 2. Fetch the user's role from your 'users' table
      final userProfile = await supabase
          .from('users')
          .select('role')
          .eq('id', userId)
          .single();
<<<<<<< HEAD
      
=======
<<<<<<< HEAD
      
=======

>>>>>>> 990da82707506c0533ff2e0fc7d8b01f39620d63
>>>>>>> 51f1a267d40efe37505dbcc6f1f3443f67e7b909
      final role = userProfile['role'];

      // 3. Navigate based on the role
      if (mounted) {
        switch (role) {
          // --- THIS IS THE FIX ---
          case 'student':
            Navigator.of(context).pushReplacement(
              // Go to the main page with the nav bar
<<<<<<< HEAD
              MaterialPageRoute(builder: (context) => const StudentMainPage()), 
=======
<<<<<<< HEAD
              MaterialPageRoute(builder: (context) => const StudentMainPage()), 
=======
              MaterialPageRoute(builder: (context) => const StudentMainPage()),
>>>>>>> 990da82707506c0533ff2e0fc7d8b01f39620d63
>>>>>>> 51f1a267d40efe37505dbcc6f1f3443f67e7b909
            );
            break;
          // --- END OF FIX ---
          case 'lender':
            Navigator.of(context).pushReplacement(
              // CORRECT: This page has the Scaffold
<<<<<<< HEAD
              MaterialPageRoute(builder: (context) => const LenderMainPage()), 
=======
<<<<<<< HEAD
              MaterialPageRoute(builder: (context) => const LenderMainPage()), 
=======
              MaterialPageRoute(builder: (context) => const LenderMainPage()),
>>>>>>> 990da82707506c0533ff2e0fc7d8b01f39620d63
>>>>>>> 51f1a267d40efe37505dbcc6f1f3443f67e7b909
            );
            break;
          case 'staff':
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const StaffMainPage()),
            );
            break;
          default:
            _showErrorDialog('Unknown role: $role');
        }
      }
<<<<<<< HEAD

=======
<<<<<<< HEAD

=======
>>>>>>> 990da82707506c0533ff2e0fc7d8b01f39620d63
>>>>>>> 51f1a267d40efe37505dbcc6f1f3443f67e7b909
    } catch (error) {
      _showErrorDialog('Login failed: ${error.toString()}');
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.book, size: 80),
              const SizedBox(height: 20),

              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),

              TextField(
                controller: _passwordController,
<<<<<<< HEAD
                obscureText: _isPasswordObscured, 
=======
<<<<<<< HEAD
                obscureText: _isPasswordObscured, 
=======
                obscureText: _isPasswordObscured,
>>>>>>> 990da82707506c0533ff2e0fc7d8b01f39620d63
>>>>>>> 51f1a267d40efe37505dbcc6f1f3443f67e7b909
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordObscured
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordObscured = !_isPasswordObscured;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: _isLoading ? null : _signInAndNavigate,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Log in'),
              ),
<<<<<<< HEAD
              
=======
<<<<<<< HEAD
              
=======

>>>>>>> 990da82707506c0533ff2e0fc7d8b01f39620d63
>>>>>>> 51f1a267d40efe37505dbcc6f1f3443f67e7b909
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                child: const Text('Create new account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
<<<<<<< HEAD
}
=======
}
>>>>>>> 990da82707506c0533ff2e0fc7d8b01f39620d63
>>>>>>> 51f1a267d40efe37505dbcc6f1f3443f67e7b909
