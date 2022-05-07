import 'package:book_reader/components/error_builder.dart';
import 'package:book_reader/components/loading_builder.dart';
import 'package:book_reader/utils/api_status.dart';
import 'package:flutter/cupertino.dart';

class BodyBuilder extends StatelessWidget {
  final ApiStatus apiStatus;
  final Widget child;
  final Function reload;

  const BodyBuilder(
      {Key? key, required this.apiStatus, required this.child, required this.reload})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildData(context);
  }

  _buildData(BuildContext context) {
    switch (apiStatus) {
      case ApiStatus.loaded:
        return child;
      case ApiStatus.loading:
        return const LoadingBuilder();
      case ApiStatus.unInit:
        break;
      case ApiStatus.error:
        return ErrorBuilder(refreshCallBack: reload, isConnect: false);
      case ApiStatus.connectError:
        return ErrorBuilder(refreshCallBack: reload, isConnect: true);
      default:
        return const LoadingBuilder();
    }
  }
}