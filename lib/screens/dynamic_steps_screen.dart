import 'dart:developer';

import 'package:dynamic_layouts/models/dynamic_form.dart';
import 'package:dynamic_layouts/models/dynamic_step.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/dynamic_widget.dart';
import '../providers/dynamic_provider.dart';
import '../widgets/dynamic_checkbox.dart';
import '../widgets/dynamic_radio_button.dart';
import '../widgets/dynamic_text_field.dart';

class DynamicStepsScreen extends StatefulWidget {
  const DynamicStepsScreen({Key? key}) : super(key: key);

  @override
  State<DynamicStepsScreen> createState() => _DynamicStepsScreenState();
}

class _DynamicStepsScreenState extends State<DynamicStepsScreen> {
  final _controller = PageController(initialPage: 0, keepPage: true);

  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dynamicProvider = Provider.of<DynamicProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('dynamic step with fake forms')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45
                )
              ]
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0;
                i < dynamicProvider.allDynamicStepsListWithoutForms.length;
                i++)
                Row(
                  children: [
                    const SizedBox(width: 5),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        _index = 0;
                      });
                      _controller.animateToPage(
                        i,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }, child: Text(dynamicProvider.allDynamicStepsListWithoutForms[i].nameEn ?? '')),
                    const SizedBox(width: 5),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (int i = 0; i < dynamicProvider.allDynamicStepsListWithoutForms.length; i++)
                  Theme(
                    data: ThemeData(
                      canvasColor: Colors.white,
                      colorScheme: Theme.of(context).colorScheme.copyWith(primary: Colors.green),
                      // colorScheme: Theme.of(context).colorScheme.copyWith(
                      //   primary: Colors.green,
                      //   background: Colors.red,
                      //   secondary: Colors.green,
                      // ),
                    ),
                    child: Stepper(
                      currentStep: _index,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      controlsBuilder: (context, details) {
                        if(_index == 0){
                          return Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: (){
                                    print('the cureent index : $_index');
                                    dynamicProvider.submitForm(b: true);
                                    if(dynamicProvider.checkTheCurrentFromDataValid(dynamicProvider.allDynamicStepsListWithoutForms[i].dynamicForms![_index])){
                                      if (_index < dynamicProvider.allDynamicStepsListWithoutForms[i].dynamicForms!.length-1) {
                                        setState(() {
                                          _index += 1;
                                        });
                                      }
                                    }else{
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('fill all required data'), backgroundColor: Colors.red,));
                                    }
                                  },
                                  child: const Text('Next'),
                                ),
                              ),
                            ],
                          );
                        }

                        if(_index == (dynamicProvider.allDynamicStepsListWithoutForms[i].dynamicForms?.length ?? 2) - 1) {
                          return Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: (){},
                                  child: const Text('Submit'),
                                ),
                              ),
                            ],
                          );
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: ElevatedButton(
                                onPressed: (){
                                  print('the cureent index : $_index');
                                  dynamicProvider.submitForm(b: true);
                                  if(dynamicProvider.checkTheCurrentFromDataValid(dynamicProvider.allDynamicStepsListWithoutForms[i].dynamicForms![_index])){
                                    if (_index < dynamicProvider.allDynamicStepsListWithoutForms[i].dynamicForms!.length-1) {
                                      setState(() {
                                        _index += 1;
                                      });
                                    }
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('fill all required data'), backgroundColor: Colors.red,));
                                  }
                                },
                                child: const Text('Next'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: (){
                                  if (_index > 0) {
                                    setState(() {
                                      _index -= 1;
                                    });
                                  }
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                                child: const Text('Cancel'),
                              ),
                            ),
                          ],
                        );
                      },
                      onStepTapped: (int index) {
                        if(index<_index) {
                          setState(() {
                          _index = index;
                        });
                        }
                      },
                      steps: <Step>[
                        for(int k = 0; k < dynamicProvider.allDynamicStepsListWithoutForms[i].dynamicForms!.length; k++)
                        Step(
                          isActive: _index == k,
                          title: Text(dynamicProvider.allDynamicStepsListWithoutForms[i].dynamicForms![k].nameEn ?? ''),
                          content: Container(
                            alignment: Alignment.centerLeft,
                            child: dynamicProvider.buildDynamicForm(dynamicProvider.allDynamicStepsListWithoutForms[i].dynamicForms![k]),
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
