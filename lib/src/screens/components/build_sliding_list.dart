import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../models/item_model.dart';

class BuildSlidingList extends StatelessWidget {
  final snapshot;

  BuildSlidingList(snapshot) : this.snapshot = snapshot;

  Widget build(context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
      ),
      items: List.generate(
        snapshot.data.length,
        (index) => buildImage(snapshot.data[index]),
      ),
    );
  }

  Widget buildImage(ItemModel data) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.network(
              data.imageUrl,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
            ),
          ),
          Positioned(
            width: 200,
            bottom: 5,
            left: 5,
            child: Text(
              '${data.displayTitle}',
              style: TextStyle(
                  fontSize: (data.displayTitle.length < 25) ? 18 : 14,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
