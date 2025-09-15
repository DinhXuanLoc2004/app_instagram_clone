import 'package:flutter/material.dart';

class TextFormFieldBase extends StatefulWidget {
  const TextFormFieldBase({
    super.key,
    required this.controller,
    required this.focusNode,
    this.decoration,
    required this.hintText,
    required this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final InputDecoration? decoration;
  final FormFieldValidator<String> validator;
  final AutovalidateMode autovalidateMode;
  final bool obscureText;

  @override
  State<TextFormFieldBase> createState() => _TextFormFieldBaseState();
}

class _TextFormFieldBaseState extends State<TextFormFieldBase> {
  bool _isObscured = true;

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(width: 2, color: color),
    );
  }

  OutlineInputBorder _borderDefault(ColorScheme colorScheme) {
    return _border(colorScheme.surfaceContainerHighest);
  }

  OutlineInputBorder _borderError(ColorScheme colorScheme) {
    return _border(colorScheme.error);
  }

  Widget _buildIconButtonObscured() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isObscured = !_isObscured;
        });
      },
      icon: Icon(_isObscured ? Icons.visibility_off : Icons.visibility),
    );
  }

  InputDecoration _defaultInputDecoration(ColorScheme colorScheme) {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: TextStyle(fontSize: 13, color: colorScheme.outline),
      filled: true,
      fillColor: colorScheme.surfaceContainer,
      enabledBorder: _borderDefault(colorScheme),
      focusedBorder: _borderDefault(colorScheme),
      errorBorder: _borderError(colorScheme),
      focusedErrorBorder: _borderError(colorScheme),
      errorStyle: const TextStyle(fontSize: 13),
      errorMaxLines: 3,
      suffixIcon: widget.obscureText ? _buildIconButtonObscured() : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      decoration: widget.decoration ?? _defaultInputDecoration(colorScheme),
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      obscureText: widget.obscureText ? _isObscured : false,
    );
  }
}
