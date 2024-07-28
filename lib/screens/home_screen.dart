import 'package:dynamic_layouts/providers/insurance_provider.dart';
import 'package:dynamic_layouts/screens/dynamic_form_screen.dart';
import 'package:dynamic_layouts/screens/dynamic_insurance_screen.dart';
import 'package:dynamic_layouts/screens/dynamic_steps_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dynamic_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final dynamicProvider = Provider.of<DynamicProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        await dynamicProvider
                            .loadAllDynamicStepsWithoutForms();
                        setState(() {
                          loading = false;
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                            const DynamicStepsScreen()));
                      },
                      child: const Text('Navigate to dynamic steps screen')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DynamicFormScreen()));
                      },
                      child: const Text('Navigate to dynamic form screen')),

                  Provider.of<InsuranceProvider>(context, listen: false).loading ? const Center(child: CircularProgressIndicator()) :
                  ElevatedButton(
                      onPressed: () {
                        Provider.of<InsuranceProvider>(context, listen: false).loadInitInsurances();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DynamicInsuranceScreen()));
                      },
                      child: const Text('Navigate to dynamic insurance screen'))
                ],
              ),
            ),
    );
  }
}
