import 'package:flutter/material.dart';

import '../components/LineChartPage.dart';

class LdrDetails extends StatefulWidget {
  const LdrDetails({Key? key}) : super(key: key);

  @override
  State<LdrDetails> createState() => _LdrDetails();
}

class _LdrDetails extends State<LdrDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff9EB23B),
          title: Text("LDR"),
          titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color(0xffE0DECA),
        body: Column(
          children: [
            const Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: LineChartPage(),
              ),
            ),
            Expanded(
              child: Container(
                  width: size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("LDR:"),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text("0.02 lx")
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
