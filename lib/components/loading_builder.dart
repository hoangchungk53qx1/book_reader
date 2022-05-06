import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBuilder extends StatelessWidget {
  final bool isLoadingPhoto;

  const LoadingBuilder({Key? key, this.isLoadingPhoto = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (isLoadingPhoto) {
      return SpinKitRipple(
        color: Theme
            .of(context)
            .colorScheme
            .secondary,
      );
    } else {
      return SpinKitWave(
        color: Theme
            .of(context)
            .colorScheme
            .secondary,
      );
    }
  }
}