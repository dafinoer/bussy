import 'package:bussy/data/model/company_search_remote_model.dart';
import 'package:bussy/data/model/coordinate_remote_model.dart';
import 'package:bussy/data/model/location_remote_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Search Model Group',
    () {
      test('Coordinate Remote Model Test Parse', () {
        final location = CoordinateRemoteModel.fromJson(_coordinateJson);
        expect(location.lat, 41.7873382568359);
        expect(location.lon, -123.051551818848);
      });
      test('Location Remote Model Test Parse', () {
        final locationDisplay = LocationRemoteModel.fromJson(_locationDisplay);
        final compactString = locationDisplay.displayAddress.join(' ');
        expect(compactString, 'James Street 68M Los Angeles, CA 22399');
      });
      test('Search Remote Model Test Parse', () {
        final companies = CompanySearchRemoteModel.fromJson(_searchResult);
        expect(companies.businessCompanies.length, 1);
      });
    },
  );
}

const _coordinateJson = {
  'latitude': 41.7873382568359,
  'longitude': -123.051551818848,
};

const _locationDisplay = {
  "display_address": ["James", "Street", "68M", "Los Angeles, CA 22399"],
};

const _searchResult = {
  'businesses': [
    {
      'alias': 'golden-boy-pizza-hamburg',
      'categories': [],
      'coordinates': {
        'latitude': 41.7873382568359,
        'longitude': -123.051551818848,
      },
      'display_phone': '(415) 982-9738',
      'distance': 4992.437696561071,
      'id': 'QPOI0dYeAl3U8iPM_IYWnA',
      'image_url':
          'https://yelp-photos.yelpcorp.com/bphoto/b0mx7p6x9Z1ivb8yzaU3dg/o.jpg',
      'is_closed': true,
      'location': {
        'display_address': [
          'James',
          'Street',
          '68M',
          'Los Angeles, CA 22399',
        ],
        'state': 'CA',
        'zip_code': '22399',
      },
      'name': 'Golden Boy Pizza',
      'phone': "+14159829738",
      'price': '\$',
      'rating': 4,
      'review_count': 903,
      'transactions': ['restaurant_reservation'],
      'url':
          'https://www.yelp.com/biz/golden-boy-pizza-hamburg?adjust_creative=XsIsNkqpLmHqfJ51zfRn3A&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=XsIsNkqpLmHqfJ51zfRn3A',
    },
  ],
  "region": {},
  "total": 6800,
};
