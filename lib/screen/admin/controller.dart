
import 'package:get/get.dart';

class AdminController extends GetxController {
  RxBool obscureText= true.obs;

  void togglePasswordVisibility(){
    obscureText.toggle();
  }
}