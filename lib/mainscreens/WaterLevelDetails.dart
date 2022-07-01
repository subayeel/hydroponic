import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../components/LineChartPage.dart';
import '../constants.dart';

class WaterLevelDetails extends StatefulWidget {
  const WaterLevelDetails({Key? key}) : super(key: key);

  @override
  State<WaterLevelDetails> createState() => _WaterLevelDetails();
}

class _WaterLevelDetails extends State<WaterLevelDetails> {
  double waterLevel = 0;

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

      var dwaterLevel = await map['waterLevel'].toDouble();

      setState(() {
        waterLevel = dwaterLevel;
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
          title: Text("Water Level"),
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
                      Text("Current Volume:"),
                      SizedBox(width: size.width * 0.01),
                      Text(
                        "${waterLevel} mL",
                        style: kPrimaryTextStyle,
                      )
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
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Material(
                            color: Color(0xff005084),
                            borderRadius: BorderRadius.circular(10),
                            elevation: 20,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Increase\nVolume\n(+10mL)",
                                style: kSmallTextStyle,
                              ),
                            ),
                          ),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Material(
                            color: Color(0xff005084),
                            borderRadius: BorderRadius.circular(10),
                            elevation: 20,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Decrease\nVolume\n(-10mL)",
                                style: kSmallTextStyle,
                              ),
                            ),
                          ),
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
