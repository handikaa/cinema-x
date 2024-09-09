import '../../../misc/method.dart';
import 'package:flutter/material.dart';

import '../../../widgets/selected_item.dart';

List<Widget> selectItem<T>({
  required String title,
  required List<T> options,
  required T? selectedItem,
  String Function(T object)? converter,
  bool Function(T object)? isOptionEnable,
  required void Function(T object) onTap,
}) =>
    [
      Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      verticalSpace(20),
      SizedBox(
        height: 40,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: options
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(
                        left: e == options.first ? 24 : 0,
                        right: e == options.last ? 10 : 0),
                    child: SeletedItem(
                      text: converter != null ? converter(e) : e.toString(),
                      isSelect: e == selectedItem,
                      isAvailable: isOptionEnable?.call(e) ?? true,
                      onTap: () => onTap(e),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    ];
