import 'package:flutter/material.dart';

class CategoryCardBuilder extends StatelessWidget {
  final String? categoryTitle;

  const CategoryCardBuilder({Key? key, required this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) => _buildBody(context);

  _buildBody(BuildContext context) {
    return Container(
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '$categoryTitle',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0),
            ),
          ),
        ),
      ),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
    );
  }
}
