import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CustomNewsTile extends StatelessWidget {
  final String authorName;
  final String newsTitle;
  final String newsContent;
  final String publishDate;
  final String articleImage;
  const CustomNewsTile(
      {required this.authorName,
      required this.newsTitle,
      required this.newsContent,
      required this.publishDate,
      required this.articleImage});

  @override
  Widget build(BuildContext context) {
    DateTime formattedpublishDate = DateTime.parse(publishDate);
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(formattedpublishDate);

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // If articleImage is not empty or null, load the provided image
                if (articleImage != null && articleImage.isNotEmpty)
                  Image.network(
                    articleImage,
                    height: 135,
                    width: 115,
                    scale: 1.0,
                    fit: BoxFit.cover,
                  )
                else
                  Image.asset(
                    'assets/images/stock_image.jpg',
                    height: 135,
                    width: 115,
                    scale: 1.0,
                    fit: BoxFit.cover,
                  ),

                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(height: 5),
                      Text(
                        authorName,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        formattedDate,
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        newsTitle,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        newsContent,
                        maxLines: 2,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
