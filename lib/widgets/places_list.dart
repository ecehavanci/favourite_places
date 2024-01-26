import 'package:favourite_places/provider/places_provider.dart';
import 'package:favourite_places/screens/place_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/place.dart';

class PlacesList extends StatelessWidget {
  final List<Place> placesList;

  const PlacesList({super.key, required this.placesList});

  @override
  Widget build(BuildContext context) {
    if (placesList.isEmpty) {
      return const Center(
        child: Text("Empty list."),
      );
    }
    return ListView.builder(
      itemCount: placesList.length,
      itemBuilder: (ctx, index) => ListTile(
        onTap: () => _placeDescriptionRoute(context, placesList[index]),
        title: Text(placesList[index].title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      ),
    );
  }

  void _placeDescriptionRoute(BuildContext context, Place place) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlaceDetailsScreen(place: place),
      ),
    );
  }
}
