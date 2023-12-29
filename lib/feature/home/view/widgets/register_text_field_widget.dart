import 'package:flutter/material.dart';

import '../../../../common/components/input_form_app.dart';

class RegisterTextFieldWidget extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController textController;
  final Function(String?)? onFieldSubmitted;
  const RegisterTextFieldWidget(
      {super.key,
      required this.focusNode,
      required this.textController,
      this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InputFormApp(
        controller: textController,
        focusNode: focusNode,
        autoFocus: true,
        inputDecoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          label: Text(
            'Digite seu texto',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        validator: (String? teste) {
          return;
        },
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }

  String? validator(String? text) {
    return '';
  }
}
