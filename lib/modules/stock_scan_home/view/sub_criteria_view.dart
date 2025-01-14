import 'package:fitpage/modules/stock_scan_home/view/widget/dotted_line.dart';
import 'package:fitpage/modules/utils/criteria_type_enum.dart';
import 'package:fitpage/modules/utils/extension_on_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCriteriaView extends StatelessWidget {
  final Map<String, dynamic> selectedData;

  const SubCriteriaView({Key? key, required this.selectedData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract variable data from the selectedData map.
    final variableData = selectedData;

    final textTheme = Theme.of(context).textTheme;

    debugPrint(" selectedData |$variableData");

    final subCriteriaType =
        SubCriteriaType.getTypeFromString(variableData['type']);

    // Build the UI based on the sub-criteria type.
    switch (subCriteriaType) {
      case SubCriteriaType.valueType:
        final valuesList = variableData['values'] as List;
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: const Text(
              "Sub Criteria View ",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...valuesList
                      .map((value) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "$value",
                                  style: textTheme.bodyLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                              if (valuesList.last != value) ...{
                                DottedLine(
                                  color: Colors.white,
                                  height: 1.0,
                                  width: Get.width,
                                  spacing: 2.0,
                                )
                              }
                            ],
                          ))
                      .toList(),
                ],
              ),
            ),
          ),
        );
      case SubCriteriaType.indicator:
        final min = variableData['min_value'];
        final max = variableData['max_value'];
        final defaultValue = variableData['default_value'];
        final String title = variableData['study_type'];
        final String parameterName = variableData['parameter_name'];
        return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              title: const Text(
                "Sub Criteria View ",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title.toString().toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Set Parameters",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            parameterName.capitalizeFirstLetter(),
                            style: textTheme.titleMedium,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              initialValue: '$defaultValue',
                              decoration: const InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.elliptical(10, 10),
                                    ),
                                  ),
                                  labelStyle: TextStyle(color: Colors.white),
                                  helperStyle: TextStyle(color: Colors.white)),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a value';
                                }
                                final inputValue = double.tryParse(value);
                                if (inputValue == null ||
                                    inputValue < min ||
                                    inputValue > max) {
                                  return 'Invalid value. Must be between $min and $max';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
    }
  }
}
