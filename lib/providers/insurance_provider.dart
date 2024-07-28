import 'package:dynamic_layouts/data/fake_data.dart';
import 'package:dynamic_layouts/models/insurance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsuranceProvider with ChangeNotifier {
  List<Insurance>? listInsurances;
  bool loading = false;

  Future<void> loadInitInsurances() async {
    await Future.delayed(const Duration(seconds: 2), () {
      listInsurances = [
        Insurance(
            1,
            'insurance 1',
            'description 1 description 1 description 1 description 1 description 1 description 1',
            []),
        Insurance(
            2,
            'insurance 2',
            'description 2 description 2 description 2 description 2 description 2 description 2',
            []),
        Insurance(
            3,
            'insurance 3',
            'description 3 description 3 description 3 description 3 description 3 description 3',
            []),
        Insurance(
            4,
            'insurance 4',
            'description 4 description 4 description 4 description 4 description 4 description 4',
            []),
        Insurance(
            5,
            'insurance 5',
            'description 5 description 5 description 5 description 5 description 5 description 5',
            []),
      ];
      buildInsuranceLayout();
      notifyListeners();
    });
  }

  Insurance? _currentInsurance;

  Future<void> loadCurrentInsurance(int insuranceId) async {
    loading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2), () {
      for (Insurance v in FakeDate().listOfInsurance) {
        if (v.id == insuranceId) {
          _currentInsurance = v;
          _currentInsurance?.children = FakeDate().insuranceList[v.id! - 1];
          notifyListeners();
          return;
        }
      }
    });
    loading = false;
    notifyListeners();
  }

  int _currentLayoutIndex = 0;

  final List<int> _layouts = [1, 2, 3];

  Widget buildInsuranceLayout() {
    ///1: grid layout
    ///2: column layout
    ///3: row layout

    if (loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (_layouts[_currentLayoutIndex] == 1) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black45,
                          spreadRadius: -1,
                          blurRadius: 7)
                    ]),
                child:
                Image.asset('assets/images/images.png', fit: BoxFit.cover)),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
                children: [
                  if (_currentInsurance?.children != null)
                    ..._currentInsurance!.children!.map((insurance) {
                      return GestureDetector(
                        onTap: () async {
                          await loadCurrentInsurance(insurance.id!);
                          buildInsuranceLayout();
                          _changeTheCurrentLayoutIndex();
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    width: 75,
                                    height: 75,
                                    margin: const EdgeInsets.only(bottom: 20),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius
                                            .circular(100)
                                    ),
                                    child: Image.asset(
                                        'assets/images/images.png',
                                        fit: BoxFit.cover)),
                                Text(insurance.name ?? '',
                                    style: const TextStyle(fontWeight: FontWeight.w700)),
                                Text(insurance.description ?? ''),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList()
                ],
              ),
            ),
          ],
        ),
      );
    } else if (_layouts[_currentLayoutIndex] == 2) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black45,
                            spreadRadius: -1,
                            blurRadius: 7)
                      ]),
                  child:
                  Image.asset('assets/images/images.png', fit: BoxFit.cover)),
              const SizedBox(height: 20),
              if (_currentInsurance?.children != null)
                ..._currentInsurance!.children!.map((insurance) {
                  return GestureDetector(
                    onTap: () async {
                      await loadCurrentInsurance(insurance.id!);
                      buildInsuranceLayout();
                      _changeTheCurrentLayoutIndex();
                    },
                    child: Card(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              width: 75,
                              height: 75,
                              margin: const EdgeInsets.only(bottom: 20),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius
                                      .circular(100)
                              ),
                              child: Image.asset(
                                  'assets/images/images.png',
                                  fit: BoxFit.cover)),
                          Flexible(
                            child: Column(
                              children: [
                                Text(insurance.name ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700)),
                                Text(insurance.description ?? ''),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList()
            ],
          ),
        ),
      );
    } else if (_layouts[_currentLayoutIndex] == 3) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black45,
                          spreadRadius: -1,
                          blurRadius: 7)
                    ]),
                child:
                    Image.asset('assets/images/images.png', fit: BoxFit.cover)),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    if (_currentInsurance?.children != null)
                      ..._currentInsurance!.children!.map((insurance) {
                        return GestureDetector(
                          onTap: () async {
                            await loadCurrentInsurance(insurance.id!);
                            buildInsuranceLayout();
                            _changeTheCurrentLayoutIndex();
                          },
                          child: Container(
                            width: 200,
                            decoration: const BoxDecoration(
                              color: CupertinoColors.systemGreen,
                              boxShadow: [
                                BoxShadow(color: Colors.black45, blurRadius: 7, spreadRadius: -1)
                              ]
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 75,
                                      height: 75,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                        borderRadius: BorderRadius
                                          .circular(100)
                                      ),
                                      child: Image.asset(
                                          'assets/images/images.png',
                                          fit: BoxFit.cover)),
                                  Text(insurance.name ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700)),
                                  Text(insurance.description ?? ''),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList()
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  void _changeTheCurrentLayoutIndex() {
    if (_currentLayoutIndex < (_layouts.length - 1)) {
      _currentLayoutIndex++;
    } else {
      _currentLayoutIndex = 0;
    }
  }
}
