import 'package:flutter/material.dart';

class ErrorBuilder extends StatelessWidget {
  final Function refreshCallBack;
  final bool isConnect;

  const ErrorBuilder(
      {Key? key, required this.refreshCallBack, required this.isConnect})
      : super(key: key);

  @override
  Widget build(BuildContext context) => _buildBody(context);

  Widget _buildBody(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            getTextErrorType(),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => refreshCallBack(),
              child: const Text(
                "Try Again",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red),
              ))
        ],
      ),
    );
  }

  getTextErrorType() {
    if (isConnect) {
      return 'There is a problem with internet';
    } else {
      return 'Server error, Try again';
    }
  }
}
