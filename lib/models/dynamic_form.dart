import 'package:dynamic_layouts/models/dynamic_widget.dart';

class DynamicForm {
  int? id;
  String? nameEn;
  String? nameAr;
  List<DynamicWidget>? dynamicWidgets;

  DynamicForm({
    this.id,
    this.nameEn,
    this.nameAr,
    this.dynamicWidgets
  });
}