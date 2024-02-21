import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget {
  final String headline;
  final String headlineImage;
  const CustomCard(
      {super.key, required this.headline, required this.headlineImage});

  @override
  Widget build(BuildContext context) {
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
              child: Stack(children: [
                // If articleImage is not null, load the provided image
                if (headlineImage.isNotEmpty)
                  Image.network('$headlineImage',
                      fit: BoxFit.fitHeight,
                      width: double.infinity,
                      height: 250,
                      color: const Color.fromRGBO(255, 255, 255, 0.5),
                      colorBlendMode: BlendMode.modulate),

                Positioned(
                  top: 80,
                  left: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: Text(
                      maxLines: 3,
                      headline,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.clip,
                      softWrap: true,
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
