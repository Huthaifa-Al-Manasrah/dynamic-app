import 'package:flutter/material.dart';

import '../models/dynamic_widget.dart';
import '../providers/dynamic_provider.dart';

class DynamicCheckbox extends StatelessWidget {
  final DynamicWidget dynamicWidget;
  final DynamicProvider dynamicProvider;

  const DynamicCheckbox(
      {Key? key, required this.dynamicWidget, required this.dynamicProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dynamicWidget.nameEn ?? ''),

        ///In case the checkboxes behind each other
        Wrap(children: [
          ...dynamicWidget.dynamicWidgetOptions!.map((option) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: dynamicProvider.userInput[dynamicWidget.id]
                          ?.contains(option.id) ??
                      false,
                  onChanged: (value) {
                    List<int> selectedOptions = List.from(
                        dynamicProvider.userInput[dynamicWidget.id] ?? []);
                    if (value ?? false) {
                      selectedOptions.add(option.id!);
                    } else {
                      selectedOptions.remove(option.id);
                    }
                    dynamicProvider.updateDynamicWidgetInput(
                        dynamicWidget.id!, selectedOptions);
                  },
                ),
                Text(option.valueEn ?? ''),
              ],
            );
          }).toList()
        ]),

        ///In case the checkboxes under each other remove this comment.
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     ...dynamicWidget.dynamicWidgetOptions!.map((option) {
        //       return CheckboxListTile(
        //         title: Text(option.valueEn ?? ''),
        //         contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        //         dense: true,
        //         controlAffinity: ListTileControlAffinity.leading,
        //         value: dynamicProvider.userInput[dynamicWidget.id]
        //                 ?.contains(option.id) ??
        //             false,
        //         onChanged: (value) {
        //           List<int> selectedOptions = List.from(
        //               dynamicProvider.userInput[dynamicWidget.id] ?? []);
        //           if (value ?? false) {
        //             selectedOptions.add(option.id!);
        //           } else {
        //             selectedOptions.remove(option.id);
        //           }
        //           dynamicProvider.updateDynamicWidgetInput(
        //               dynamicWidget.id!, selectedOptions);
        //         },
        //       );
        //     }).toList(),
        //   ],
        // ),
        if (dynamicProvider.formSubmitted &&
            !dynamicProvider.isDynamicWidgetInputValid(dynamicWidget))
          const Text('Please select at least one option',
              style: TextStyle(color: Colors.red)),

        const SizedBox(height: 20)
      ],
    );
  }
}
