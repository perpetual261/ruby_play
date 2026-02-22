import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/google_signin_button.dart';
import '../../widgets/my_text_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF161311), Color(0xFF0F0B0A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: Center(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: MyBackButton(
                      //     onTap: () {
                      //       Navigator.pop(context);
                      //     },
                      //   ),
                      // ),
                      const Text(
                        'Signup',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 40),
                      GoogleSigninButton(onTap: () {}),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(child: Divider(color: Color(0xFFCBD2E0))),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              'or sign up with',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(color: Color(0xFFCBD2E0)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      MyTextField(
                        label: 'Full Name',
                        hintText: 'John Smith',
                        controller: _nameController,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      MyTextField(
                        label: 'Email Address',
                        hintText: 'user@gmail.com',
                        controller: _emailController,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!RegExp(
                            r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      MyTextField(
                        label: 'Password',
                        hintText: '',
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.length < 4) {
                            return 'Password must be at least 4 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      MyTextField(
                        label: 'Confirm Password',
                        hintText: '',
                        controller: _confirmPasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 32),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: const VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                            splashRadius: 1.0,
                            activeColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            side: const BorderSide(color: Color(0xFFCBD2E0)),
                            value: isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = newValue!;
                              });
                            },
                          ),
                          Expanded(
                            child: const Text(
                              'By Creating an Account, I accept Hiring Hub terms of Use and Privacy Policy',
                              style: TextStyle(
                                color: Color(0xFF6C6F72),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      CustomButton(
                        text: 'Signup',
                        onPressed: () {},
                        //   if (!_formKey.currentState!.validate()) return;
                        //   setState(() => isLoading = true);
                        //   try {
                        //     await _authService.signUp(
                        //       _emailController.text.trim(),
                        //       _passwordController.text.trim(),
                        //     );
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (_) => VerifyEmailScreen(),
                        //       ),
                        //     );
                        //   } catch (e) {
                        //     setState(() {
                        //       errorMessage = e.toString();
                        //     });
                        //   } finally {
                        //     setState(() => isLoading = false);
                        //   }
                        // },

                        // async {
                        //   if (!_formKey.currentState!.validate()) {
                        //     return;
                        //   }
                        //
                        //   try {
                        //     await FirebaseAuth.instance
                        //         .createUserWithEmailAndPassword(
                        //           email: _emailController.text.trim(),
                        //           password: _passwordController.text.trim(),
                        //         );
                        //
                        //     print('Signup successful');
                        //     //  print(userCredential.user?.email);
                        //   } on FirebaseAuthException catch (e) {
                        //     print('Firebase error: ${e.message}');
                        //   } catch (e) {
                        //     //  print('Unknown error: $e');
                        //   }
                        // },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Have an Account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              ' Sign in here',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
