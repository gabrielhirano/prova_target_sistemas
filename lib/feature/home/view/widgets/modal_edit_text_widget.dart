import 'package:flutter/material.dart';
import 'package:target_sistemas_prova_flutter/common/theme/theme_global.dart';
import 'package:target_sistemas_prova_flutter/common/utils/extensions/string_extensions.dart';
import 'package:target_sistemas_prova_flutter/feature/home/model/text_model.dart';

class ModalEditTextField extends StatefulWidget {
  final TextModel textModel;
  final Function() onCancel;
  final Function(String text) onConfirm;

  const ModalEditTextField(
      {super.key,
      required this.textModel,
      required this.onCancel,
      required this.onConfirm});

  @override
  State<ModalEditTextField> createState() => _ModalEditTextFieldState();
}

class _ModalEditTextFieldState extends State<ModalEditTextField> {
  final TextEditingController textEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: 300,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.textModel.key.capitalize,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: 50,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                child: TextField(
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.black),
                    hintText: widget.textModel.description,
                    hintStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: textEditController,
                  keyboardType: TextInputType.text,
                  onSubmitted: widget.onConfirm,
                ),
              ),
            ),
            Row(
              children: [
                _buildButton(
                  text: 'Cancelar',
                  color: const Color.fromARGB(255, 252, 205, 205),
                  onPressed: widget.onCancel,
                ),
                const SizedBox(width: 8),
                _buildButton(
                  text: 'Continuar',
                  color: const Color.fromARGB(255, 14, 181, 20),
                  onPressed: () => widget.onConfirm(textEditController.text),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      {required String text,
      required Color color,
      required Function() onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 138,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18,
                color: appColors.white,
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
