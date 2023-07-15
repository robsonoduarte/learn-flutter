import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  const ImageInput(this.onSelectImage, {super.key});
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  _takePicture() async {
    final picker = ImagePicker();
    var xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      _storedImage = File(xFile!.path);
    });

    //widget.onSelectImage();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.green,
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : const Text('No Image'),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            icon: Icon(
              Icons.camera,
              color: Theme.of(context).primaryColor,
            ),
            label: Text(
              'Take Picture',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
