import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool obscureText;
  final String? forgotPassword;
  final String? Function(String?)? validator;
  final VoidCallback? onForgotPasswordTap;

  const MyTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.forgotPassword,
    this.validator,
    this.onForgotPasswordTap,
  });

  @override
  Widget build(BuildContext context) {
    // Define consistent borders
    final OutlineInputBorder baseBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Color(0xFFCBD2E0)),
    );

    final OutlineInputBorder errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Colors.red, width: 1.5),
    );

    final OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 1.5,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label and optional forgot password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            if (forgotPassword != null)
              GestureDetector(
                onTap: onForgotPasswordTap,
                child: Text(
                  forgotPassword!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        // The TextFormField
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          // style: TextStyle(color: Color(0xFFBABABA)),
          validator: validator,
          style: TextStyle(color: Color(0xFF191D23)),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xFFBABABA),
              fontWeight: FontWeight.w500,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            enabledBorder: baseBorder,
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
          ),
        ),
      ],
    );
  }
}
