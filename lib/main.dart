import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.darkTheme(),
      // initialRoute: ,
      // onGenerateRoute: ,
      debugShowCheckedModeBanner: false,
    );
  }
}
