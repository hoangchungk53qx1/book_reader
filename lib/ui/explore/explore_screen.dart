import 'package:book_reader/components/body_builder.dart';
import 'package:book_reader/components/book_card_builder.dart';
import 'package:book_reader/components/loading_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/category_feed.dart';
import '../../utils/remote_connect.dart';
import '../../viewmodel/home_provider.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  ApiConnect apiConnect = ApiConnect();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder:
        (BuildContext context, HomeProvider exploreProvider, Widget? child) {
      return Scaffold(
        body: SafeArea(child: _buildBodyExpolre(exploreProvider)),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Explore",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      );
    });
  }

  _buildBodyExpolre(HomeProvider homeProvider) {
    return BodyBuilder(
      apiStatus: homeProvider.apiStatus,
      reload: () => homeProvider.getRemoteNews(),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: homeProvider.topNews.feed?.link?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          Link? link = homeProvider.topNews.feed?.link![index];
          if (index < 10) {
            return const SizedBox();
          }
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_buildHeaderLink(link), _buildSection(link)],
            ),
          );
        },
      ),
    );
  }

  _buildHeaderLink(Link? link) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            link?.title ?? "",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "See All",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
      ],
    );
  }

  _buildSection(Link? link) {
    return FutureBuilder<CategoryFeed>(
      future: apiConnect.getCategoryByUrl(link?.href ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          CategoryFeed? categoryFeed = snapshot.data;
          return SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 5.0,
              ),
              child: ListView.builder(
                itemCount: categoryFeed?.feed?.entry?.length ?? 0,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  Entry? entry = categoryFeed?.feed?.entry![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 5.0),
                    child: BookCardBuilder(
                        img: entry?.link![1].href! as String, entry: entry),
                  );
                },
              ),
            ),
          );
        } else {
          return const LoadingBuilder(isLoadingPhoto: false);
        }
      },
    );
  }
}
