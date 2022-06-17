import 'dart:io';

import 'package:flutter/material.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: FileImage(File('')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Men'),
          ),
          Container(
            height: 7,
            width: 7,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(500),
            ),
          ),
        ],
      ),
    );
  }
}
