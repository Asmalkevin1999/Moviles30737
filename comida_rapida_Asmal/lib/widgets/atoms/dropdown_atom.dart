import 'package:flutter/material.dart';

class DropdownAtom extends StatelessWidget {

  final String value;
  final List<String> items;
  final Function(String?) onChanged;

  const DropdownAtom({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      isExpanded: true,

      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),

      onChanged: onChanged,
    );
  }
}