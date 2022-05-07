import 'package:book_reader/components/loading_builder.dart';
import 'package:book_reader/model/CategoryFeed.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class RecentCardBuilder extends StatelessWidget {
  final Entry? entry;

  RecentCardBuilder({Key? key, required this.entry
  }) : super(key: key);
  static final uuid = Uuid();
  final String imgTag = uuid.v4();
  final String titleTag = uuid.v4();
  final String authorTag = uuid.v4();

  @override
  Widget build(BuildContext context) => _buildBody(context);

  _buildBody(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: 150.0,
        child: Row(
          children: [
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              elevation: 10,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Hero(
                  tag: imgTag,
                  child: CachedNetworkImage(
                    imageUrl: '${entry?.link![1].href}',
                    placeholder: (context, url) =>
                    const LoadingBuilder(isLoadingPhoto: true,
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset(
                          'assets/images/place.png',
                          fit: BoxFit.cover,
                          height: 150.0,
                          width: 150.0,),
                    fit: BoxFit.cover,
                    width: 150.0,
                    height: 150.0,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20.0),
            Flexible(child: Flexible(
              child: Column(
                children: [
                  Hero(tag: titleTag, child: Material(
                    type: MaterialType.transparency,
                    child: Text('${entry?.title?.t}', maxLines: 2,),
                  ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

}