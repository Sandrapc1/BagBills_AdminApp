// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'build_textfield.dart';

class CostumRow extends StatelessWidget {
  const CostumRow({
    super.key,
    required this.labelText2,
    required this.controller2, 
    required this.labelTextquantity, 
    required this.quantityTextController, 
    
  });

  final String labelText2;
  final String labelTextquantity;
  final TextEditingController quantityTextController;
  final TextEditingController controller2;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
          // height: height * 0.06,
          width: width * 0.4,
          child: BuildTextField(
            labelText: labelText2,
            controller: controller2,
          )),
      SizedBox(
          // height: height * 0.06,
          width: width * 0.4,
          child: BuildTextField(
            labelText: labelTextquantity,
            controller: quantityTextController,
          )
          )
    ]);
  }
}
