import 'package:flutter/material.dart';

import '../../model/stock_scan_model.dart';
//Part of CriteriaView - PlainTextSection
class PlainTextSection extends StatelessWidget {
  final List<Criteria> criteriaList;
  final int index;

  const PlainTextSection(
      {Key? key, required this.index, required this.criteriaList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return criteriaList.length == 1 || criteriaList.last == criteriaList[index]
        ? Text(
            criteriaList[index].text ?? '',
            style: const TextStyle(color: Colors.white),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                criteriaList[index].text ?? '',
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                'and',
                style: textTheme.labelSmall?.copyWith(color: Colors.white),
              )
            ],
          );
  }
}
