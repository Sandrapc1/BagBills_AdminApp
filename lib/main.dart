
import 'package:bagbliss_admin/screen/admin/admin_login.dart';
import 'package:bagbliss_admin/screen/home/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors/colors.dart';
import 'firebase_options.dart';

Future <void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BagBliss Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         iconTheme: const IconThemeData(color: white),
         textTheme: GoogleFonts.expletusSansTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          }else{
            return AdminLoginScreen();
          }
        },
       ),
    );
  }
}



