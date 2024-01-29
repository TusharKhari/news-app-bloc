import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPasswordField;
  final bool isObscureText;
  final VoidCallback? onTap;
  const LoginField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isPasswordField = false,
    this.isObscureText = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextFormField(
        obscureText: isObscureText,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: isPasswordField
              ? isObscureText
                  ? IconButton(
                      onPressed: onTap,
                      icon: const Icon(Icons.remove_red_eye_outlined))
                  //const Icon(Icons.remove_red_eye_outlined)
                  : IconButton(
                      onPressed: onTap, icon: const Icon(Icons.password))
              //const Icon(Icons.password)
              : null,
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.borderColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.gradient2,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
