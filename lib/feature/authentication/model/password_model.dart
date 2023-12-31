import 'package:target_sistemas_prova_flutter/common/utils/validators/input_validator.dart';

class PasswordModel with InputValidator {
  final String password;

  PasswordModel(this.password);

  RegExp get inputFormatAllow => justNumberAndWord;

  String? validate() {
    List<String? Function()> validators = [
      () => isNotEmpty(password),
      () => hasTwoChars(password),
      () => limitOfChars(password, 20),
      () => validateNoTrailingSpaces(password),
    ];

    return combine(validators);
  }
}
