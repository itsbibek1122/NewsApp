import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';

class NewsGrid extends StatefulWidget {
  const NewsGrid({super.key});

  @override
  State<NewsGrid> createState() => _NewsGridState();
}

class _NewsGridState extends State<NewsGrid> {
  final colors = [
    Colors.red,
    Colors.redAccent,
    Colors.deepOrange,
    Colors.orange,
    Colors.amberAccent,
    Colors.yellow,
    Colors.lightGreenAccent,
    Colors.lightGreen,
    Colors.green,
    Colors.greenAccent,
    Colors.lightBlueAccent,
    Colors.blue,
  ];

  final heights = [
    100,
    120,
    140,
    160,
    180,
    200,
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverDynamicHeightGridView(
          itemCount: 32,
          crossAxisCount: 2,
          builder: (ctx, index) {
            colors.shuffle();
            heights.shuffle();
            return Column(
              children: [
                Container(
                  height: heights.first.toDouble(),
                  color: colors.first,
                ),
                Card(
                  child: Text('Heading goes here'),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
