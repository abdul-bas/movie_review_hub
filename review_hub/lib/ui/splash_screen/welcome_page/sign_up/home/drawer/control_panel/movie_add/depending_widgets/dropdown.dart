// ignore: unnecessary_import
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/main.dart';
import 'package:review_hub/widget/text_widget.dart';

// ignore: must_be_immutable
class DropdownButtonFormFieldWidget extends StatelessWidget {
  DropdownButtonFormFieldWidget(
      {super.key,
      required this.items,
      required this.catogary,
      required this.selectedItem,
      this.paddingH,
      this.paddingV});
  final List<String> items;
  final String catogary;
 ValueNotifier < String> selectedItem;
  final double? paddingH;
  final double? paddingV;
  @override
  Widget build(BuildContext context) {
    final mdqHeight = MediaQuery.of(context).size.height;
    final mdqWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: paddingH != null ? mdqWidth * paddingH! : 0,
          vertical: paddingV != null ? mdqHeight * paddingV! : 0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.category, color: textWeight),
          labelText: catogary,
          labelStyle: TextStyle(
              fontSize: 16, color: textWeight, fontWeight: FontWeight.w900),
          filled: true,
          // ignore: deprecated_member_use
          fillColor: Colors.grey.withOpacity(0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:  BorderSide(color: opendcityWhite, width: 2),
          ),
        ),
        isExpanded: true,
        // ignore: deprecated_member_use
        dropdownColor:isDark.value? Colors.grey[900]:Colors.grey.withOpacity(0.5),
        value: selectedItem.value,
        style: TextStyle(
          fontSize: 16,
          color: textWeight,
          fontWeight: FontWeight.w600,
        ),
        items: items.map((String language) {
          return DropdownMenuItem(
            // ignore: sort_child_properties_last
            child: TextWidget(text: language, size: 14, color: textWeight),
            value: language,
          );
        }).toList(),
        onChanged: (String? newValue) {
          selectedItem.value = newValue!;
          // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
          selectedItem.notifyListeners();
         
        },
      ),
    );
  }
}
