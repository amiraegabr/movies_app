import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final Widget prefixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.prefixIcon,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? _obscure : false,
      validator: widget.validator,
      // style: TextTheme.of(context).bodyLarge,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
        hintText: widget.hint,
        hintStyle: TextStyle(color: AppColors.white),
        prefixIcon: Padding(
          padding: EdgeInsets.all(8.0),
          child: widget.prefixIcon,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscure ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.white,
                ),
                onPressed: () => setState(() => _obscure = !_obscure),
              )
            : null,
        filled: true,
        fillColor: AppColors.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white24, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.red, width: 1),
        ),
      ),
    );
  }
}
