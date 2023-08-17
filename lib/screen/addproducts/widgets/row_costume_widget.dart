// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'build_textfield.dart';

class CostumRow extends StatelessWidget {
  const CostumRow({
    super.key,
    required this.labelText1,
    required this.labelText2,
    required this.controller1,
    required this.controller2,
   
  });
  final String labelText1;
  final String labelText2;
  
  final TextEditingController controller1;
  final TextEditingController controller2;
  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
          width: width * 0.4,
          child: BuildTextField(
            labelText: labelText1,
            controller: controller1,
          )),
      SizedBox(
          // height: height * 0.06,
          width: width * 0.4,
          child: BuildTextField(
            labelText: labelText2,
            controller: controller2,
          ))
    ]);
  }
}
