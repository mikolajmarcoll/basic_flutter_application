import 'package:flutter/material.dart';
import 'package:flutter_application/screens/gallery_screen.dart';
import 'package:rive/rive.dart';

import '../constants.dart';
import '../models/rive_asset.dart';
import '../utils/rive.dart';
import 'animated_bar.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key, required this.selectedBottomNav, required this.handleChange}) : super(key: key);

  final RiveAsset? selectedBottomNav;
  final Function handleChange;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 64, vertical: 10),
        decoration: BoxDecoration(
            color: backgroundColor2.withOpacity(0.8), borderRadius: const BorderRadius.all(Radius.circular(24))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
                bottomNavs.length,
                (index) => GestureDetector(
                      onTap: () {
                        if (bottomNavs[index] != selectedBottomNav) {
                          handleChange(index);
                        }

                        final input = bottomNavs[index].input;
                        if (input != null) {
                          input.change(true);

                          Future.delayed(const Duration(seconds: 1), () {
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
    );
  }
}
