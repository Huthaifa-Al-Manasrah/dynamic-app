import 'dynamic_widget_option.dart';

class DynamicWidget {
  int? id;
  int? viewTypeId;
  String? nameEn;
  String? nameAr;
  int? required;
  List<DynamicWidgetOption>? dynamicWidgetOptions;

  DynamicWidget({
    this.id,
    this.viewTypeId,
    this.nameEn,
    this.nameAr,
    this.required,
    this.dynamicWidgetOptions,
  });
}