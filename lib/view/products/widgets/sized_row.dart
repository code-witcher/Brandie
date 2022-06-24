import 'package:brandie/models/constants.dart';
import 'package:flutter/material.dart';

class SizeRow extends StatelessWidget {
  const SizeRow({Key? key, required this.size}) : super(key: key);
  final String size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizeCard(
            sizeLetter: 'S',
            size: size,
          ),
          SizeCard(
            sizeLetter: 'M',
            size: size,
          ),
          SizeCard(
            sizeLetter: 'L',
            size: size,
          ),
          SizeCard(
            sizeLetter: 'XL',
            size: size,
          ),
        ],
      ),
    );
  }
}

class SizeCard extends StatelessWidget {
  const SizeCard({Key? key, required this.sizeLetter, required this.size})
      : super(key: key);
  final String sizeLetter;
  final String size;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: size == sizeLetter ? Theme.of(context).primaryColor : null,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      shape: StadiumBorder(
        side: BorderSide(color: Theme.of(context).primaryColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16),
        child: Text(
          sizeLetter,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: size == sizeLetter
                    ? kLightColor
                    : Theme.of(context).primaryColor,
              ),
        ),
      ),
    );
  }
}
