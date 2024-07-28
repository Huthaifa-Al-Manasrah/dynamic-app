import 'package:dynamic_layouts/providers/insurance_provider.dart';
import 'package:dynamic_layouts/screens/dynamic_layouts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DynamicInsuranceScreen extends StatefulWidget {
  const DynamicInsuranceScreen({Key? key}) : super(key: key);

  @override
  State<DynamicInsuranceScreen> createState() => _DynamicInsuranceScreenState();
}

class _DynamicInsuranceScreenState extends State<DynamicInsuranceScreen> {
  @override
  void initState() {
    Provider.of<InsuranceProvider>(context, listen: false).loadInitInsurances();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final insuranceProvider = Provider.of<InsuranceProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Insurance'),
        ),
        body:
        Provider.of<InsuranceProvider>(context, listen: false).loading ? const Center(child: CircularProgressIndicator()) :
        GridView.count(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6,
            children: [
              for (var insurance in insuranceProvider.listInsurances ?? [])
                GestureDetector(
                  onTap: () async {
                    await insuranceProvider.loadCurrentInsurance(insurance.id!);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DynamicLayouts()));
                  },
                  child: Card(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/images.png'),
                          Text(insurance.name ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700)),
                          Text(insurance.description ?? ''),
                        ],
                      ),
                    ),
                  ),
                )
            ]));
  }
}
