import 'package:flutter/material.dart';

class DataInputField extends StatelessWidget {
  const DataInputField(
      {Key? key, required this.onChanged, required this.title, this.controller})
      : super(key: key);
  final String title;
  final Function(String) onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(
          labelText: title,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      onChanged: onChanged,
      controller: controller,
    );
  }
}
