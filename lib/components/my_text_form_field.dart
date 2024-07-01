import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.emailController,
    required this.hintText,
    required this.validationText,
    required this.inputType,
  });

  final TextEditingController emailController;
  final TextInputType inputType ;
  final String ? validationText ;
  final String ? hintText ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white),
      child: TextFormField(
        controller: emailController,
        keyboardType: inputType,
        validator: (value) {
          if (value!.isEmpty) {
            return validationText;
          }
          return null;
        },
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric( horizontal: 12),
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
