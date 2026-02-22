import 'package:flutter/material.dart';
import 'package:ruby_play/features/auth/sign_up_screen.dart';
import 'package:ruby_play/features/music/home_page.dart';
import 'package:ruby_play/features/navigation/main_navigation.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/google_signin_button.dart';
import '../../widgets/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: MyBackButton(onTap: () {}),
                      // ),
                      Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 70),
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
                              'or sign in with',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Color(0xFFCBD2E0))),
                        ],
                      ),
                      const SizedBox(height: 40),
                      MyTextField(
                        label: 'Email Address',
                        hintText: 'user@gmail.com',
                        controller: _emailController,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      MyTextField(
                        forgotPassword: 'Forgot Password',
                        label: 'Password',
                        hintText: '',
                        controller: _passwordController,
                        onForgotPasswordTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => const ForgotPasswordScreen(),
                          //   ),
                          // );
                        },
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.length < 4) {
                            return 'Password must have at least 4 characters';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                            splashRadius: 1.0,
                            activeColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            side: BorderSide(color: Color(0xFFCBD2E0)),
                            value: isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = newValue!;
                              });
                            },
                          ),
                          const Text(
                            'Keep me signed in',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(
                          text: 'Login',
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MainNavigation(),
                              ),
                            );

                            // if (_formKey.currentState!.validate()) {
                            //   Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (_) => const HomeScreen(),
                            //     ),
                            //   );
                            // }
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an Account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              ' Sign up here',
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
