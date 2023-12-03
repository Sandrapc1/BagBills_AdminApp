// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable, must_be_immutable
import 'package:bagbliss_admin/controller/auth/auth.dart';
import 'package:bagbliss_admin/controller/auth/validation.dart';
import 'package:bagbliss_admin/core/colors.dart';
import 'package:bagbliss_admin/view/admin_sigin/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLoginScreen extends StatelessWidget {
      AdminLoginScreen({super.key});

   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
   final AdminController _controller=Get.put(AdminController());
 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
  //  bool obscureText=false;
    TextEditingController emaileditcontroller = TextEditingController();
    TextEditingController passwordeditcontroller = TextEditingController();
    var height = size.height;
    var width = size.width;
    return Obx(() => Scaffold(
            //  resizeToAvoidBottomInset: false,
            body: Stack(alignment: Alignment.topCenter, children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bag.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
            ),
          ),
          Positioned(
              top: height * 0.1,
              child: const Text(
                'SIGNIN',
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              )),
          Positioned(
              top: height * 0.2,
              child: Form(
                key: _formkey,
                child: Container(
                  height: height * 0.5,
                  width: width * 0.8,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white60,
              ),
              child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                  child: Column(children: [
                    SizedBox(
                      height: height * 0.09,
                    ),
                    Material(
                      elevation: 8,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      child: TextFormField(
                        validator:FormValidation().validateEmail,
                        controller: emaileditcontroller,
                        minLines: 1,
                        decoration: InputDecoration(
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: appbar),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          hintText: 'Username/Email',
                          hintStyle: const TextStyle(color: boxcolorstock),
                          prefixIcon: const Icon(
                            Icons.mail_outline,
                            color: boxcolorstock,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Material(
                      elevation: 8,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      child: TextFormField(
                        validator: FormValidation().password ,
                        controller: passwordeditcontroller,
                        minLines: 1,
                        obscureText: _controller.obscureText.value,
                        decoration: InputDecoration(
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: appbar),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          hintText: 'Enter a password',
                          hintStyle: const TextStyle(color: boxcolorstock),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: boxcolorstock,
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                 _controller.togglePasswordVisibility();
                              },
                              child:  Icon(
                                _controller.obscureText.value
                                ? Icons.visibility_off_outlined
                                :Icons.visibility_outlined,
                                color: boxcolorstock,
                              )),
                          contentPadding:
                            const EdgeInsets.symmetric(vertical: 8),
                        )
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.4),
                      child: const Text('Forgot Password?'),
                    ),
                    SizedBox(height: height * 0.04),
                    TextButton(
                      onPressed: () {
                         if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                        }
                        Authentication().SignUpButton(emaileditcontroller.text, passwordeditcontroller.text);
                        
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                          fixedSize: MaterialStateProperty.all(
                              Size(width * 0.5, height * 0.05))),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ])),
            ),
          ))
    ]))
    );
  }
}
