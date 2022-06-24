import 'package:flutter/material.dart';

class SizeDropDown extends StatefulWidget {
  const SizeDropDown(this.getSize, {Key? key}) : super(key: key);
  final void Function(String? value) getSize;
  @override
  State<SizeDropDown> createState() => _SizeDropDownState();
}

class _SizeDropDownState extends State<SizeDropDown> {
  String _value = 'XL';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: DropdownButton<String>(
        alignment: Alignment.center,
        isExpanded: true,
        value: _value,
        items: const [
          DropdownMenuItem(
            value: 'XL',
            child: Text('XL'),
          ),
          DropdownMenuItem(
            value: 'L',
            child: Text('L'),
          ),
          DropdownMenuItem(
            value: 'M',
            child: Text('M'),
          ),
          DropdownMenuItem(
            value: 'S',
            child: Text('S'),
          ),
        ],
        onChanged: (selectedVal) {
          widget.getSize(selectedVal);

          setState(() {
            _value = selectedVal!;
          });
        },
      ),
    );
  }
}
