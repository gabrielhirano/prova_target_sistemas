import 'package:mobx/mobx.dart';
import 'package:target_sistemas_prova_flutter/common/service/app_exceptions.dart';

part 'api_data_manager.g.dart';

enum ApiDataEnum { idle, sucess, awaiting, error }

class ApiDataManager<T> = _ApiDataManager<T> with _$ApiDataManager<T>;

abstract class _ApiDataManager<T> with Store {
  @observable
  ApiDataEnum _status = ApiDataEnum.idle;

  @observable
  T? _data;

  @observable
  CustomException? _error;

  @observable
  int? _page;

  @computed
  bool get hasSucessfull => _status == ApiDataEnum.sucess;

  @computed
  bool get isAwaiting => _status == ApiDataEnum.awaiting;

  @computed
  bool get hasFailed => _status == ApiDataEnum.error;

  @computed
  bool get isIdle => _status == ApiDataEnum.idle;

  @computed
  bool get isEmpty {
    if (_data == null) return true;
    if (_status == ApiDataEnum.sucess && _data is List) {
      return (_data as List).isEmpty;
    }
    return false;
  }

  @computed
  ApiDataEnum get getStatus => _status;

  @computed
  T? get getData => _data;

  @computed
  int get currentPage => _page ?? 0;

  @computed
  bool get hasNextPage {
    return _page != null && _page! >= 0;
  }

  @computed
  CustomException? get getError => _error;

  @computed
  String get getMessageError => getError?.message ?? 'Erro generico';

  @action
  setStatus(ApiDataEnum status, {CustomException? error, T? data}) {
    _status = status;
    _error = error;
    if (data != null) {
      _data = data;
    }
  }
}
