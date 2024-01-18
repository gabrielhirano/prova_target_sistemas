import 'package:mobx/mobx.dart';
import 'package:target_sistemas_prova_flutter/common/service/api_data_manager/api_data_manager.dart';
import 'package:target_sistemas_prova_flutter/feature/home/model/text_model.dart';
import 'package:target_sistemas_prova_flutter/feature/home/repository/text_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final TextRepository repository;

  _HomeControllerBase(this.repository) {
    _initData();
  }
  @observable
  ApiDataManager<List<TextModel>> dataManager =
      ApiDataManager<List<TextModel>>();

  @action
  _initData() async {
    await getTexts();
  }

  @action
  Future<void> getTexts() async {
    dataManager.setStatus(ApiDataEnum.awaiting);

    await repository.getAll().then((value) {
      return dataManager.setStatus(ApiDataEnum.sucess, data: value);
    }).catchError((error) {
      return dataManager.setStatus(ApiDataEnum.error, error: error);
    });
  }

  @action
  registerText(String description) {
    repository.registerText(
        TextModel(key: 'texto ${keyController + 1}', description: description));
  }

  @action
  updateText(TextModel textModel, String text) {
    repository.updateText(TextModel(key: textModel.key, description: text));
  }

  @action
  deleteText(String key) {
    repository.deleteText(key);
  }

  int get keyController {
    if (dataManager.getData == null || dataManager.getData!.isEmpty) {
      return 0;
    }
    return dataManager.getData!.length;
  }
}
