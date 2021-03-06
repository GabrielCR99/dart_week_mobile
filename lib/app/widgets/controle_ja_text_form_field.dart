import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ControleJaTextFormField extends TextFormField {
  ControleJaTextFormField({
    ValueChanged<String> onChanged,
    FormFieldValidator<String> validator,
    @required String label,
    bool isObscure,
    double borderRadius,
    double fontSize,
    EdgeInsets padding,
    TextEditingController controller,
    TextInputType keyboardType,
    TextCapitalization textCapitalization,
  }) : super(
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          keyboardType: keyboardType ?? TextInputType.text,
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          obscureText: isObscure ?? false,
          decoration: InputDecoration(
            contentPadding: padding ??
                EdgeInsets.only(
                  left: 30,
                  top: 20,
                  bottom: 20,
                ),
            labelText: label,
            labelStyle: TextStyle(fontSize: fontSize ?? 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
            ),
          ),
        );
}
