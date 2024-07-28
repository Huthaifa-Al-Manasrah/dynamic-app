import 'package:flutter/material.dart';

import '../models/dynamic_widget.dart';
import '../providers/dynamic_provider.dart';

class DynamicRadioButton extends StatelessWidget {
  final DynamicWidget dynamicWidget;
  final DynamicProvider dynamicProvider;

  const DynamicRadioButton(
      {Key? key, required this.dynamicWidget, required this.dynamicProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dynamicWidget.nameEn ?? ''),


        ///In case radios behind each other
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceBetween,
          children: [
            ...dynamicWidget.dynamicWidgetOptions!.map((option) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    value: option.id,
                    groupValue: dynamicProvider.userInput[dynamicWidget.id],
                    onChanged: (value) {
                      dynamicProvider.updateDynamicWidgetInput(dynamicWidget.id!, value);
                    },
                  ),
                  Text(option.valueEn ?? '')
                ],
              );
            }).toList(),
          ],
        ),

        ///In case radios under each other
        // ...dynamicWidget.dynamicWidgetOptions!.map((option) {
        //   return RadioListTile(
        //     title: Text(option.valueEn ?? ''),
        //     value: option.id,
        //     groupValue: dynamicProvider.userInput[dynamicWidget.id],
        //     onChanged: (value) {
        //       dynamicProvider.updateDynamicWidgetInput(dynamicWidget.id!, value);
        //     },
        //   );
        // }).toList(),
        if (dynamicProvider.formSubmitted &&
            !dynamicProvider.isDynamicWidgetInputValid(dynamicWidget))
          const Text('Please select an option',
              style: TextStyle(color: Colors.red)),
        const SizedBox(height: 20)
      ],
    );
  }
}
