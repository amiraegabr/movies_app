import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/modules/widgets/custom_textformfield.dart';

import '../../core/gen/assets.gen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();

  Future<void> resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password reset email sent")),
      );

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Something went wrong")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          spacing: 24,
          children: [
            Assets.images.forgotPassword.image(),
            CustomTextFormField(
              controller: emailController,
              hint: 'Email',
              validator: (value) {
                if (emailController.text.isEmpty) {
                  return 'Please enter your email';
                } else {
                  return null;
                }
              },
              prefixIcon: Padding(
                padding: EdgeInsets.all(8),
                child: Assets.icons.emailIcon.svg(),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => resetPassword(context),
                child: Text("Verify Email"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
