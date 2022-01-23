import 'package:admin_patelmatch/controllers/bindings/auth_binding.dart';
import 'package:admin_patelmatch/global.dart';
import 'package:admin_patelmatch/screens/auth_screen.dart';
import 'package:admin_patelmatch/screens/image_picker_screen.dart';
import 'package:admin_patelmatch/tab_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: Color.fromRGBO(255, 85, 115, 1)),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot) {
          if (userSnapshot.hasData) {
            if (isSignup) {
              return ImagePickerScreen();
            } else {
              return TabBarScreen();
            }
          } else {
            return AuthScreen();
          }
        },
      ),
    );
  }
}
