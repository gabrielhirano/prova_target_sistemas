import 'package:flutter/material.dart';
import 'package:target_sistemas_prova_flutter/common/components/background_gradient_app.dart';
import 'package:target_sistemas_prova_flutter/common/components/input_form_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FocusNode _focusNode;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundGradientDefaultApp(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: 400,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InputFormApp(
                controller: _textController,
                focusNode: _focusNode,
                autoFocus: true,
                inputDecoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  label: Text(
                    'Digite seu texto',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                validator: (String? teste) {},
              ),
            )
          ],
        ),
      ),
    ));
  }
}
