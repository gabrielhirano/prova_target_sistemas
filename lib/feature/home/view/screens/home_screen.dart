import 'package:flutter/material.dart';
import 'package:target_sistemas_prova_flutter/common/components/background_gradient_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundGradientDefaultApp(
          child: Center(
        child: Text('TEste'),
      )),
    );
  }
}
