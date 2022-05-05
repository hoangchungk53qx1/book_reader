import 'package:book_reader/utils/const.dart';
import 'package:book_reader/viewmodel/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder:
        (BuildContext context, HomeProvider homeProvider, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            Constants.appName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      );
    });
  }
}
