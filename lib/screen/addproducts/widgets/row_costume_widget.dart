// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../update/update_product.dart';
import 'build_textfield.dart';

class CostumRow extends StatelessWidget {
  const CostumRow({
    super.key,
    required this.labelText2,
    required this.controller2,
    required this.dropdownList,
    
  });

  final String labelText2;
  final dropdownList;
  // final selec

  final TextEditingController controller2;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        height: height * 0.06,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 90, 89, 89)),
            borderRadius: BorderRadius.circular(5)),
        child: Obx(
          () => DropdownButton<String>(
            value: imagePickerController.dropdowngetx.value.isNotEmpty
                ? imagePickerController.dropdowngetx.value
                : null,
            items: dropdownList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newvalues) {
              if (newvalues != null) {
                imagePickerController.setSelectedCategorys(newvalues);
              }
            },
          ),
        ),
      ),
      // Container(
      //   height: height * 0.06,
      //   alignment: Alignment.center,
      //   decoration: BoxDecoration(
      //       border: Border.all(color: const Color.fromARGB(255, 90, 89, 89)),
      //       borderRadius: BorderRadius.circular(5)),
      //   child: Obx(
      //     () => DropdownButton<String>(
      //       value: imagePickerController.dropdownsizegetx.value.isNotEmpty
      //           ? imagePickerController.dropdownsizegetx.value
      //           : null,
      //       items: dropdownList.map<DropdownMenuItem<String>>((String value) {
      //         return DropdownMenuItem(
      //           value: value,
      //           child: Text(value),
      //         );
      //       }).toList(),
      //       onChanged: (newvalues) {
      //         if (newvalues != null) {
      //           imagePickerController.setSelectedSize(newvalues);
      //         }
      //       },
      //     ),
      //   ),
      // ),
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
