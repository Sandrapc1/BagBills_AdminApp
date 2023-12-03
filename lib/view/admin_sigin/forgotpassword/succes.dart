
import 'package:flutter/material.dart';

class PasswordResetSuccessScreen extends StatelessWidget {
  const PasswordResetSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Password Reset Success')),
      body: const Center(
        child: Text('Password reset email sent successfully!',style: TextStyle(color: Colors.green,fontSize: 22,fontWeight: FontWeight.bold),),
      ),
    );
  }
}