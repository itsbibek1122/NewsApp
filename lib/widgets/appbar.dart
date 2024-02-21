import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/api_call.dart';
import 'package:news_app/models/news_modal.dart';
import 'package:news_app/widgets/news_card.dart';

import 'package:news_app/widgets/news_tile.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late Future<NewsModal> _newsFuture;

  @override
  void initState() {
    super.initState();
    _newsFuture = getNewsApi(); // Fetch news data when the screen loads
  }

  @override
  Widget build(BuildContext context) {
    // Get current date
    DateTime now = DateTime.now();

    // Format date
    String formattedDate = DateFormat('EEEE, MMMM d, y').format(now);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: Image.asset(
                  'assets/images/nyc_log.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  formattedDate.toString(),
                  style: const TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ],
        ),
        // Just some content is enough to have a unique object to scroll.
        SliverToBoxAdapter(
          child: FutureBuilder<NewsModal>(
            future: _newsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError || snapshot.data == null) {
                print('Error: ${snapshot.error}');
                return Center(child: Text('Error loading data'));
              } else {
                final newsModal = snapshot.data as NewsModal;
                if (newsModal.articles != null) {
                  print('The data from UI file ${_newsFuture.toString()}');
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 12.0, 0.0, 8.0),
                        child: Text(
                          'Top Headlines',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 258,
                        child: InfiniteCarousel.builder(
                          itemCount: snapshot.data!
                              .getLatestArticles()
                              .length, // Set to the number of cards you have
                          itemExtent: 350,
                          center: true,
                          anchor: 0.0,
                          velocityFactor: 0.2,
                          onIndexChanged: (index) {},
                          axisDirection: Axis.horizontal,
                          loop: false, // Set to false to display only one card
                          itemBuilder: (context, itemIndex, realIndex) {
                            final latestArticles =
                                snapshot.data!.getLatestArticles();
                            final article = latestArticles[itemIndex];
                            return CustomCard(
                              headline: article.title ?? '',
                              headlineImage: article.urlToImage ?? '',
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Latest News",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.articles!.length,
                        itemBuilder: (context, index) {
                          return CustomNewsTile(
                            authorName:
                                snapshot.data!.articles![index].author ?? '',
                            newsTitle:
                                snapshot.data!.articles![index].title ?? '',
                            newsContent:
                                snapshot.data!.articles![index].description ??
                                    '',
                            publishDate:
                                snapshot.data!.articles![index].publishedAt ??
                                    '',
                            articleImage:
                                snapshot.data!.articles![index].urlToImage ??
                                    '',
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text('No data available'),
                  );
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
