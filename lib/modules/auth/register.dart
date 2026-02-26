import 'package:flutter/material.dart';
import 'package:movies_app/core/gen/assets.gen.dart';
import 'package:movies_app/core/routes/page_route_names.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/modules/widgets/custom_textformfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int selectedAvatarIndex = 0;

  final List<AssetGenImage> avatars = [
    Assets.images.avatars.avatar1,
    Assets.images.avatars.avatar2,
    Assets.images.avatars.avatar3,
    Assets.images.avatars.avatar4,
    Assets.images.avatars.avatar5,
    Assets.images.avatars.avatar6,
    Assets.images.avatars.avatar7,
    Assets.images.avatars.avatar8,
    Assets.images.avatars.avatar9,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Register'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
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
                  child: Text('Avatar', style: TextTheme.of(context).bodyLarge),
                ),
                CustomTextFormField(
                  hint: 'Name',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Assets.icons.idIcon.svg(),
                  ),
                ),
                CustomTextFormField(
                  hint: 'Email',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
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
                CustomTextFormField(
                  hint: 'Confirm Password',
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Assets.icons.lockIcon.svg(),
                  ),
                ),
                CustomTextFormField(
                  hint: 'Phone Number',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Assets.icons.phoneIcon.svg(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PageRouteNames.layoutView);
                  },
                  child: const Text('Create Account'),
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
