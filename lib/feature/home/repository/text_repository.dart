import 'package:target_sistemas_prova_flutter/common/service/app_exceptions.dart';
import 'package:target_sistemas_prova_flutter/common/service/shared_preferences_service.dart';
import 'package:target_sistemas_prova_flutter/feature/home/model/text_model.dart';

class TextRepository {
  final SharedPreferencesService<TextModel> localRepository;

  TextRepository(this.localRepository);

  // void _initSharedPreferencesService(
  //     SharedPreferencesService<TextModel>? localRepository) {
  //   localRepository = localRepository ?? SharedPreferencesService<TextModel>();
  // }

  Future<List<TextModel>> getAll() async {
    try {
      final response = await localRepository.getList();

      return _listObjects(response);
    } catch (e) {
      throw CustomException('Erro ao buscar dados');
    }
  }

  Future registerText(TextModel textModel) async {
    return localRepository.post(textModel.key, textModel);
  }

  Future updateText(TextModel textModel) async {
    return localRepository.post(textModel.key, textModel);
  }

  Future deleteText(String key) {
    return localRepository.delete(key);
  }

  List<TextModel> _listObjects(List<dynamic> listObjects) {
    List<TextModel> list = [];

    for (var object in listObjects) {
      list.add(TextModel.fromJson(object));
    }

    return list;
  }
}
