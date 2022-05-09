import 'package:book_reader/components/loading_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '../../model/category_feed.dart';
import '../../viewmodel/detail_provider.dart';

class DetailBookBuilder extends StatefulWidget {
  final Entry? entry;
  final String imgTag;
  final String titleTag;
  final String authorTag;

  const DetailBookBuilder(
      {Key? key,
      required this.entry,
      required this.imgTag,
      required this.titleTag,
      required this.authorTag})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailBookState();
}

class _DetailBookState extends State<DetailBookBuilder> {
  @override
  void initState() {
    super.initState();
    // SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
    //   Provider.of(context,listen: false)
    // });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant DetailBookBuilder oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (BuildContext context, DetailProvider detailprovider, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                widget.entry?.title?.t ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
            ],
          ),
          body: ListView(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              _buildHeaderDetail()
            ],
          ),
        );
      },
    );
  }

  _buildHeaderDetail() {
    return Row(
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: widget.entry?.link![1].href ?? "",
            placeholder: (context, url) =>
                const LoadingBuilder(isLoadingPhoto: true),
            errorWidget: (context, url, error) =>
                Image.asset('assets/images/place.png'),
            fit: BoxFit.cover,
            height: 150.0,
            width: 150.0,
          ),
          flex: 1,
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Flexible(
            child: Column(
              children: [
                const SizedBox(
                  height: 5.0,
                ),
                Hero(
                  tag: widget.titleTag,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(widget.entry?.title?.t ?? ""),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Hero(
                    tag: widget.authorTag,
                    child: Text(
                      widget.entry?.author?.name?.t ?? "",
                      style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
          flex: 2,
        )
      ],
    );
  }
}
