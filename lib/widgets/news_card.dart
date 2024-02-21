import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String headline;
  final String headlineImage;
  const CustomCard(
      {Key? key, required this.headline, required this.headlineImage})
      : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    Widget _buildImageWidget() {
      if (widget.headlineImage != null &&
          Uri.parse(widget.headlineImage).isAbsolute) {
        return Image.network(
          widget.headlineImage,
          fit: BoxFit.fitHeight,
          width: double.infinity,
          scale: 1.0,
          height: 250,
          color: const Color.fromRGBO(255, 255, 255, 0.5),
          colorBlendMode: BlendMode.modulate,
        );
      } else {
        return Image.asset(
          'assets/images/stock_image.jpg',
          fit: BoxFit.fitHeight,
          width: double.infinity,
          scale: 1.0,
          height: 250,
          color: const Color.fromRGBO(255, 255, 255, 0.5),
          colorBlendMode: BlendMode.modulate,
        );
      }
    }

    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Stack(
                children: [
                  _buildImageWidget(),
                  Positioned(
                    top: 80,
                    left: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 80,
                      child: Text(
                        widget.headline,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.clip,
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
