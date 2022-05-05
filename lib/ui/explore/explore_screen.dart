import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/explore_provider.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, ExploreProvider exploreProvider,
            Widget? child) {
          return Scaffold(appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Constants.appName",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          );
        });
  }
}
