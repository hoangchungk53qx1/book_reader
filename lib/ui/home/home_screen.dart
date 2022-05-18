import 'package:book_reader/components/body_builder.dart';
import 'package:book_reader/components/book_card_builder.dart';
import 'package:book_reader/components/category_card_builder.dart';
import 'package:book_reader/components/recent_card_builder.dart';
import 'package:book_reader/model/category_feed.dart';
import 'package:book_reader/utils/const.dart';
import 'package:book_reader/viewmodel/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => Provider.of<HomeProvider>(context, listen: false).getRemoteNews(),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer(builder:
        (BuildContext context, HomeProvider homeProvider, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            Constants.appName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: _buildBody(homeProvider),
      );
    });
  }

  Widget _buildBody(HomeProvider homeProvider) {
    return BodyBuilder(
        apiStatus: homeProvider.apiStatus,
        child: _buildBodyList(homeProvider),
        reload: () => homeProvider.getRemoteNews());
  }

  _buildBodyList(HomeProvider homeProvider) {
    return RefreshIndicator(
        child: ListView(
          children: [
            const SizedBox(height: 20.0),
            _buildSectionTitle("Popular"),
            _buildSectionNews(homeProvider),
            _buildSectionTitle("Category"),
            _buildCategorySection(homeProvider),
            _buildSectionTitle("Recently"),
            _buildRecentSection(homeProvider)
          ],
        ),
        onRefresh: () => homeProvider.getRemoteNews());
  }

  _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  _buildSectionNews(HomeProvider homeProvider) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: homeProvider.topNews.feed?.entry?.length ?? 0,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        itemBuilder: (context, index) {
          Entry? entry = homeProvider.topNews.feed?.entry![index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
            child: BookCardBuilder(
              img: entry?.link![1].href as String,
              entry: entry,
            ),
          );
        },
      ),
    );
  }

  _buildCategorySection(HomeProvider homeProvider) {
    return SizedBox(
      height: 50.0,
      child: Center(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          itemCount: homeProvider.topNews.feed?.link?.length ?? 0,
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index < 10) {
              return const SizedBox();
            }
            Link? link = homeProvider.topNews.feed?.link![index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              child: CategoryCardBuilder(
                categoryTitle: '${link?.title}',
              ),
            );
          },
        ),
      ),
    );
  }

  _buildRecentSection(HomeProvider homeProvider) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        shrinkWrap: true,
        itemCount: homeProvider.recentNews.feed?.entry?.length ?? 0,
        itemBuilder: (context, index) {
          Entry? entry = homeProvider.recentNews.feed?.entry![index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            child: RecentCardBuilder(
              entry: entry,
            ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
