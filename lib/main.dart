import 'package:fitpage/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'themes/app_themes.dart'; // Import the new themes file

void main() {
  runApp(const FitPageDemo());
}

class FitPageDemo extends StatelessWidget {
  const FitPageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme, // Use the light theme
      darkTheme: darkTheme, // Define the dark theme
      themeMode: ThemeMode.system, // Switch between light and dark themes
      debugShowCheckedModeBanner: true,
      getPages: AppPages.routes,
      initialRoute: Routes.home,
      defaultTransition: Transition.fadeIn,
    );
  }
}
