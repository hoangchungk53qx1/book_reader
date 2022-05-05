import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/setting_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, SettingProvider settingProvider,
            Widget? child) {
          return Scaffold(
            appBar: AppBar(title: const Text("Setting"), centerTitle: true,),
          );
        });
  }

}