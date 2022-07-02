import 'package:flutter/material.dart';

class SizeDropDown extends StatefulWidget {
  const SizeDropDown(this.getSize, this.initValue, {Key? key})
      : super(key: key);
  final void Function(String? value) getSize;
  final dynamic initValue;
  @override
  State<SizeDropDown> createState() => _SizeDropDownState();
}

class _SizeDropDownState extends State<SizeDropDown> {
  @override
  Widget build(BuildContext context) {
    String value = widget.initValue ?? 'XL';
    return SizedBox(
      width: 80,
      child: DropdownButton<String>(
        alignment: Alignment.center,
        isExpanded: true,
        value: value,
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
            value = selectedVal!;
          });
        },
      ),
    );
  }
}
