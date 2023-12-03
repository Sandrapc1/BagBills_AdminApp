

// ignore_for_file: unused_element, body_might_complete_normally_nullable

class FormValidation {

   String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    String? match = r'\w+@\w+\.\w+';

    RegExp regex = RegExp(match);
    if (!regex.hasMatch(value)) {
      return 'invalid email';
    }
    return null;
  }


  String? password(value) {
    if (value == '' || value == null) {
      return 'Enter the password';
    }
  }
  
  
}