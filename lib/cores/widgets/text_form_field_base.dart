import 'package:flutter/material.dart';

class TextFormFieldBase extends StatefulWidget {
  const TextFormFieldBase({
    super.key,
    required TextEditingController controller,
    required FocusNode focusNode,
    InputDecoration? decoration,
    required String hintText,
    required String? Function(String?) validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    bool obscureText = false,
  }) : _obscureText = obscureText,
       _autovalidateMode = autovalidateMode,
       _validator = validator,
       _decoration = decoration,
       _hintText = hintText,
       _focusNode = focusNode,
       _controller = controller;

  final TextEditingController _controller;
  final FocusNode _focusNode;
  final String _hintText;
  final InputDecoration? _decoration;
  final FormFieldValidator<String> _validator;
  final AutovalidateMode _autovalidateMode;
  final bool _obscureText;

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
      hintText: widget._hintText,
      hintStyle: TextStyle(fontSize: 13, color: colorScheme.outline),
      filled: true,
      fillColor: colorScheme.surfaceContainer,
      enabledBorder: _borderDefault(colorScheme),
      focusedBorder: _borderDefault(colorScheme),
      errorBorder: _borderError(colorScheme),
      focusedErrorBorder: _borderError(colorScheme),
      errorStyle: const TextStyle(fontSize: 13),
      errorMaxLines: 3,
      suffixIcon: widget._obscureText ? _buildIconButtonObscured() : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    return TextFormField(
      focusNode: widget._focusNode,
      controller: widget._controller,
      decoration: widget._decoration ?? _defaultInputDecoration(colorScheme),
      validator: widget._validator,
      autovalidateMode: widget._autovalidateMode,
      obscureText: widget._obscureText ? _isObscured : false,
    );
  }
}
