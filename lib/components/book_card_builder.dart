import 'package:book_reader/components/loading_builder.dart';
import 'package:book_reader/model/category_feed.dart';
import 'package:book_reader/ui/detail/detail_book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class BookCardBuilder extends StatelessWidget {
  final String img;
  final Entry? entry;

  const BookCardBuilder({Key? key, required this.img, required this.entry})
      : super(key: key);
  static const uuid = Uuid();
  static final String imgTag = uuid.v4();
  static final String titleTag = uuid.v4();
  static final String authorTag = uuid.v4();
  @override
  Widget build(BuildContext context) => _buildBody(context);

  _buildBody(BuildContext context) {
    return SizedBox(
      width: 130.0,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        elevation: 4.0,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return DetailBookBuilder(
                  entry: entry,
                  imgTag: imgTag,
                  titleTag: titleTag,
                  authorTag: authorTag);
            }));
          },
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
            child: Hero(
              tag: imgTag,
              child: CachedNetworkImage(
                imageUrl: img,
                placeholder: (context, url) => const LoadingBuilder(
                  isLoadingPhoto: true,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/place.png',
                  fit: BoxFit.cover,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
