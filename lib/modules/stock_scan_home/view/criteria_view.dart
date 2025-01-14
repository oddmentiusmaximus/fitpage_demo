import 'package:fitpage/modules/stock_scan_home/view/widget/plain_text_section.dart';
import 'package:fitpage/modules/stock_scan_home/view/widget/variable_text_section.dart';
import 'package:fitpage/modules/utils/criteria_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color_parser.dart';
import '../controller/home_controller.dart';
import '../model/stock_scan_model.dart';

class CriteriaView extends GetView<StockScanHomeController> {
  final int indexOfSection;

  const CriteriaView({Key? key, required this.indexOfSection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final criteriaList = controller.stockScanList[indexOfSection].criteria;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Criteria:')),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      width: Get.width,
                      child: ColoredBox(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.stockScanList[indexOfSection].name ??
                                    '',
                                style: textTheme.titleMedium,
                              ),
                              Text(
                                  controller
                                          .stockScanList[indexOfSection].tag ??
                                      '',
                                  style: textTheme.bodySmall?.copyWith(
                                      color: ColorParser.getColor(controller
                                              .stockScanList[indexOfSection]
                                              .color ??
                                          ''))),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ...(criteriaList ?? [])
                        .asMap()
                        .entries
                        .map((value) => CustomCriteriaSection(
                            indexOfCriteria: value.key, criteriaList: criteriaList ?? []))
                        .toList()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCriteriaSection extends StatelessWidget {
  final List<Criteria> criteriaList;
  final int indexOfCriteria;

  const CustomCriteriaSection(
      {Key? key, required this.indexOfCriteria, required this.criteriaList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (criteriaList[indexOfCriteria].type) {
      case CriteriaType.variable:
        return VariableTextSection(index: indexOfCriteria, criteriaList: criteriaList);

      case CriteriaType.plainText:
        return PlainTextSection(index: indexOfCriteria, criteriaList: criteriaList);

      default:
        return const SizedBox
            .shrink(); // Handle other criterion types as needed
    }
  }
}
