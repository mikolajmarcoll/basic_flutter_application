import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application/utils/rive.dart';
import 'package:rive/rive.dart';
import 'package:flutter_application/constants.dart';

import '../widgets/animated_bar.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key, required this.title});

  final String title;

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  RiveAsset selectedBottomNav = bottomNavs.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Text("test"),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 64, vertical: 10),
          decoration: BoxDecoration(
              color: backgroundColor2.withOpacity(0.8), borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                  bottomNavs.length,
                  (index) => GestureDetector(
                        onTap: () {
                          if (bottomNavs[index] != selectedBottomNav) {
                            setState(() {
                              selectedBottomNav = bottomNavs[index];
                            });
                          }

                          final input = bottomNavs[index].input;
                          if (input != null) {
                            input.change(true);

                            Future.delayed(Duration(seconds: 1), () {
                              input.change(false);
                            });
                          }
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedBar(isActive: bottomNavs[index] == selectedBottomNav),
                            SizedBox(
                              height: 36,
                              width: 36,
                              child: Opacity(
                                opacity: bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                                child: RiveAnimation.asset(
                                  // scr is same for all
                                  bottomNavs.first.src,
                                  artboard: bottomNavs[index].artboard,
                                  onInit: (artboard) {
                                    StateMachineController controller = RiveUtils.getRiveController(artboard,
                                        stateMachineName: bottomNavs[index].stateMachineName);

                                    print("index");
                                    print(index);
                                    bottomNavs[index].input = controller.findSMI("active") as SMIBool;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}

class RiveAsset {
  final String artboard;
  final String stateMachineName;
  final String title;
  final String src;
  late final SMIBool? input;

  RiveAsset(this.src, {required this.artboard, required this.stateMachineName, required this.title, this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset("assets/icons.riv", artboard: "USER", stateMachineName: "USER_Interactivity", title: "User"),
  RiveAsset("assets/icons.riv", artboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat"),
  RiveAsset("assets/icons.riv", artboard: "BELL", stateMachineName: "BELL_Interactivity", title: "Notifications"),
];
