import 'package:firebase_database/firebase_database.dart';
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
  double atmosphericTemp = 0, humidity = 0;
  @override
  void initState() {
    super.initState();

    getRealtimeData();
  }

  Future getRealtimeData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("");

    // Get the Stream
    Stream<DatabaseEvent> stream = ref.onValue;

// Subscribe to the stream!
    stream.listen((DatabaseEvent event) async {
// Print the data of the snapshot
      var e = event.snapshot.value;
      Map<dynamic, dynamic> map = event.snapshot.value as Map;

      var datmosphericTemp = await map['atmosphericTemp'].toDouble();

      var dhumidity = await map['humidity'].toDouble();

      setState(() {
        atmosphericTemp = datmosphericTemp;

        humidity = dhumidity;
      });
    });
  }

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
                    Text("${atmosphericTemp} °C")
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
                    Text("${humidity} %")
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
