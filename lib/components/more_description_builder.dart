import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreDescriptionBuilder extends StatefulWidget {
  final String textData;

  const MoreDescriptionBuilder({Key? key, required this.textData})
      : super(key: key);

  @override
  _MoreDescriptionState createState() => _MoreDescriptionState();
}

class _MoreDescriptionState extends State<MoreDescriptionBuilder> {
  late String firstDes;
  late String secondDes;
  bool showMore = false;

  @override
  void initState() {
    super.initState();
    if (widget.textData.length > 200) {
      firstDes = widget.textData.substring(0, 200);
      secondDes = widget.textData.substring(200, widget.textData.length);
    } else {
      firstDes = widget.textData;
      secondDes = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondDes.isEmpty
          ? Text(
              showMore ? firstDes : (firstDes + secondDes),
              style: const TextStyle(fontSize: 13.0),
            )
          : Column(
              children: [
                Text(
                  !showMore ? (firstDes + '....') : (firstDes + secondDes),
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        !showMore ? "show more" : "show less",
                        style:
                            const TextStyle(fontSize: 10.0, color: Colors.blue),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                )
              ],
            ),
    );
  }
}
