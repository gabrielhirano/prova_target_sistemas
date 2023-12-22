import 'package:flutter/material.dart';
import 'package:target_sistemas_prova_flutter/common/components/text_button_app.dart';
import 'package:target_sistemas_prova_flutter/common/theme/theme_global.dart';
import 'package:url_launcher/url_launcher.dart';

class PoliciesPrivacyButtonWidget extends StatelessWidget {
  const PoliciesPrivacyButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButtonApp(
      color: appColors.white,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      text: 'Política de Privacidade',
      onTap: () {
        _launchUrl();
      },
    );
  }

  Future<void> _launchUrl() async {
    final url = Uri.parse('http://www.google.com.br');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
