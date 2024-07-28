import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dynamic_provider.dart';

class DynamicFormScreen extends StatelessWidget {
  const DynamicFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamicProvider = Provider.of<DynamicProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Form')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
                itemCount: dynamicProvider.dynamicWidgets.length,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemBuilder: (context, index) {
                  final attribute = dynamicProvider.dynamicWidgets[index];
                  return dynamicProvider.buildDynamicWidget(
                      attribute);
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(

                ///there are two choices:
                ///one: the button will be able to clickable when the whole form filled(**the required fields)
                ///but you need to appear (*) on the required filed
                ///by this code:
                //onPressed: dynamicProvider.isFormValid() ? () {
                //log(dynamicProvider.userInput.toString());} : null,

                ///two: when click on the button check whole data filled
                ///by this code:
                //onPressed:(){
                // dynamicProvider.submitForm();
                // if(dynamicProvider.isFormValid()){
                // dynamicProvider.submitForm();
                // log(dynamicProvider.userInput.toString());
                // }
                //}

                onPressed: () {
                        dynamicProvider.submitForm();
                        if (dynamicProvider.isDynamicWidgetValuesValid()) {
                          log(dynamicProvider.userInput.toString());
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('fill all required data'), backgroundColor: Colors.red,));
                        }
                      },
                child: const Text('Submit')),
          )
        ],
      ),
    );
  }

  // Widget buildInputWidgetForAttribute(
  //     DynamicWidget dynamicWidget, DynamicProvider dynamicProvider) {
  //   switch (dynamicWidget.viewTypeId) {
  //     case 1:
  //     case 2:
  //     case 3:
  //     case 4:
  //       return DynamicTextField(
  //           dynamicWidget: dynamicWidget, dynamicProvider: dynamicProvider);
  //     case 5:
  //       return DynamicRadioButton(
  //           dynamicWidget: dynamicWidget, dynamicProvider: dynamicProvider);
  //     case 6:
  //     case 7:
  //       return DynamicCheckbox(
  //           dynamicWidget: dynamicWidget, dynamicProvider: dynamicProvider);
  //     default:
  //       return const SizedBox.shrink();
  //   }
  // }
}
