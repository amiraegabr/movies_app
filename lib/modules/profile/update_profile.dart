import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/modules/widgets/custom_textformfield.dart';

import '../../core/gen/assets.gen.dart';
import '../../core/routes/page_route_names.dart';
import '../../core/theme/app_colors.dart';
import '../../models/avatars_list.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  AssetGenImage selectedAvatar = Assets.images.avatars.avatar1;
  final List<AssetGenImage> avatars = Avatars;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  int avatarIndex = 0;
  bool isLoading = true;

  Future<void> loadUserData() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    final data = doc.data();

    if (data != null) {
      nameController.text = data['name'] ?? '';
      phoneController.text = data['phone'] ?? '';
      avatarIndex = data['avatarIndex'] ?? 0;

      selectedAvatar = avatars[avatarIndex];
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> updateProfile() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      "name": nameController.text.trim(),
      "phone": phoneController.text.trim(),
      "avatarIndex": avatarIndex,
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Profile updated")));
  }

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void _showAvatarPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Pick Avatar', style: TextTheme.of(context).titleMedium),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: avatars.length,
                itemBuilder: (context, index) {
                  final avatar = avatars[index];
                  final isSelected = avatar == selectedAvatar;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAvatar = avatar;
                        avatarIndex = index;
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.yellow
                              : Colors.transparent,
                          width: 2,
                        ),
                        color: isSelected
                            ? AppColors.yellow.withOpacity(0.5)
                            : Colors.transparent,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: avatar.image(fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick Avatar')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20,
            children: [
              GestureDetector(
                onTap: _showAvatarPicker,
                child: Center(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(75),
                      child: selectedAvatar.image(fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              CustomTextFormField(
                controller: nameController,
                hint: nameController.text,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Assets.icons.idIcon.svg(width: 24),
                ),
              ),
              CustomTextFormField(
                controller: phoneController,
                hint: phoneController.text,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Assets.icons.phoneIcon.svg(width: 24),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    PageRouteNames.forgotPassword,
                  ),
                  child: Text(
                    'Reset Password',
                    style: TextTheme.of(context).bodyLarge,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  foregroundColor: AppColors.white,
                ),
                child: Text('Delete Account'),
              ),
              ElevatedButton(
                onPressed: updateProfile,
                child: Text('Update Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
