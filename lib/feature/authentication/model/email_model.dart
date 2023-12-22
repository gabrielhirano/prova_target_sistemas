import 'package:target_sistemas_prova_flutter/common/utils/validators/input_validator.dart';

class EmailModel with InputValidator {
  final String email;

  EmailModel(this.email);

  String? validate() {
    List<String? Function()> validators = [
      () => isNotEmpty(email),
      () => limitOfChars(email, 20),
      () => validateNoTrailingSpaces(email),
    ];

    return combine(validators);
  }
}
