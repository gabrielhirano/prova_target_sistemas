// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginControllerBase, Store {
  late final _$dataManagerAtom =
      Atom(name: '_LoginControllerBase.dataManager', context: context);

  @override
  ApiDataManager<String> get dataManager {
    _$dataManagerAtom.reportRead();
    return super.dataManager;
  }

  @override
  set dataManager(ApiDataManager<String> value) {
    _$dataManagerAtom.reportWrite(value, super.dataManager, () {
      super.dataManager = value;
    });
  }

  late final _$authenticationAsyncAction =
      AsyncAction('_LoginControllerBase.authentication', context: context);

  @override
  Future<void> authentication(
      {required String email, required String password}) {
    return _$authenticationAsyncAction
        .run(() => super.authentication(email: email, password: password));
  }

  @override
  String toString() {
    return '''
dataManager: ${dataManager}
    ''';
  }
}
