import 'package:flutter/material.dart';

import '../core/app_theme.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.text,
    this.keyboardType,
    required this.hasIcon,
    this.onpressedIcon,
    this.maxlines = 1,
  });
  void Function()? onpressedIcon;
  bool hasIcon = false;
  var controller;
  var text;
  int maxlines;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxlines,
      obscureText: (widget.hasIcon && !showPassword),
      decoration: InputDecoration(
        suffixIcon: widget.hasIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                  color: AppTheme.primaryLight,
                ),
              )
            : null,
        labelText: widget.text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:  BorderSide(
            style: BorderStyle.none,
            color:  AppTheme.primaryLight,
          ), // Change border color here
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:  BorderSide(
            color: AppTheme.primaryLight,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:  BorderSide(
            color: AppTheme.primaryLight,
          ),
        ),
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        fillColor: AppTheme.whiteColor,
        filled: true,
      ),
      validator: widget.validator,
    );
  }
}