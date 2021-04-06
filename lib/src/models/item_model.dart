import 'dart:convert';

class ItemModel {
  final String displayTitle;
  final String mpaaRating;
  final int criticsPick;
  final String byline;
  final String headline;
  final String summaryShort;
  final String publicationDate;
  final String dateUpdated;
  final String articleLink;
  final String imageUrl;

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : displayTitle = parsedJson['display_title'],
        mpaaRating = parsedJson['mpaa_rating'],
        criticsPick = parsedJson['critics_pick'],
        byline = parsedJson['byline'],
        headline = parsedJson['headline'],
        summaryShort = parsedJson['summary_short'],
        publicationDate = parsedJson['publication_date'],
        dateUpdated = parsedJson['date_updated'],
        articleLink = parsedJson['link']['url'],
        imageUrl = parsedJson['multimedia']['src'];
}
