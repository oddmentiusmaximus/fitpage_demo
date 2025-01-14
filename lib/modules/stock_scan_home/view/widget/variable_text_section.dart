import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import custom enums and models.
import '../../../../routes/app_pages.dart';
import '../../../utils/criteria_type_enum.dart';
import '../../model/stock_scan_model.dart';

//Part of CriteriaView - VariableTextSection
class VariableTextSection extends StatelessWidget {
  final List<Criteria> criteriaList; // List of criteria.
  final int index; // Index of the current criteria.

  // Constructor for VariableTextSection.
  const VariableTextSection({
    Key? key,
    required this.index,
    required this.criteriaList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final variableMap = criteriaList[index].variable;
    final variableKeys = variableMap?.keys.toList();

    final splitStringList = criteriaList[index].text?.split(" ");
    debugPrint("Values getting added | $splitStringList");

    List<TextSpan> textSpans = [];

    int i = 0; // Index for splitStringList
    while (i < splitStringList!.length) {
      final stringValue = splitStringList[i];


      if (variableKeys!.contains(stringValue)) {
        final variableData = variableMap?[stringValue];
        final subCriteria =
        SubCriteriaType.getTypeFromString(variableData['type']);

        // Handle the case where the variable is an indicator or value.
        switch (subCriteria) {
          case SubCriteriaType.indicator:
            textSpans.add(TextSpan(
              text: " (${variableData['default_value']}) ",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(Routes.subCriteriaView,
                      arguments: {"selectedData": variableData});
                },
              style: textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                decoration: TextDecoration.underline,
              ),
            ));
            break;
          case SubCriteriaType.valueType:
            final values = variableData['values'] as List<dynamic>;

            if (values.isNotEmpty) {
              textSpans.add(TextSpan(
                text: " (${values[0]}) ",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(Routes.subCriteriaView,
                        arguments: {"selectedData": variableData});
                  },
                style: textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  decoration: TextDecoration.underline,
                ),
              ));
            }
            break;
        }
        i++; // Move to the next element in splitStringList.
      } else {
        // If the variable key is at the end, add it to the textSpans.
        textSpans.add(TextSpan(
          text: "$stringValue ",
        ));

        i++; // Move to the next element in splitStringList.
      }
    }

    // Add "and" if there are multiple criteria.
    if (criteriaList.length > 1 && criteriaList.last != criteriaList[index]) {
      textSpans.add(TextSpan(
        text: '\nand',
        style: textTheme.labelSmall?.copyWith(color: Colors.white),
      ));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: textSpans,
          ),
        ),
      ],
    );
  }
}
