import 'package:flutter/material.dart';
import 'package:movies_app/modules/widgets/custom_textformfield.dart';

import '../../core/gen/assets.gen.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
              hint: 'Email',
              prefixIcon: Assets.icons.emailIcon.svg(),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Verify Email"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
