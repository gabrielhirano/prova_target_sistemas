import 'package:target_sistemas_prova_flutter/common/service/comunication_service.dart';
import 'package:target_sistemas_prova_flutter/feature/home/model/text_model.dart';

class TextRepository {
  final ComunicationService comunicationService;

  TextRepository({required this.comunicationService});

  Future<List<TextModel>> getAll() {
    return [] as Future<List<TextModel>>;
  }
}
