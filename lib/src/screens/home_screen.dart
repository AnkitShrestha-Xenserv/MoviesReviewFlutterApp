import 'package:flutter/material.dart';
import 'package:movies_app/src/screens/components/build_sliding_list.dart';
import '../bloc/movies_provider.dart';
import '../models/item_model.dart';
import 'components/build_featured_list.dart';

class HomeScreen extends StatelessWidget {
  Widget build(context) {
    final _bloc = MoviesProvider.of(context);
    return StreamBuilder(
        stream: _bloc.movies,
        builder: (context, AsyncSnapshot<List<ItemModel>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 15),
                BuildSlidingList(snapshot),
                SizedBox(height: 15),
                BuildFeaturedList(snapshot: snapshot, title: 'Top Featured'),
                BuildFeaturedList(snapshot: snapshot, title: 'Recently Added'),
              ],
            ),
          );
        });
  }
}
