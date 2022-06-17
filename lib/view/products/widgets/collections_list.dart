import 'package:brandie/view/products/widgets/collection_item.dart';
import 'package:flutter/material.dart';

class CollectionList extends StatelessWidget {
  const CollectionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, i) => const CollectionItem(),
      itemCount: 10,
    );
  }
}
