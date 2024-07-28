import 'package:flutter/material.dart';

import '../models/dynamic_widget.dart';
import '../providers/dynamic_provider.dart';

class DynamicTextField extends StatelessWidget {
  final DynamicWidget dynamicWidget;
  final DynamicProvider dynamicProvider;

  const DynamicTextField(
      {Key? key, required this.dynamicWidget, required this.dynamicProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          autovalidateMode: dynamicProvider.formSubmitted
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          decoration: InputDecoration(labelText: dynamicWidget.nameEn ?? '', alignLabelWithHint: true, isDense: true, border: const OutlineInputBorder()),
          maxLines: dynamicWidget.viewTypeId == 2 ? 5 : 1,
          keyboardType: dynamicWidget.viewTypeId == 4
              ? TextInputType.number
              : dynamicWidget.viewTypeId == 3 ? TextInputType.emailAddress : TextInputType.text,
          onChanged: (value) => dynamicProvider.updateDynamicWidgetInput(
              dynamicWidget.id!, value),
          validator: (_) => dynamicProvider.formSubmitted &&
                  !dynamicProvider.isDynamicWidgetInputValid(dynamicWidget)
              ? 'Required field'
              : null,
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
