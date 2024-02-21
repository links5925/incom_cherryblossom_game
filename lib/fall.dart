import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game/point_provider.dart';
import 'package:provider/provider.dart';

class FallAni extends StatefulWidget {
  const FallAni({super.key});

  @override
  State<FallAni> createState() => _FallAniState();
}

class _FallAniState extends State<FallAni> {
  Alignment alignment = Alignment(2 * (Random().nextDouble() - 0.5), -1);
  Duration duration =
      Duration(milliseconds: (500 + Random().nextDouble() * 6000).toInt());
  bool isColor = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      a();
    });
  }

  a() {
    alignment = Alignment(alignment.x, 1);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedAlign(
            onEnd: () {
              isColor = true;
              if (alignment.y == -1) {
                setState(() {
                  alignment = Alignment(alignment.x, 1);
                  duration = Duration(
                      milliseconds:
                          (1500 + Random().nextDouble() * 1000).toInt());
                });
              } else {
                alignment = Alignment(2 * (Random().nextDouble() - 0.5), -1);
                duration = const Duration(milliseconds: 1);
                setState(() {});
              }
            },
            alignment: alignment,
            duration: duration,
            child: GestureDetector(
                onTap: () {
                  context.read<AllProvider>().addPoint();
                  isColor = false;
                  setState(() {});
                },
                child: isColor
                    ? Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/cherry.png'),
                                scale: 0.01)),
                      )
                    : Container()),
          ),
        ),
      ],
    );
  }
}
