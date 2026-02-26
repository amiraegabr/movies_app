import 'package:flutter/material.dart';
import 'package:movies_app/core/gen/assets.gen.dart';
import 'package:movies_app/core/routes/page_route_names.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/modules/widgets/custom_textformfield.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 20,
              children: [
                Center(child: Assets.images.logo.image(width: 200)),

                CustomTextFormField(
                  hint: 'Email',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Assets.icons.emailIcon.svg(),
                  ),
                ),

                CustomTextFormField(
                  hint: 'Password',
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Assets.icons.lockIcon.svg(),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      PageRouteNames.forgotPassword,
                    ),
                    child: const Text(
                      'Forget Password ?',
                      style: TextStyle(color: AppColors.yellow),
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      PageRouteNames.layoutView,
                    );
                  },
                  child: const Text('Login'),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t Have Account? ",
                      style: TextStyle(color: AppColors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, PageRouteNames.signUp);
                      },
                      child: const Text(
                        'Create One',
                        style: TextStyle(
                          color: AppColors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.yellow,
                        thickness: 1,
                        indent: 30,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                        color: AppColors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.yellow,
                        thickness: 1,
                        indent: 10,
                        endIndent: 30,
                      ),
                    ),
                  ],
                ),

                ElevatedButton.icon(
                  onPressed: () => Navigator.pushReplacementNamed(
                    context,
                    PageRouteNames.layoutView,
                  ),
                  icon: Assets.icons.googleIcon.svg(width: 24),
                  label: const Text('Login With Google'),
                ),

                Center(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.yellow),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Assets.icons.enIcon.svg(width: 30),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: AppColors.yellow,
                            shape: BoxShape.circle,
                          ),
                          child: Assets.icons.arIcon.svg(width: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
