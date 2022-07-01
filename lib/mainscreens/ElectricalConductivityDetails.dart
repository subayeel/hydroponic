import 'package:flutter/material.dart';

import '../components/LineChartPage.dart';

class ElectricalConductivityDetails extends StatefulWidget {
  const ElectricalConductivityDetails({Key? key}) : super(key: key);

  @override
  State<ElectricalConductivityDetails> createState() =>
      _ElectricalConductivityDetails();
}

class _ElectricalConductivityDetails
    extends State<ElectricalConductivityDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff9EB23B),
          title: Text("Electrical Conductivity"),
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
                      Text("Conductivity:"),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text("2.2 S/m")
                    ],
                  )),
            ),
            Expanded(
              child: Container(
                width: size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Text("       "),
                          decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Increase Conductivity"),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text("       "),
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Reduce Conductivity"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
