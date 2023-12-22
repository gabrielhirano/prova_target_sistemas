import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:target_sistemas_prova_flutter/common/components/input_form_app.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/model/password_model.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  const PasswordTextFieldWidget({super.key, required this.controller});

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return InputFormApp(
      controller: widget.controller,
      label: 'Senha',
      obscureText: true,
      prefixIcon: const Icon(Icons.lock, size: 18),
      validator: _validatePassword,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'[a-zA-Z0-9]'), // Permite apenas letras e números
        ),
      ],
    );
  }

  String? _validatePassword(String? value) {
    final passwordModel = PasswordModel(value ?? '');
    return passwordModel.validate();
  }
}
