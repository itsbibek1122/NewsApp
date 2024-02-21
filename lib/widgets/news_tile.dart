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
      {super.key,
      required this.authorName,
      required this.newsTitle,
      required this.newsContent,
      required this.publishDate,
      required this.articleImage});

  @override
  Widget build(BuildContext context) {
    DateTime formattedpublishDate = DateTime.parse(publishDate);
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(formattedpublishDate);

    return Card.outlined(
      color: Colors.white,
      // Define the shape of the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      // Define how the card's content should be clipped
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // Define the child widget of the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Add padding around the row widget
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Add an image widget to display an image

                // If articleImage is not null, load the provided image
                if (articleImage.isNotEmpty)
                  Image.network(
                    '$articleImage',
                    height: 135,
                    width: 115,
                    fit: BoxFit.cover,
                  ),

                // Add some spacing between the image and the text
                SizedBox(width: 20),
                // Add an expanded widget to take up the remaining horizontal space
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Add some spacing between the top of the card and the title
                      Container(height: 5),
                      // Add a title widget
                      Text(
                        authorName,
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        formattedDate,
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                            overflow: TextOverflow.ellipsis),
                      ),

                      Text(
                        newsTitle,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Text(
                        newsContent,
                        maxLines: 2,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis, fontSize: 12.0),
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
