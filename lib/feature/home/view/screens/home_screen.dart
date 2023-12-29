import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target_sistemas_prova_flutter/common/components/background_gradient_app.dart';
import 'package:target_sistemas_prova_flutter/common/utils/alert/app_alert.dart';
import 'package:target_sistemas_prova_flutter/common/utils/alert/dialog_util.dart';
import 'package:target_sistemas_prova_flutter/common/utils/global_services.dart';
import 'package:target_sistemas_prova_flutter/common/utils/modal/app_modal.dart';
import 'package:target_sistemas_prova_flutter/feature/home/controller/home_controller.dart';
import 'package:target_sistemas_prova_flutter/feature/home/model/text_model.dart';
import 'package:target_sistemas_prova_flutter/feature/home/view/widgets/modal_edit_text_widget.dart';
import 'package:target_sistemas_prova_flutter/feature/home/view/widgets/register_text_field_widget.dart';
import 'package:target_sistemas_prova_flutter/feature/home/view/widgets/text_card_widget.dart';

import '../../../../common/config/dependency_injection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();

  final HomeController _controller = getIt<HomeController>();
  late AppDialog _appDialog;
  late AppModal _appModal;

  @override
  void initState() {
    _appDialog = AppDialog(context);
    _appModal = AppModal(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundGradientDefaultApp(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContentArea(),
              const SizedBox(height: 40),
              RegisterTextFieldWidget(
                focusNode: _focusNode,
                textController: _textController,
                onFieldSubmitted: _onFieldSubmitted,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentArea() {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 400,
        child: Observer(
          builder: (_) {
            if (_controller.dataManager.isEmpty) {
              return const Center(
                child: Text('Sem conteúdo cadastrado'),
              );
            }
            return ListView.builder(
              itemCount: _controller.dataManager.getData!.length,
              itemBuilder: (context, index) {
                final TextModel textModel =
                    _controller.dataManager.getData![index];
                return TextCardWidget(
                  text: textModel,
                  onEdit: _onEdit,
                  onDelete: _onDelete,
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _onEdit(TextModel textModel) {
    _appModal.openDialog(ModalEditTextField(
      textModel: textModel,
      onConfirm: (text) {
        _controller.updateText(textModel, text);
        appNavigator.popNavigate();
        _controller.getTexts();
      },
      onCancel: () {
        appNavigator.popNavigate();
      },
    ));
  }

  void _onDelete(TextModel text) {
    _appDialog.showAlert(
        message: 'Deseja remover este item?',
        alertType: AlertType.yesNo,
        dialogCallbackYES: () {
          _controller.deleteText(text.key);
          _controller.getTexts();
        });
  }

  void _onFieldSubmitted(String? text) {
    if (text != null) {
      _controller.registerText(text);
      _controller.getTexts();

      _textController.clear();
      _focusNode.requestFocus();
    } else {}
  }
}
