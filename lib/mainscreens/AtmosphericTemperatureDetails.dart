import 'package:flutter/material.dart';
import 'package:hydroponic_system/components/LineChartPage.dart';

class AtmosphericTemperatureDetails extends StatefulWidget {
  const AtmosphericTemperatureDetails({Key? key}) : super(key: key);

  @override
  State<AtmosphericTemperatureDetails> createState() =>
      _AtmosphericTemperatureDetails();
}

class _AtmosphericTemperatureDetails
    extends State<AtmosphericTemperatureDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff9EB23B),
          title: Text("Atmospheric Temperature"),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Temperature:"),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Text("26 °C(79 °F)")
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Wind Speed:"),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Text("10 Km/h")
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Humidity:"),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Text("90 %")
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Percipitation:"),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Text("20 %")
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
