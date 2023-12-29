import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_sistemas_prova_flutter/common/service/shared_preferences_service.dart';
import 'package:target_sistemas_prova_flutter/feature/home/model/text_model.dart';
import 'package:target_sistemas_prova_flutter/feature/home/repository/text_repository.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  test('Register new text in shared preferences', () async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final SharedPreferencesService<TextModel> localRepository =
        SharedPreferencesService<TextModel>(shared: pref);

    final repository = TextRepository(localRepository);
    const record =
        TextModel(key: 'texto 1', description: 'Primeiro texte registrado');

    repository.registerText(record);

    final data = await repository.getAll();
    expect(record, data.first);
  });
}
