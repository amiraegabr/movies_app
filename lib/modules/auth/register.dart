import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/gen/assets.gen.dart';
import 'package:movies_app/core/routes/page_route_names.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/models/avatars_list.dart';
import 'package:movies_app/modules/widgets/custom_textformfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  int selectedAvatarIndex = 0;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  bool isLoading = false;
  final List<AssetGenImage> avatars = Avatars;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> registerUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      // Create account
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      final user = credential.user;

      if (user != null) {
        // Save profile in Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          "uid": user.uid,
          "name": nameController.text.trim(),
          "email": emailController.text.trim(),
          "phone": phoneController.text.trim(),
          "avatarIndex": selectedAvatarIndex,
          "createdAt": FieldValue.serverTimestamp(),
        });
      }

      Navigator.pushReplacementNamed(context, PageRouteNames.layoutView);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Registration failed")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Register'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 20,
                children: [
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: avatars.length,
                      itemBuilder: (context, index) {
                        bool isSelected = selectedAvatarIndex == index;
                        return GestureDetector(
                          onTap: () =>
                              setState(() => selectedAvatarIndex = index),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.yellow
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: isSelected ? 50 : 40,
                              backgroundImage: AssetImage(avatars[index].path),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      'Avatar',
                      style: TextTheme.of(context).bodyLarge,
                    ),
                  ),
                  CustomTextFormField(
                    controller: nameController,
                    hint: 'Name',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      if (value.trim().length < 3) {
                        return 'Name must be at least 3 characters';
                      }
                      return null;
                    },
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Assets.icons.idIcon.svg(),
                    ),
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    hint: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      }
                      final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(value);
                      if (!emailValid) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Assets.icons.emailIcon.svg(),
                    ),
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    hint: 'Password',
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Assets.icons.lockIcon.svg(),
                    ),
                  ),
                  CustomTextFormField(
                    controller: confirmPasswordController,
                    hint: 'Confirm Password',
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Assets.icons.lockIcon.svg(),
                    ),
                  ),
                  CustomTextFormField(
                    controller: phoneController,
                    hint: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (!RegExp(r'^\d+$').hasMatch(value)) {
                        return 'Please enter a valid phone number (digits only)';
                      }
                      return null;
                    },
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Assets.icons.phoneIcon.svg(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: isLoading ? null : registerUser,
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Create Account'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already Have Account ? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, PageRouteNames.signIn),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: AppColors.yellow,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
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
      ),
    );
  }
}
