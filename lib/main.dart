import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'mainscreens/AtmosphericTemperatureDetails.dart';
import 'mainscreens/ElectricalConductivityDetails.dart';
import 'mainscreens/PhDetails.dart';
import 'mainscreens/WaterLevelDetails.dart';
import 'mainscreens/WaterTempDetails.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Dairy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double phWater = 0,
      waterTemp = 0,
      elecCondictivity = 0,
      atmosphericTemp = 0,
      waterLevel = 0,
      humidity = 0;

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  Future getDetails() async {
    var collection = FirebaseFirestore.instance.collection('systemDetails');
    var docSnapshot = await collection.doc("details").get();

    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      var dphWater = await data?['phWater'].toDouble();
      var dwaterTemp = await data?['waterTemp'].toDouble();
      var delecCondictivity = await data?['elecCondictivity'].toDouble();
      var datmosphericTemp = await data?['atmosphericTemp'].toDouble();
      var dwaterLevel = await data?['waterLevel'].toDouble();
      var dhumidity = await data?['humidity'].toDouble();

      setState(() {
        phWater = dphWater;
        waterTemp = dwaterTemp;
        elecCondictivity = delecCondictivity;
        atmosphericTemp = datmosphericTemp;
        waterLevel = dwaterLevel;
        humidity = dhumidity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff9EB23B),
        ),
        backgroundColor: Color(0xffE0DECA),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              // Expanded(
              //     child: Padding(
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: Stack(
              //     children: [
              //       ClipRRect(
              //         borderRadius: BorderRadius.circular(20),
              //         child: Image(
              //           image: AssetImage("images/hydroponic-bg.png"),
              //         ),
              //       ),
              //       Positioned(
              //         child: Container(
              //           decoration: BoxDecoration(
              //               color: Colors.black.withOpacity(0.3),
              //               borderRadius: BorderRadius.only(
              //                   topRight: Radius.circular(20),
              //                   bottomLeft: Radius.circular(20))),
              //           padding: EdgeInsets.all(8.0),
              //           child: Text(
              //             "Hydoponic System",
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 22,
              //               fontWeight: FontWeight.w900,
              //             ),
              //           ),
              //         ),
              //         bottom: 0,
              //       ),
              //     ],
              //   ),
              // )),

              Padding(
                padding: const EdgeInsets.only(top: 12, left: 12.0, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hydroponic System",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff555555)),
                          ),
                          Text(
                            "Let's Plant!",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 32),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.2,
                      child: Image(
                        image: AssetImage("images/small-plant.png"),
                      ),
                    ),
                  ],
                ),
              ),
              DetailsCard(
                detailValue: phWater,
                image: 'images/water-drop.png',
                detailTitle: 'ph Value of water',
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhDetails()));
                },
              ),
              DetailsCard(
                detailValue: waterTemp,
                image: 'images/thermometer.png',
                detailTitle: 'Water temprature',
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WaterTempDetails()));
                },
              ),
              DetailsCard(
                detailValue: elecCondictivity,
                image: 'images/electrical-energy.png',
                detailTitle: 'Electrical Conductivity',
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ElectricalConductivityDetails()));
                },
              ),
              DetailsCard(
                detailValue: atmosphericTemp,
                image: 'images/global-warming.png',
                detailTitle: 'Atmospheric temperature',
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AtmosphericTemperatureDetails()));
                },
              ),
              DetailsCard(
                detailValue: waterLevel,
                image: 'images/water-level.png',
                detailTitle: 'Water level',
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WaterLevelDetails()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  const DetailsCard(
      {Key? key,
      required this.image,
      required this.detailTitle,
      required this.detailValue,
      required this.onClick})
      : super(key: key);
  final String detailTitle, image;
  final Function onClick;
  final double detailValue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Material(
          elevation: 10,
          color: Color(0xFFFCF9C6),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Image(
                      image: AssetImage(image),
                    ),
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(detailTitle),
                    )),
                // SizedBox(
                //   width: size.width * 0.06,
                // ),
                Expanded(flex: 2, child: Text(detailValue.toString())),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Icon(Icons.arrow_forward_rounded),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
