import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
// ignore: must_be_immutable
class CustomAlert extends StatelessWidget {
  late final Widget child;
  late double deviceWidth;
  late double deviceHeight;
  late double dialogHeight;

  CustomAlert({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size viewSize = MediaQuery.of(context).size;
    deviceWidth =
        orientation == Orientation.portrait ? viewSize.width : viewSize.height;
    deviceHeight =
        orientation == Orientation.portrait ? viewSize.height : viewSize.width;

    return MediaQuery(
        data: const MediaQueryData(),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.9, sigmaY: 0.9),
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      width: deviceWidth * 0.9,
                      child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: child,
                        ),
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
