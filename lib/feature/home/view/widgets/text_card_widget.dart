import 'package:flutter/material.dart';
import 'package:target_sistemas_prova_flutter/common/theme/theme_global.dart';
import 'package:target_sistemas_prova_flutter/feature/home/model/text_model.dart';

class TextCardWidget extends StatelessWidget {
  final TextModel text;
  final Function(TextModel text) onEdit;
  final Function(TextModel text) onDelete;

  const TextCardWidget(
      {super.key,
      required this.text,
      required this.onEdit,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(text.description)),
              Row(
                children: [
                  IconButton(
                    onPressed: () => onEdit(text),
                    color: appColors.green,
                    icon: const Icon(Icons.edit),
                    iconSize: 20,
                  ),
                  IconButton(
                    onPressed: () => onDelete(text),
                    color: appColors.red,
                    icon: const Icon(Icons.delete),
                    iconSize: 20,
                  ),
                ],
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
