import 'dart:io';

import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/provider/places_provider.dart';
import 'package:favourite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlace extends ConsumerStatefulWidget {
  const NewPlace({super.key});

  @override
  ConsumerState<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends ConsumerState<NewPlace> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ImageInput(
                onPickImage: (File image) {
                  _pickedImage = image;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Title"),
                validator: _validateTitle,
                controller: controller,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _save, child: const Text("Add Place"))
            ],
          ),
        ),
      ),
    );
  }

  void _save() {
    _formKey.currentState?.save();

    if (_formKey.currentState!.validate()) {
      //add to provider
      final newPlace = Place(title: controller.text, image: _pickedImage);
      ref.read(placesProvider.notifier).addPlace(newPlace);
      Navigator.of(context).pop();
    }
  }

  String? _validateTitle(String? value) {
    if (value == "") {
      return "Field can not be empty.";
    }
    return null;
  }
}
