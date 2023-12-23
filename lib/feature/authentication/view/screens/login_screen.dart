import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target_sistemas_prova_flutter/common/components/button_app.dart';
import 'package:target_sistemas_prova_flutter/common/config/dependency_injection.dart';
import 'package:target_sistemas_prova_flutter/common/theme/theme_global.dart';
import 'package:target_sistemas_prova_flutter/common/utils/alert/dialog_util.dart';
import 'package:target_sistemas_prova_flutter/common/utils/enums/status_response_enum.dart';
import 'package:target_sistemas_prova_flutter/common/utils/global_services.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/controller/login_controller.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/view/widgets/email_text_field_widget.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/view/widgets/password_text_field_widget.dart';
import 'package:target_sistemas_prova_flutter/feature/home/view/screens/home_screen.dart';

import '../../../../common/components/background_gradient_app.dart';
// Importações restantes

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController _controller = getIt<LoginController>();
  late AppDialog _appDialog;

  @override
  void initState() {
    _appDialog = AppDialog(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (_controller.status.isAwaiting) {
        return const CircularProgressIndicator();
      }

      return Scaffold(
        body: BackgroundGradientDefaultApp(
          child: Center(child: _buildLoginForm()),
        ),
      );
    });
  }

  Widget _buildLoginForm() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 350,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              EmailTextFieldWidget(controller: _emailController),
              const SizedBox(height: 20),
              PasswordTextFieldWidget(controller: _passwordController),
              const SizedBox(height: 40),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ButtonApp(
      height: 40,
      width: 120,
      color: appColors.green,
      onTap: _onLoginButtonPressed,
      content: Text('Entrar', style: TextStyle(color: appColors.white)),
    );
  }

  void _onLoginButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      await _controller.authentication(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (_controller.status.hasSucessfull) {
        appNavigator.navigate(const HomeScreen());
      }

      if (_controller.status.hasFailed) {
        _appDialog.showAlert(message: _controller.errorMessage);
      }
    }
  }
}
