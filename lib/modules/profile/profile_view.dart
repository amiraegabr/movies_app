import 'package:flutter/material.dart';

import '../../core/routes/page_route_names.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, PageRouteNames.updateProfile);
            },
            child: Text('Edit Profile'),
          ),
        ],
      ),
    );
  }
}
