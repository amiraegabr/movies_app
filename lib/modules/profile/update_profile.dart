import 'package:flutter/material.dart';
import 'package:movies_app/modules/widgets/custom_textformfield.dart';

import '../../core/gen/assets.gen.dart';
import '../../core/theme/app_colors.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  AssetGenImage selectedAvatar = Assets.images.avatars.avatar1;

  // List of all avatars
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
                      setState(() => selectedAvatar = avatar);
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
      body: Padding(
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
              hint: 'User Name',
              prefixIcon: Padding(
                padding: EdgeInsets.all(8),
                child: Assets.icons.idIcon.svg(width: 24),
              ),
            ),
            CustomTextFormField(
              hint: '01000000000',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Assets.icons.phoneIcon.svg(width: 24),
              ),
            ),
            Text(
              'Reset Password',
              style: TextTheme.of(context).bodyLarge,
              textAlign: TextAlign.end,
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
            ElevatedButton(onPressed: () {}, child: Text('Update Data')),
          ],
        ),
      ),
    );
  }
}
