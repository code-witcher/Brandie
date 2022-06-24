import 'package:flutter/material.dart';

class AddProductField extends StatelessWidget {
  const AddProductField({
    Key? key,
    this.hint,
    this.initialValue,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.onSaved,
    this.prefixIcon,
    this.maxLines,
  }) : super(key: key);

  final String? hint;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Widget? prefixIcon;
  final String? Function(String? v)? validator;
  final Function(String? v)? onSaved;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: hint,
            prefixIcon: prefixIcon),
        initialValue: initialValue,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        validator: validator,
        onSaved: onSaved,
        maxLines: maxLines,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
