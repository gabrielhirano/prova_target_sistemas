import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:target_sistemas_prova_flutter/common/theme/theme_global.dart';

class InputFormApp extends StatefulWidget {
  final String label;
  final Widget prefixIcon;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  const InputFormApp({
    Key? key,
    required this.label,
    required this.prefixIcon,
    required this.controller,
    required this.validator,
    this.obscureText = false,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<InputFormApp> createState() => _InputFormAppState();
}

class _InputFormAppState extends State<InputFormApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              widget.label,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w300),
            )),
        const SizedBox(height: 4),
        Container(
          height: 80,
          // color: Colors.red,
          child: TextFormField(
            // cursorHeight: 100,
            inputFormatters: widget.inputFormatters,
            obscureText: widget.obscureText,
            controller: widget.controller,
            validator: widget.validator,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                border: const OutlineInputBorder(),
                prefixIcon: widget.prefixIcon,
                prefixIconColor: Colors.black,
                prefixIconConstraints:
                    const BoxConstraints(maxWidth: 80, minWidth: 40),
                filled: true,
                fillColor: appColors.white,
                errorStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
      ],
    );
  }
}
