import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:target_sistemas_prova_flutter/common/theme/theme_global.dart';

enum AlertType { ok, yesNo }

class AppAlert extends StatelessWidget {
  final AlertType? alertType;

  final Function()? dialogCallbackYES;
  final Function()? dialogCallbackNO;

  final String textYesButton;
  final String textNoButton;

  final String title;
  final Color? titleColor;

  final String message;
  final Color? messageColor;

  final TextAlign? textAlign;

  const AppAlert(
      {super.key,
      this.title = 'Drogaria Araujo',
      this.titleColor,
      required this.message,
      this.messageColor,
      this.alertType = AlertType.ok,
      this.dialogCallbackYES,
      this.dialogCallbackNO,
      this.textYesButton = 'Sim',
      this.textNoButton = 'Não',
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: _dialogContent(context),
    );
  }

  _dialogContent(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: titleColor ?? appColors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                message,
                textAlign: textAlign,
                style: TextStyle(
                    color: messageColor ?? appColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 16,
              ),
              alertType == AlertType.ok
                  ? _buildSimpleButton(context)
                  : _buildDecisionButton(context)
            ],
          ),
        ));
  }

  Widget _buildSimpleButton(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextButton(
        onPressed: () {
          HapticFeedback.mediumImpact();
          Navigator.of(context).pop(true);
          if (dialogCallbackYES != null) dialogCallbackYES!();
        },
        child: Text(
          'OK',
          style: TextStyle(
              color: appColors.green,
              fontSize: 17,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  Widget _buildDecisionButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 40,
          child: TextButton(
            onPressed: () {
              HapticFeedback.mediumImpact();
              Navigator.of(context).pop(true);
              if (dialogCallbackYES != null) dialogCallbackYES!();
            },
            child: Text(
              textYesButton,
              style: TextStyle(
                  color: appColors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Divider(
          height: 1,
          color: appColors.white,
        ),
        const SizedBox(
          width: 8,
        ),
        SizedBox(
          height: 40,
          child: TextButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              Navigator.of(context).pop();
              if (dialogCallbackNO != null) dialogCallbackNO!();
            },
            child: Text(
              textNoButton,
              style: TextStyle(
                  color: appColors.red,
                  fontSize: 17,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ],
    );
  }
}
