import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/providers/restuarant_provider.dart';

class RestuarantListWidget extends StatefulWidget {
  const RestuarantListWidget({super.key});

  @override
  State<RestuarantListWidget> createState() => _RestuarantListWidgetState();
}

class _RestuarantListWidgetState extends State<RestuarantListWidget> {
  final TextEditingController _searchData = TextEditingController();
  final FocusNode _searchBarFocusNode = FocusNode();

  @override
  void dispose() {
    _searchData.dispose();
    _searchBarFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final restuarantProvider = Provider.of<RestaurantProvider>(context);
    restuarantProvider.loadRestaurantsFromJson("assets/restaurants.json");

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            textInputAction: TextInputAction.done,
            onSubmitted: (value) {
              restuarantProvider.updateSearchQuery(value);
            },
            // onChanged: (value) {
            //   // print("value is changing hello hello ");

            //   setState(() {});
            // },
            controller: _searchData,
            decoration: InputDecoration(
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.0),
              ),
              hintText: "Search restuarant By Name",
              suffixIcon: IconButton(
                onPressed: () {
                  restuarantProvider.updateSearchQuery(_searchData.text);
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Consumer<RestaurantProvider>(
            builder: (context, provider, child) {
              final filteredRestaurants = provider.filteredRestaurants;

              if (filteredRestaurants.isEmpty) {
                return const Center(child: Text('No results found'));
              }

              return ListView.builder(
                itemCount: filteredRestaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = filteredRestaurants[index];
                  return ListTile(
                    title: Text(restaurant.name),
                    subtitle: Text(restaurant.cuisine),
                    trailing: Text('ID: ${restaurant.id}'),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
