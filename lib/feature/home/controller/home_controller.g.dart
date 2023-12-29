// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$dataManagerAtom =
      Atom(name: '_HomeControllerBase.dataManager', context: context);

  @override
  ApiDataManager<List<TextModel>> get dataManager {
    _$dataManagerAtom.reportRead();
    return super.dataManager;
  }

  @override
  set dataManager(ApiDataManager<List<TextModel>> value) {
    _$dataManagerAtom.reportWrite(value, super.dataManager, () {
      super.dataManager = value;
    });
  }

  late final _$_initDataAsyncAction =
      AsyncAction('_HomeControllerBase._initData', context: context);

  @override
  Future _initData() {
    return _$_initDataAsyncAction.run(() => super._initData());
  }

  late final _$getTextsAsyncAction =
      AsyncAction('_HomeControllerBase.getTexts', context: context);

  @override
  Future<void> getTexts() {
    return _$getTextsAsyncAction.run(() => super.getTexts());
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  dynamic registerText(String description) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.registerText');
    try {
      return super.registerText(description);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteText(String key) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.deleteText');
    try {
      return super.deleteText(key);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dataManager: ${dataManager}
    ''';
  }
}
