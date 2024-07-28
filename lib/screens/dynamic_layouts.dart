import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/insurance_provider.dart';

class DynamicLayouts extends StatelessWidget {
  const DynamicLayouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final insuranceProvider = Provider.of<InsuranceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Insurance'),
      ),
      body: insuranceProvider.buildInsuranceLayout(),
    );
  }
}
