class SearchModel {
  final double lat;
  final double lon;
  final String? searchText;
  final bool isOpenNow;
  final List<String> prices;
  final List<String> categories;

  SearchModel({
    required this.lat,
    required this.lon,
    this.searchText,
    this.isOpenNow = true,
    this.prices = const [],
    this.categories = const [],
  });
}
