import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/Models/restuarant_data_model.dart';

class RestaurantProvider with ChangeNotifier {
  List<Restaurant> _restaurants = [];
  String _searchQuery = '';

  List<Restaurant> get restaurants => _restaurants;

  String get searchQuery => _searchQuery;

  List<Restaurant> get filteredRestaurants {
    if (_searchQuery.isEmpty) {
      return _restaurants;
    }

    return _restaurants
        .where((restaurant) =>
            restaurant.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  void setRestaurants(List<Restaurant> restaurants) {
    _restaurants = restaurants;
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    // print("This is searchqueryy: $searchQuery");
    notifyListeners();
  }

  // Load restaurants from JSON string
  Future<void> loadRestaurantsFromJson(String filePath) async {
    final String jsonString = await rootBundle.loadString(filePath);
    final List<dynamic> jsonData = json.decode(jsonString);
    _restaurants = jsonData.map((data) => Restaurant.fromJson(data)).toList();
    notifyListeners();
  }
}
