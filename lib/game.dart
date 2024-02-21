import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game/end.dart';
import 'package:game/fall.dart';
import 'package:game/point_provider.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool end = false;
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      context.read<AllProvider>().minusCount();
      if (context.read<AllProvider>().count == 0) {
        timer.cancel();
        end = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return end
        ? const EndPage()
        : PopScope(
            canPop: false,
            child: Scaffold(
              backgroundColor: Colors.pink[50],
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  '${context.watch<AllProvider>().point} point, ${context.watch<AllProvider>().count}초',
                  style: TextStyle(color: Colors.pink[100]),
                ),
                centerTitle: true,
              ),
              body: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Text(
                        'Made by INCOM',
                        style: TextStyle(color: Colors.pink[100]),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: AssetImage('assets/images/bg.png'),
                            fit: BoxFit.fitWidth)),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 700,
                        width: MediaQuery.sizeOf(context).width - 60,
                        padding: const EdgeInsets.all(30.0),
                        child: Stack(
                          children: List<Widget>.generate(
                              10, (index) => const FallAni()),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.pink[50],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
