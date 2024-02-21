import 'package:flutter/material.dart';
import 'package:game/game.dart';

class Waiting extends StatefulWidget {
  const Waiting({super.key});

  @override
  State<Waiting> createState() => _WaitingState();
}

class _WaitingState extends State<Waiting> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Made\nby\nINCOM',
                style: TextStyle(color: Colors.pink[100], fontSize: 30),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GamePage(),
                        ));
                  },
                  child: Text(
                    'Game Start',
                    style: TextStyle(color: Colors.pink.withOpacity(0.5)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
