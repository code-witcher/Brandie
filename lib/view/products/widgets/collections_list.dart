import 'package:brandie/view/products/widgets/collection_item.dart';
import 'package:flutter/material.dart';

class CollectionList extends StatefulWidget {
  const CollectionList({Key? key}) : super(key: key);

  @override
  State<CollectionList> createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, i) => InkWell(
        onTap: () {
          setState(() {
            currentIndex = i;
          });
        },
        child: CollectionItem(
          index: i,
          currentIndex: currentIndex,
        ),
      ),
      itemCount: 10,
    );
  }
}
