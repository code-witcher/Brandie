import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget(
    this.saveImage, {
    Key? key,
  }) : super(key: key);
  final Future<void> Function(File image) saveImage;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  File? imagePath;
  Future<void> _pickImage() async {
    final pick = ImagePicker();
    final image = await pick.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if (image == null) return;

    await widget.saveImage(File(image.path));

    setState(() {
      imagePath = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 8),
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              // color: Colors.tealAccent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: imagePath == null
                ? const Text('No Image picked yet')
                : Image.file(imagePath!),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: Icon(Icons.camera),
          label: Text('Pick image'),
        ),
      ],
    );
  }
}
