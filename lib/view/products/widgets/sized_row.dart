import 'package:flutter/material.dart';

class SizedRow extends StatelessWidget {
  const SizedRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizeCard(
            sizeLetter: 'S',
          ),
          SizeCard(
            sizeLetter: 'M',
          ),
          SizeCard(
            sizeLetter: 'L',
          ),
          SizeCard(
            sizeLetter: 'XL',
          ),
        ],
      ),
    );
  }
}

class SizeCard extends StatelessWidget {
  const SizeCard({Key? key, required this.sizeLetter}) : super(key: key);
  final String sizeLetter;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      shape: StadiumBorder(
        side: BorderSide(color: Theme.of(context).primaryColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16),
        child: Text(
          sizeLetter,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
      ),
    );
  }
}
