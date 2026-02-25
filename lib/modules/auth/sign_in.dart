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
              children: [
                const SizedBox(height: 60),
                // Logo
                Center(
                  child: Assets.images.logo.image(height: 150),
                ),
                const SizedBox(height: 40),
                
                // Email Field
                CustomTextFormField(
                  hint: 'Email',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.icons.emailIcon.svg(
                      colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Password Field
                CustomTextFormField(
                  hint: 'Password',
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.icons.lockIcon.svg(
                      colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                    ),
                  ),
                ),
                
                // Forget Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PageRouteNames.forgotPassword);
                    },
                    child: const Text(
                      'Forget Password ?',
                      style: TextStyle(color: AppColors.yellow, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Login Button
                ElevatedButton(
                  onPressed: () {
                    // Handle Login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellow,
                    foregroundColor: AppColors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Create Account Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t Have Account ? ",
                      style: TextStyle(color: AppColors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, PageRouteNames.signIn);
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
                const SizedBox(height: 20),
                
                // OR Divider
                const Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.yellow, thickness: 1, indent: 30, endIndent: 10)),
                    Text('OR', style: TextStyle(color: AppColors.yellow, fontWeight: FontWeight.bold)),
                    Expanded(child: Divider(color: AppColors.yellow, thickness: 1, indent: 10, endIndent: 30)),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Google Login Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellow,
                    foregroundColor: AppColors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.icons.googleIcon.svg(width: 24),
                      const SizedBox(width: 10),
                      const Text(
                        'Login With Google',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                
                // Language Switcher
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
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
