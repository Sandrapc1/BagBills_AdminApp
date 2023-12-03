import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    super.key,
    this.labelText,
    required this.controller,
   
  });
  final String? labelText;
  final TextEditingController controller;
 

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (value) {
        if (value==null || value.isEmpty) {
          return 'Please enter the Field';
        }
        return null;
      },
      onTapOutside: (event) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      controller: controller,
      decoration:  InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}