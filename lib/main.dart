import 'package:flutter/material.dart';
import 'package:game/point_provider.dart';
import 'package:game/wait.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AllProvider(),
        )
      ],
      child: const MaterialApp(
        home: Scaffold(
          body: Waiting(),
        ),
      ),
    );
  }
}
