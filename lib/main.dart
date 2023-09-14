import 'package:fitpage/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const FitPageDemo());
}

class FitPageDemo extends StatelessWidget {
  const FitPageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        color: Colors.deepPurpleAccent, //<-- SEE HERE
      )),
      debugShowCheckedModeBanner: true,
      getPages: AppPages.routes,
      initialRoute: Routes.home,
      defaultTransition: Transition.fadeIn,
    );
  }
}
