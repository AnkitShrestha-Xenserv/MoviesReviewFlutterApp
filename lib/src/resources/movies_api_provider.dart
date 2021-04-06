import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:movies_app/src/models/item_model.dart';

String _key = '&api-key=u6lrCtdE3FDQ7S2aCQw5Ac6xmNlgaqyO';
String _rootTitle =
    'https://api.nytimes.com/svc/movies/v2/reviews/search.json?query=';

class MoviesApiProvider {
  Client client = Client();
  final movies = List<ItemModel>();

  Future<List<ItemModel>> fetchFillerData() async {
    String bigMovies = 'big&opening-date=2017-02-05:2021-02-05&';
    final response = await client.get('$_rootTitle$bigMovies$_key');
    print('$_rootTitle$bigMovies$_key');
    if (response.statusCode == 200) {
      final parsedJson = json.decode(response.body);
      for (var json in parsedJson['results']) {
        movies.add(ItemModel.fromJson(json));
      }
      print('Response Success');

      return movies;
    } else {
      print('Response Error');
      return [];
    }
  }
}
