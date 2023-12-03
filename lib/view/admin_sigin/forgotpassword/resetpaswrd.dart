
// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/colors.dart';
import 'succes.dart';

TextEditingController restcontroller = TextEditingController();

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  Future<void> resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: restcontroller.text.trim(),
      );
    Get.to(const PasswordResetSuccessScreen());
  
    } catch (e) {
      print('Error sending password reset email: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      backgroundColor: boxcolorfill,
      appBar: AppBar(backgroundColor: boxcolorfill),
      body: Column(
        children: [
          SizedBox(height: height * 0.08),
          const Text(
            'Receive an email to reset your password.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Material(
              elevation: 8,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              child: TextFormField(
                controller: restcontroller,
                minLines: 1,
                decoration: InputDecoration(
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: appbar),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.white70,
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: boxcolorstock),
                  prefixIcon: const Icon(
                    Icons.mail_outline,
                    color: boxcolorstock,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Container(
            height: height * 0.045,
            width: width * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: appbar),
            child: InkWell(
              onTap: () => resetPassword(context), 
              child: const Center(
                child: Text(
                  'RESET PASSWORD',
                  style: TextStyle(color: white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


