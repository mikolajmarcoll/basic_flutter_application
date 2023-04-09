import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard;
  final String stateMachineName;
  final String title;
  final String src;
  late SMIBool? input;

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

RiveAsset? getCurrentNavigationAsset(String path) {
  if (path == "/") return bottomNavs[0];

  return null;
}
