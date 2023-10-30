import 'package:flutter/material.dart';

import 'package:forms_app/config/theme/app_theme.dart';

class CustomTextFormFiel extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscuretext;

  const CustomTextFormFiel({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscuretext = false,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(20));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        obscureText: obscuretext,
        decoration: InputDecoration(
            enabledBorder: border,
            focusedBorder:
                border.copyWith(borderSide: const BorderSide(color: seedColor)),
            errorBorder: border.copyWith(
                borderSide: BorderSide(color: Colors.red.shade800)),
            focusedErrorBorder: border.copyWith(
                borderSide: BorderSide(color: Colors.red.shade800)),
            isDense: true,
            label: label != null ? Text(label!) : null,
            hintText: hint,
            focusColor: seedColor,
            icon: const Icon(Icons.supervised_user_circle_outlined),
            errorText: errorMessage),
      ),
    );
  }
}
