class Endpoints {
  static const String baseUrl = "https://api.yelp.com/v3";

  // Business
  static const String search = '/businesses/search';
  static const String businessById = '/businesses';

  //reviews
  static const String reviews = '/businesses/{businessID}/reviews';
}
