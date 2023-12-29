// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_data_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApiDataManager<T> on _ApiDataManager<T>, Store {
  Computed<bool>? _$hasSucessfullComputed;

  @override
  bool get hasSucessfull =>
      (_$hasSucessfullComputed ??= Computed<bool>(() => super.hasSucessfull,
              name: '_ApiDataManager.hasSucessfull'))
          .value;
  Computed<bool>? _$isAwaitingComputed;

  @override
  bool get isAwaiting =>
      (_$isAwaitingComputed ??= Computed<bool>(() => super.isAwaiting,
              name: '_ApiDataManager.isAwaiting'))
          .value;
  Computed<bool>? _$hasFailedComputed;

  @override
  bool get hasFailed =>
      (_$hasFailedComputed ??= Computed<bool>(() => super.hasFailed,
              name: '_ApiDataManager.hasFailed'))
          .value;
  Computed<bool>? _$isIdleComputed;

  @override
  bool get isIdle => (_$isIdleComputed ??=
          Computed<bool>(() => super.isIdle, name: '_ApiDataManager.isIdle'))
      .value;
  Computed<bool>? _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??=
          Computed<bool>(() => super.isEmpty, name: '_ApiDataManager.isEmpty'))
      .value;
  Computed<ApiDataEnum>? _$getStatusComputed;

  @override
  ApiDataEnum get getStatus =>
      (_$getStatusComputed ??= Computed<ApiDataEnum>(() => super.getStatus,
              name: '_ApiDataManager.getStatus'))
          .value;
  Computed<T?>? _$getDataComputed;

  @override
  T? get getData => (_$getDataComputed ??=
          Computed<T?>(() => super.getData, name: '_ApiDataManager.getData'))
      .value;
  Computed<int>? _$currentPageComputed;

  @override
  int get currentPage =>
      (_$currentPageComputed ??= Computed<int>(() => super.currentPage,
              name: '_ApiDataManager.currentPage'))
          .value;
  Computed<bool>? _$hasNextPageComputed;

  @override
  bool get hasNextPage =>
      (_$hasNextPageComputed ??= Computed<bool>(() => super.hasNextPage,
              name: '_ApiDataManager.hasNextPage'))
          .value;
  Computed<CustomException?>? _$getErrorComputed;

  @override
  CustomException? get getError =>
      (_$getErrorComputed ??= Computed<CustomException?>(() => super.getError,
              name: '_ApiDataManager.getError'))
          .value;
  Computed<String>? _$getMessageErrorComputed;

  @override
  String get getMessageError => (_$getMessageErrorComputed ??= Computed<String>(
          () => super.getMessageError,
          name: '_ApiDataManager.getMessageError'))
      .value;

  late final _$_statusAtom =
      Atom(name: '_ApiDataManager._status', context: context);

  @override
  ApiDataEnum get _status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  set _status(ApiDataEnum value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_dataAtom =
      Atom(name: '_ApiDataManager._data', context: context);

  @override
  T? get _data {
    _$_dataAtom.reportRead();
    return super._data;
  }

  @override
  set _data(T? value) {
    _$_dataAtom.reportWrite(value, super._data, () {
      super._data = value;
    });
  }

  late final _$_errorAtom =
      Atom(name: '_ApiDataManager._error', context: context);

  @override
  CustomException? get _error {
    _$_errorAtom.reportRead();
    return super._error;
  }

  @override
  set _error(CustomException? value) {
    _$_errorAtom.reportWrite(value, super._error, () {
      super._error = value;
    });
  }

  late final _$_pageAtom =
      Atom(name: '_ApiDataManager._page', context: context);

  @override
  int? get _page {
    _$_pageAtom.reportRead();
    return super._page;
  }

  @override
  set _page(int? value) {
    _$_pageAtom.reportWrite(value, super._page, () {
      super._page = value;
    });
  }

  late final _$_ApiDataManagerActionController =
      ActionController(name: '_ApiDataManager', context: context);

  @override
  dynamic setStatus(ApiDataEnum status, {CustomException? error, T? data}) {
    final _$actionInfo = _$_ApiDataManagerActionController.startAction(
        name: '_ApiDataManager.setStatus');
    try {
      return super.setStatus(status, error: error, data: data);
    } finally {
      _$_ApiDataManagerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasSucessfull: ${hasSucessfull},
isAwaiting: ${isAwaiting},
hasFailed: ${hasFailed},
isIdle: ${isIdle},
isEmpty: ${isEmpty},
getStatus: ${getStatus},
getData: ${getData},
currentPage: ${currentPage},
hasNextPage: ${hasNextPage},
getError: ${getError},
getMessageError: ${getMessageError}
    ''';
  }
}
