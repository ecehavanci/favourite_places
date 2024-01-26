import 'package:favourite_places/models/place.dart';
import 'package:riverpod/riverpod.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super([]); //initialize first state here

  void addPlace(Place place) { //add place to list
    state = [...state, place]; //spread old list and add new place
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<Place>>(
  (ref) => PlacesNotifier(),
);
