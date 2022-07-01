import 'package:flutter/material.dart';

import 'LineChartWidget.dart';

class LineChartPage extends StatelessWidget {
  const LineChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: const Color(0xff020227),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 32),
          child: LineChartWidget(),
        ),
      );
}
