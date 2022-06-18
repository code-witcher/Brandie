import 'dart:io';
import 'dart:math';

import 'package:brandie/models/constants.dart';
import 'package:flutter/material.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem(
      {Key? key, required this.index, required this.currentIndex})
      : super(key: key);
  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: kColorsList[Random().nextInt(4)],
            radius: 40,
            backgroundImage: FileImage(File('')),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Men'),
          ),
          if (index == currentIndex)
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
