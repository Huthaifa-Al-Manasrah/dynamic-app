import 'package:dynamic_layouts/models/dynamic_form.dart';

class DynamicStep {
  int? id;
  int? stepNumber;
  String? nameEn;
  String? nameAr;
  List<DynamicForm>? dynamicForms;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DynamicStep &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  DynamicStep(
      {this.id, this.stepNumber, this.nameEn, this.nameAr, this.dynamicForms});
}
