import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target_sistemas_prova_flutter/common/components/background_gradient_app.dart';
import 'package:target_sistemas_prova_flutter/common/components/button_app.dart';
import 'package:target_sistemas_prova_flutter/common/config/dependency_injection.dart';
import 'package:target_sistemas_prova_flutter/common/theme/theme_global.dart';
import 'package:target_sistemas_prova_flutter/common/utils/global_services.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/controller/login_controller.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/view/widgets/email_text_field_widget.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/view/widgets/password_text_field_widget.dart';
import 'package:target_sistemas_prova_flutter/feature/home/view/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  late final LoginController controller;

  LoginScreen({super.key}) {
    controller = getIt<LoginController>();
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (widget.controller.status.isAwaiting) {
        return const CircularProgressIndicator();
      }

      return Scaffold(
        body: BackgroundGradientDefaultApp(
          child: Center(child: _loginFormWidget(context)),
        ),
      );
    });
  }

  Widget _loginFormWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 350,
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _form,
              child: Column(
                children: [
                  EmailTextFieldWidget(controller: _emailController),
                  const SizedBox(height: 20),
                  PasswordTextFieldWidget(controller: _passwordController),
                  const SizedBox(height: 40),
                  ButtonApp(
                    // adicionar sombra
                    height: 40,
                    width: 120,
                    color: appColors.green,
                    onTap: () async {
                      if (_form.currentState!.validate()) {
                        await widget.controller.authentication(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        if (widget.controller.status.hasSucessfull) {
                          appNavigator.navigate(HomeScreen());
                        }
                      }
                    },
                    content: Text(
                      'Entrar',
                      style: TextStyle(color: appColors.white),
                    ),
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
