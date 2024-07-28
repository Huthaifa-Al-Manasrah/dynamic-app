import 'package:dynamic_layouts/models/insurance.dart';

import '../models/dynamic_form.dart';
import '../models/dynamic_step.dart';
import '../models/dynamic_widget.dart';
import '../models/dynamic_widget_option.dart';

class FakeDate {

  List<Insurance> listOfInsurance= [
  Insurance(1, 'name 1', 'description description description description description description description', []),
  Insurance(2, 'name 2', 'description description description description description description description', []),
  Insurance(3, 'name 3', 'description description description description description description description', []),
  Insurance(4, 'name 4', 'description description description description description description description', []),
  Insurance(5, 'name 5', 'description description description description description description description', [])
  ];

  List<List<Insurance>> insuranceList = [
    [
      Insurance(1, 'name 1', 'description description description description description description description', []),
      Insurance(2, 'name 2', 'description description description description description description description', []),
      Insurance(3, 'name 3', 'description description description description description description description', []),
      Insurance(4, 'name 4', 'description description description description description description description', []),
      Insurance(5, 'name 5', 'description description description description description description description', [])
    ],
    [
      Insurance(1, 'name 1', 'description description description description description description description', []),
      Insurance(2, 'name 2', 'description description description description description description description', []),
      Insurance(3, 'name 3', 'description description description description description description description', []),
      Insurance(4, 'name 4', 'description description description description description description description', [])
    ],
    [
      Insurance(1, 'name 1', 'description description description description description description description', []),
      Insurance(2, 'name 2', 'description description description description description description description', []),
      Insurance(3, 'name 3', 'description description description description description description description', [])
    ],
    [
      Insurance(1, 'name 1', 'description description description description description description description', []),
      Insurance(2, 'name 2', 'description description description description description description description', [])
    ],
    [
      Insurance(1, 'name 1', 'description description description description description description description', [])
    ],
  ];

  List<DynamicStep> dynamicStepsList = [
    DynamicStep(
        id: 1,
        nameEn: "Company",
        nameAr: 'Company',
        stepNumber: 1,
        dynamicForms: [
          DynamicForm(
              id: 1,
              nameEn: 'Fill the required data',
              nameAr: 'Fill the required data',
              dynamicWidgets: [
                DynamicWidget(
                    id: 1,
                    viewTypeId: 1,
                    nameEn: 'Email',
                    nameAr: 'Email',
                    required: 1),
                DynamicWidget(
                    id: 2,
                    viewTypeId: 4,
                    nameEn: 'Phone Number',
                    nameAr: 'Phone Number',
                    required: 1)
              ]),
          DynamicForm(
              id: 2,
              nameEn: 'Company Details',
              nameAr: 'Company Details',
              dynamicWidgets: [
                DynamicWidget(
                    id: 3,
                    viewTypeId: 4,
                    nameEn: 'Commercial Registration No',
                    nameAr: 'Commercial Registration No',
                    required: 1),
                DynamicWidget(
                    id: 4,
                    viewTypeId: 1,
                    nameEn: 'Tax Certificate',
                    nameAr: 'Tax Certificate',
                    required: 1)
              ]),
          DynamicForm(
              id: 3,
              nameEn: 'Marine Unit Details (Ship)',
              nameAr: 'Marine Unit Details (Ship)',
              dynamicWidgets: [
                DynamicWidget(
                    id: 5,
                    viewTypeId: 4,
                    nameEn: 'Commercial Registration No',
                    nameAr: 'Commercial Registration No',
                    required: 1),
                DynamicWidget(
                    id: 6,
                    viewTypeId: 1,
                    nameEn: 'Total Tonnage',
                    nameAr: 'Total Tonnage',
                    required: 1),
                DynamicWidget(
                    id: 7,
                    viewTypeId: 1,
                    nameEn: 'Net Tonnage',
                    nameAr: 'Net Tonnage',
                    required: 1),
                DynamicWidget(
                    id: 8,
                    viewTypeId: 1,
                    nameEn: 'Construction Material',
                    nameAr: 'Construction Material',
                    required: 1),
                DynamicWidget(
                    id: 9,
                    viewTypeId: 1,
                    nameEn: 'Type of use',
                    nameAr: 'Type of use',
                    required: 1),
                DynamicWidget(
                    id: 10,
                    viewTypeId: 4,
                    nameEn: 'IMO Number',
                    nameAr: 'IMO number',
                    required: 1),
                DynamicWidget(
                    id: 11,
                    viewTypeId: 4,
                    nameEn: 'Relevant Place To Sent',
                    nameAr: 'Relevant Place To Sent',
                    required: 1),
              ]),
        ]),
    DynamicStep(
        id: 2,
        nameEn: "Individuals",
        nameAr: 'Individuals',
        stepNumber: 2,
        dynamicForms: [
          DynamicForm(
              id: 4,
              nameEn: 'Fill the required data',
              nameAr: 'Fill the required data',
              dynamicWidgets: [
                DynamicWidget(
                    id: 12,
                    viewTypeId: 1,
                    nameEn: 'Email',
                    nameAr: 'Email',
                    required: 1),
                DynamicWidget(
                    id: 13,
                    viewTypeId: 4,
                    nameEn: 'Phone Number',
                    nameAr: 'Phone Number',
                    required: 1)
              ]),
          DynamicForm(
              id: 5,
              nameEn: 'Company Details',
              nameAr: 'Company Details',
              dynamicWidgets: [
                DynamicWidget(
                    id: 14,
                    viewTypeId: 4,
                    nameEn: 'Commercial Registration No',
                    nameAr: 'Commercial Registration No',
                    required: 1),
                DynamicWidget(
                    id: 15,
                    viewTypeId: 1,
                    nameEn: 'Tax Certificate',
                    nameAr: 'Tax Certificate',
                    required: 1)
              ]),
          DynamicForm(
              id: 6,
              nameEn: 'Marine Unit Details (Ship)',
              nameAr: 'Marine Unit Details (Ship)',
              dynamicWidgets: [
                DynamicWidget(
                    id: 16,
                    viewTypeId: 4,
                    nameEn: 'Commercial Registration No',
                    nameAr: 'Commercial Registration No',
                    required: 1),
                DynamicWidget(
                    id: 17,
                    viewTypeId: 1,
                    nameEn: 'Total Tonnage',
                    nameAr: 'Total Tonnage',
                    required: 1),
                DynamicWidget(
                    id: 18,
                    viewTypeId: 1,
                    nameEn: 'Net Tonnage',
                    nameAr: 'Net Tonnage',
                    required: 1),
                DynamicWidget(
                    id: 19,
                    viewTypeId: 1,
                    nameEn: 'Construction Material',
                    nameAr: 'Construction Material',
                    required: 1),
                DynamicWidget(
                    id: 20,
                    viewTypeId: 1,
                    nameEn: 'Type of use',
                    nameAr: 'Type of use',
                    required: 1),
                DynamicWidget(
                    id: 21,
                    viewTypeId: 4,
                    nameEn: 'IMO Number',
                    nameAr: 'IMO number',
                    required: 1),
                DynamicWidget(
                    id: 22,
                    viewTypeId: 4,
                    nameEn: 'Relevant Place To Sent',
                    nameAr: 'Relevant Place To Sent',
                    required: 1),
              ]),
        ])
  ];

  List<DynamicForm> dynamicFormsList = [
    DynamicForm(
        id: 1,
        nameEn: 'Fill the required data',
        nameAr: 'Fill the required data',
        dynamicWidgets: [
          DynamicWidget(
              id: 1,
              viewTypeId: 1,
              nameEn: 'Email',
              nameAr: 'Email',
              required: 1),
          DynamicWidget(
              id: 2,
              viewTypeId: 4,
              nameEn: 'Phone Number',
              nameAr: 'Phone Number',
              required: 1)
        ]),
    DynamicForm(
        id: 2,
        nameEn: 'Company Details',
        nameAr: 'Company Details',
        dynamicWidgets: [
          DynamicWidget(
              id: 3,
              viewTypeId: 4,
              nameEn: 'Commercial Registration No',
              nameAr: 'Commercial Registration No',
              required: 1),
          DynamicWidget(
              id: 4,
              viewTypeId: 1,
              nameEn: 'Tax Certificate',
              nameAr: 'Tax Certificate',
              required: 1)
        ]),
    DynamicForm(
        id: 3,
        nameEn: 'Marine Unit Details (Ship)',
        nameAr: 'Marine Unit Details (Ship)',
        dynamicWidgets: [
          DynamicWidget(
              id: 5,
              viewTypeId: 4,
              nameEn: 'Commercial Registration No',
              nameAr: 'Commercial Registration No',
              required: 1),
          DynamicWidget(
              id: 6,
              viewTypeId: 1,
              nameEn: 'Total Tonnage',
              nameAr: 'Total Tonnage',
              required: 1),
          DynamicWidget(
              id: 7,
              viewTypeId: 1,
              nameEn: 'Net Tonnage',
              nameAr: 'Net Tonnage',
              required: 1),
          DynamicWidget(
              id: 8,
              viewTypeId: 1,
              nameEn: 'Construction Material',
              nameAr: 'Construction Material',
              required: 1),
          DynamicWidget(
              id: 9,
              viewTypeId: 1,
              nameEn: 'Type of use',
              nameAr: 'Type of use',
              required: 1),
          DynamicWidget(
              id: 10,
              viewTypeId: 4,
              nameEn: 'IMO Number',
              nameAr: 'IMO number',
              required: 1),
          DynamicWidget(
              id: 11,
              viewTypeId: 4,
              nameEn: 'Relevant Place To Sent',
              nameAr: 'Relevant Place To Sent',
              required: 1),
        ]),
    DynamicForm(
        id: 4,
        nameEn: 'Fill the required data',
        nameAr: 'Fill the required data',
        dynamicWidgets: [
          DynamicWidget(
              id: 12,
              viewTypeId: 1,
              nameEn: 'Email',
              nameAr: 'Email',
              required: 1),
          DynamicWidget(
              id: 13,
              viewTypeId: 4,
              nameEn: 'Phone Number',
              nameAr: 'Phone Number',
              required: 1)
        ]),
    DynamicForm(
        id: 5,
        nameEn: 'Company Details',
        nameAr: 'Company Details',
        dynamicWidgets: [
          DynamicWidget(
              id: 14,
              viewTypeId: 4,
              nameEn: 'Commercial Registration No',
              nameAr: 'Commercial Registration No',
              required: 1),
          DynamicWidget(
              id: 15,
              viewTypeId: 1,
              nameEn: 'Tax Certificate',
              nameAr: 'Tax Certificate',
              required: 1)
        ]),
    DynamicForm(
        id: 6,
        nameEn: 'Marine Unit Details (Ship)',
        nameAr: 'Marine Unit Details (Ship)',
        dynamicWidgets: [
          DynamicWidget(
              id: 16,
              viewTypeId: 4,
              nameEn: 'Commercial Registration No',
              nameAr: 'Commercial Registration No',
              required: 1),
          DynamicWidget(
              id: 17,
              viewTypeId: 1,
              nameEn: 'Total Tonnage',
              nameAr: 'Total Tonnage',
              required: 1),
          DynamicWidget(
              id: 18,
              viewTypeId: 1,
              nameEn: 'Net Tonnage',
              nameAr: 'Net Tonnage',
              required: 1),
          DynamicWidget(
              id: 19,
              viewTypeId: 1,
              nameEn: 'Construction Material',
              nameAr: 'Construction Material',
              required: 1),
          DynamicWidget(
              id: 20,
              viewTypeId: 1,
              nameEn: 'Type of use',
              nameAr: 'Type of use',
              required: 1),
          DynamicWidget(
              id: 21,
              viewTypeId: 4,
              nameEn: 'IMO Number',
              nameAr: 'IMO number',
              required: 1),
          DynamicWidget(
              id: 22,
              viewTypeId: 4,
              nameEn: 'Relevant Place To Sent',
              nameAr: 'Relevant Place To Sent',
              required: 1),
        ]),
  ];

  List<DynamicWidget> dynamicWidgets = [
    DynamicWidget(
        id: 1,
        viewTypeId: 1,
        nameEn: "Full Name",
        nameAr: "Full Name",
        required: 1),
    DynamicWidget(
        id: 3,
        viewTypeId: 3,
        nameEn: "Email address",
        nameAr: "Email address",
        required: 1),
    DynamicWidget(
        id: 4,
        viewTypeId: 4,
        nameEn: "Phone Number",
        nameAr: "Phone Number",
        required: 1),
    DynamicWidget(
      id: 5,
      viewTypeId: 5,
      nameEn: "How do you usually prefer to travel? ",
      nameAr: "How do you usually prefer to travel? ",
      required: 1,
      dynamicWidgetOptions: [
        DynamicWidgetOption(
            id: 1,
            attributeId: 1,
            valueEn: "Road trips",
            valueAr: "Road trips"),
        DynamicWidgetOption(
            id: 2,
            attributeId: 1,
            valueEn: "Air travel",
            valueAr: "Air travel"),
        DynamicWidgetOption(
            id: 3,
            attributeId: 1,
            valueEn: "Train travel",
            valueAr: "Train travel"),
        DynamicWidgetOption(
            id: 4, attributeId: 1, valueEn: "Cruises", valueAr: "Cruises"),
      ],
    ),
    DynamicWidget(
      id: 6,
      viewTypeId: 5,
      nameEn: "Are you comfortable using smartphones and apps?",
      nameAr: "Are you comfortable using smartphones and apps?",
      required: 1,
      dynamicWidgetOptions: [
        DynamicWidgetOption(
            id: 1,
            attributeId: 1,
            valueEn: " Very comfortable",
            valueAr: " Very comfortable"),
        DynamicWidgetOption(
            id: 2,
            attributeId: 1,
            valueEn: "Somewhat comfortable",
            valueAr: "Somewhat comfortable"),
        DynamicWidgetOption(
            id: 3,
            attributeId: 1,
            valueEn: " Not very comfortable",
            valueAr: " Not very comfortable"),
        DynamicWidgetOption(
            id: 4,
            attributeId: 1,
            valueEn: "Not comfortable at all",
            valueAr: "Not comfortable at all"),
      ],
    ),
    DynamicWidget(
      id: 7,
      viewTypeId: 6,
      nameEn: "Which social media platforms do you use?",
      nameAr: "Which social media platforms do you use?",
      required: 1,
      dynamicWidgetOptions: [
        DynamicWidgetOption(
            id: 1, attributeId: 1, valueEn: "Facebook", valueAr: "Facebook"),
        DynamicWidgetOption(
            id: 2, attributeId: 1, valueEn: "Instagram", valueAr: "Instagram"),
        DynamicWidgetOption(
            id: 3, attributeId: 1, valueEn: "Twitter", valueAr: "Twitter"),
        DynamicWidgetOption(
            id: 4, attributeId: 1, valueEn: "TikTok", valueAr: "TikTok"),
        DynamicWidgetOption(
            id: 5, attributeId: 1, valueEn: "LinkedIn", valueAr: "LinkedIn")
      ],
    ),
    DynamicWidget(
      id: 8,
      viewTypeId: 6,
      nameEn: "Which types of movies do you enjoy?",
      nameAr: "Which types of movies do you enjoy?",
      required: 1,
      dynamicWidgetOptions: [
        DynamicWidgetOption(
            id: 1, attributeId: 1, valueEn: "Action", valueAr: "Action"),
        DynamicWidgetOption(
            id: 2, attributeId: 1, valueEn: "Comedy", valueAr: "Comedy"),
        DynamicWidgetOption(
            id: 3, attributeId: 1, valueEn: "Drama", valueAr: "Drama"),
        DynamicWidgetOption(
            id: 4, attributeId: 1, valueEn: "Sci-Fi", valueAr: "Sci-Fi"),
        DynamicWidgetOption(
            id: 5, attributeId: 1, valueEn: "Horror", valueAr: "Horror")
      ],
    ),
    DynamicWidget(
        id: 2,
        viewTypeId: 2,
        nameEn: "Your message",
        nameAr: "Your message",
        required: 0)
  ];
}
