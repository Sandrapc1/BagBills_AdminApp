
// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:bagbliss_admin/screen/home/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Authentication {


  SignUpButton(emailecditcontroller,passwordeditcontroller){
    FirebaseAuth.instance
    .signInWithEmailAndPassword(
      email: emailecditcontroller,
      password: passwordeditcontroller)
      .then((value) => Get.to((const HomeScreen())))
      .onError((error, stackTrace) {
      print('Error ${error.toString()}');
      return null;
   });

  }

   }
    
  
