import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/widgets/image_input.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  _selectedImage(File file) {
    _pickedImage = file;
  }

  _submit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectedImage),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: const MaterialStatePropertyAll(0.0),
              backgroundColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.secondary,
              ),
            ),
            onPressed: _submit,
            icon: const Icon(
              Icons.add,
            ),
            label: const Text('Add'),
          )
        ],
      ),
    );
  }
}
