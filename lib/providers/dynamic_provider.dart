import 'package:dynamic_layouts/data/fake_data.dart';
import 'package:dynamic_layouts/models/dynamic_form.dart';
import 'package:dynamic_layouts/models/dynamic_step.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/dynamic_widget.dart';
import '../widgets/dynamic_checkbox.dart';
import '../widgets/dynamic_radio_button.dart';
import '../widgets/dynamic_text_field.dart';

class DynamicProvider extends ChangeNotifier {


  List<DynamicForm> dynamicFormsList = FakeDate().dynamicFormsList;

  int _currentFormIndex = 0;
  List<bool> _formCompletionStatus = [];

  List<DynamicWidget> attributesForCurrentForm() {
    return dynamicFormsList[_currentFormIndex].dynamicWidgets ?? [];
  }

  bool isFormCompleted(int formIndex) {
    if (formIndex >= 0 && formIndex < _formCompletionStatus.length) {
      return _formCompletionStatus[formIndex];
    }
    return false;
  }

  bool isCurrentFormValid() {
    final attributes = attributesForCurrentForm();
    return attributes.every((attribute) => isDynamicWidgetInputValid(attribute));
  }

  void moveToNextForm() {
    if (isCurrentFormValid()) {
      _formCompletionStatus[_currentFormIndex] = true;
      _currentFormIndex++;
      notifyListeners();
    }
  }

  void completeCurrentForm() {
    if (isCurrentFormValid()) {
      _formCompletionStatus[_currentFormIndex] = true;
      notifyListeners();
    }
  }


  ///first step load steps Ids --------------------
  List<DynamicStep> allDynamicStepsListWithoutForms = [];

  Future<void> loadAllDynamicStepsWithoutForms() async {
    await Future.delayed(const Duration(seconds: 2), () {
     allDynamicStepsListWithoutForms = FakeDate().dynamicStepsList;
     notifyListeners();
    });
  }
  ///----------------------------------------------


  ///second step load steps data -------------------



  List<DynamicStep> dynamicStepsList = [];

  Future<void> loadDynamicStepForms(int stepId) async {
    await Future.delayed(const Duration(seconds: 1), () {
      for(DynamicStep step in allDynamicStepsListWithoutForms){
        if(step.id == stepId){
          step.dynamicForms = [
            DynamicForm(
                nameEn: 'form ${step.id}',
                nameAr: 'form ${step.id}',
                id: (1 + step.id!.toInt()),
                dynamicWidgets: [
                  DynamicWidget(
                      id: (1 + step.id!.toInt()),
                      viewTypeId: 1,
                      nameEn: "Full Name ${step.id}",
                      nameAr: "Full Name ${step.id}",
                      required: 1),
                  DynamicWidget(
                      id: (2 + step.id!.toInt()),
                      viewTypeId: 3,
                      nameEn: "Email address ${step.id}",
                      nameAr: "Email address ${step.id}",
                      required: 1)
                ]),
            DynamicForm(
                nameEn: 'form ${step.id}',
                nameAr: 'form ${step.id}',
                id: 2 + step.id!.toInt(),
                dynamicWidgets: [
                  DynamicWidget(
                      id: (3 + step.id!.toInt()),
                      viewTypeId: 1,
                      nameEn: "Full Name ${step.id}",
                      nameAr: "Full Name ${step.id}",
                      required: 1),
                  DynamicWidget(
                      id: (4 + step.id!.toInt()),
                      viewTypeId: 3,
                      nameEn: "Email address ${step.id}",
                      nameAr: "Email address ${step.id}",
                      required: 1)
                ]),
          ];
          return;
        }
      }
      notifyListeners();
    });
  }
  ///-----------------------------------------------


  ///validate the data input ------------------------
  bool checkTheCurrentStepDataValid(DynamicStep dynamicStep) {
    return dynamicStep.dynamicForms!.every((dynamicForm) => dynamicForm
        .dynamicWidgets!
        .every((dynamicWidget) => isDynamicWidgetInputValid(dynamicWidget)));
  }

  bool checkTheCurrentFromDataValid(DynamicForm dynamicForm) {
    return dynamicForm
        .dynamicWidgets!
        .every((dynamicWidget) => isDynamicWidgetInputValid(dynamicWidget));
  }

  bool isDynamicWidgetValuesValid() {
    return dynamicWidgets
        .every((dynamicWidget) => isDynamicWidgetInputValid(dynamicWidget));
  }
  ///-------------------------------------------------

  ///render dynamic widgets --------------------------
  Widget buildDynamicStep(DynamicStep dynamicStep) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(dynamicStep.nameEn ?? ''),
          const SizedBox(height: 20),
          ...dynamicStep.dynamicForms!.map((dynamicForm) {
            return buildDynamicForm(dynamicForm);
          }).toList()
        ],
      ),
    );
  }

  Widget buildDynamicForm(DynamicForm dynamicForm) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(dynamicForm.nameEn ?? ''),
          const SizedBox(height: 10),
          ...dynamicForm.dynamicWidgets!.map((dynamicWidget) {
            return buildDynamicWidget(dynamicWidget);
          }).toList(),

          // ElevatedButton(
          //   onPressed: () {
          //     moveToNextForm();
          //   },
          //   child: const Text('Next'),
          // ),
        ],
      ),
    );
  }

  Widget buildDynamicWidget(DynamicWidget dynamicWidget) {
    switch (dynamicWidget.viewTypeId) {
      case 1:
      case 2:
      case 3:
      case 4:
        return DynamicTextField(
            dynamicWidget: dynamicWidget, dynamicProvider: this);
      case 5:
        return DynamicRadioButton(
            dynamicWidget: dynamicWidget, dynamicProvider: this);
      case 6:
      case 7:
        return DynamicCheckbox(
            dynamicWidget: dynamicWidget, dynamicProvider: this);
      default:
        return const SizedBox.shrink();
    }
  }
  ///-------------------------------------------------


  ///the area of the one dynamic screen business logic(without the steps)
  ///

  ///TODO replace this list with the api response
  List<DynamicWidget> dynamicWidgets = FakeDate().dynamicWidgets;

  bool formSubmitted = false;

  void submitForm({bool? b}) {
    if (b != null) {
      formSubmitted = b;
    }
    ///when there is no steps
    else {
      formSubmitted = true;
    }
    notifyListeners();
  }

  Map<int, dynamic> userInput = {};

  bool isDynamicWidgetInputValid(DynamicWidget dynamicWidget) {
    final userInputForDynamicWidget = userInput[dynamicWidget.id];
    if (dynamicWidget.required == 1) {
      if (userInputForDynamicWidget == null ||
          (userInputForDynamicWidget is String &&
                  userInputForDynamicWidget.isEmpty ||
              userInputForDynamicWidget == '') ||
          (userInputForDynamicWidget is List &&
              userInputForDynamicWidget.isEmpty)) {
        return false;
      }
    }
    return true;
  }

  void updateDynamicWidgetInput(int dynamicWidgetId, dynamic value) {
    userInput[dynamicWidgetId] = value;
    notifyListeners();
  }

  ///
  ///end the area of the one dynamic screen business logic(without the steps)

}