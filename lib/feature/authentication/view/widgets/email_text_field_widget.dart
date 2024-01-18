import 'package:flutter/material.dart';
import 'package:target_sistemas_prova_flutter/common/components/input_form_app.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/model/email_model.dart';

class EmailTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  const EmailTextFieldWidget({super.key, required this.controller});

  @override
  State<EmailTextFieldWidget> createState() => _EmailTextFieldWidgetState();
}

class _EmailTextFieldWidgetState extends State<EmailTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return InputFormApp(
      controller: widget.controller,
      label: 'Usuário',
      prefixIcon: const Icon(Icons.person_sharp, size: 18),
      validator: _validatePassword,
    );
  }

  String? _validatePassword(String? value) {
    final emailModel = EmailModel(value ?? '');
    return emailModel.validate();
  }
}
