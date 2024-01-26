import 'package:favourite_places/screens/new_place.dart';
import 'package:favourite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/places_provider.dart';

class PlacesListScreen extends ConsumerWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placeList = ref.watch(placesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              _addPlace(context);
            },
            icon: const Icon(
              Icons.add,
              size: 18,
            ),
          )
        ],
      ),
      body:  PlacesList(
        placesList: placeList,
      ),
    );
  }

  void _addPlace(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (ctx) => const NewPlace(),
      ),
    );
  }
}
