import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Controler/Home_Controler.dart';

class TrakeScreen extends StatefulWidget {
  const TrakeScreen({Key? key}) : super(key: key);

  @override
  State<TrakeScreen> createState() => _TrakeScreenState();
}

class _TrakeScreenState extends State<TrakeScreen> {
  Homecontroler homecontroler = Get.put(Homecontroler());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          markers: {
            Marker(
              draggable: true,
              markerId: MarkerId("naimish"),
              position:
              LatLng(homecontroler.lat.value, homecontroler.log.value),
            ),
          },
          initialCameraPosition: CameraPosition(
              target: LatLng(homecontroler.lat.value, homecontroler.log.value),
              zoom: 17),
        ),
      ),
    );
  }
}
