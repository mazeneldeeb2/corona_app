import 'package:flutter/material.dart';

import 'constants.dart';

class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({super.key});

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  int? currentValue = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: kHeaderColorBegin),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          )
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: DropdownButtonFormField(
        focusColor: kHeaderColorBegin,
        borderRadius: BorderRadius.circular(15),
        value: currentValue,
        items: const [
          DropdownMenuItem(
            value: 1,
            child: Text("France"),
          ),
        ],
        onChanged: (value) {
          setState(() {
            currentValue = value;
          });
        },
      ),
    );
  }
}
