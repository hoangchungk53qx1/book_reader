import 'package:book_reader/components/loading_builder.dart';
import 'package:book_reader/components/more_description_builder.dart';
import 'package:book_reader/components/recent_card_builder.dart';
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
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<DetailProvider>(context, listen: false).getMoreAuthor(
          widget.entry?.author!.uri?.t!.replaceAll(r'\&lang=en', '') as String);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant DetailBookBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
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
              _buildHeaderDetail(detailprovider),
              const SizedBox(
                height: 5.0,
              ),
              _buildTitleDetail("Book Description "),
              _buildDivider(),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                child: MoreDescriptionBuilder(
                    textData: widget.entry?.summary?.t ?? ""),
              ),
              const SizedBox(
                height: 10.0,
              ),
              _buildTitleDetail("More From Author "),
              _buildDivider(),
              const SizedBox(
                height: 5.0,
              ),
              _buildMoreAuthor(detailprovider)
            ],
          ),
        );
      },
    );
  }

  _buildDivider() {
    return Divider(
      color: Theme.of(context).textTheme.caption!.color,
    );
  }

  _buildTitleDetail(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  _buildHeaderDetail(DetailProvider detailProvider) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: InkWell(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.entry?.link![1].href ?? "",
                    placeholder: (context, url) =>
                        const LoadingBuilder(isLoadingPhoto: true),
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/images/place.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          flex: 1,
        ),
        Expanded(
          child: Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
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
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: _buildCategoryHeader(
                      detailProvider, widget.entry as Entry),
                ),
              ],
            ),
          ),
          flex: 2,
        )
      ],
    );
  }

  _buildCategoryHeader(DetailProvider detailProvider, Entry entry) {
    if (entry.category == null) {
      return const SizedBox();
    } else {
      return SizedBox(
        height: entry.category!.length < 3 ? 55.0 : 95.0,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: entry.category!.length > 4 ? 4 : entry.category!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 210 / 100),
          itemBuilder: (BuildContext context, int index) {
            Category category = entry.category![index];
            return Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 5.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      category.label ?? "",
                      style: TextStyle(
                          fontSize: category.label!.length > 15 ? 6.0 : 10.0,
                          color: Colors.blue),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }

  _buildMoreAuthor(DetailProvider detailProvider) {
    if (detailProvider.isLoading) {
      return const LoadingBuilder(
        isLoadingPhoto: false,
      );
    } else {
      return ListView.builder(
        itemCount: detailProvider.categoryFeed.feed?.entry?.length ?? 0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          Entry? entry = detailProvider.categoryFeed.feed?.entry![index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: RecentCardBuilder(entry: entry as Entry),
          );
        },
      );
    }
  }
}
