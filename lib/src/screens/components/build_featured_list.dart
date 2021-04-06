import 'package:flutter/material.dart';
import '../../models/item_model.dart';

class BuildFeaturedList extends StatelessWidget {
  BuildFeaturedList({@required this.snapshot, @required this.title});
  final snapshot;
  final String title;

  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(60, 60, 60, 0.9)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 38,
            child: Text('$title',
                style: TextStyle(
                  color: Color.fromRGBO(255, 247, 0, 1),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                children: List.generate(
                  snapshot.data.length,
                  (index) => buildTab(snapshot.data[index]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTab(ItemModel data) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(20, 20, 20, 0.9),
          borderRadius: BorderRadius.circular(10)),
      height: 225,
      width: 160,
      margin: EdgeInsets.only(right: 5, top: 10),
      child: buildIndividualTab(data),
    );
  }

  Widget buildIndividualTab(ItemModel data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
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
        ),
        SizedBox(height: 10),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              data.mpaaRating != ''
                  ? 'Rating: ${data.mpaaRating}'
                  : 'Rating: Not Rated',
              style: TextStyle(
                color: Color.fromRGBO(199, 199, 199, 0.7),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              '${data.displayTitle}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
