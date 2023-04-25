import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Controler/Home_Controler.dart';


class GoogleScreen extends StatefulWidget {
  const GoogleScreen({Key? key}) : super(key: key);

  @override
  State<GoogleScreen> createState() => _GoogleScreen();
}

class _GoogleScreen extends State<GoogleScreen> {
  Homecontroler homecontroler = Get.put(Homecontroler());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Location"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  var status = await Permission.location;
                  if (await status.isDenied) {
                    await Permission.location.request();
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text("Permission"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);
                  homecontroler.lat.value = position.latitude;
                  homecontroler.log.value = position.longitude;
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: Text("Location"),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(decoration:
                BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(5))),child: Text("${homecontroler.lat.value}",style: TextStyle(color: Colors.black),)),
              )),
              SizedBox(
                height: 10,
              ),
              Obx(() => Container(margin: EdgeInsets.all(10),decoration:
              BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(5))),child: Text("${homecontroler.log.value}",style: TextStyle(color: Colors.black),))),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.toNamed('locate');
        },child: Icon(Icons.location_on_outlined,color: Colors.white,),backgroundColor: Colors.black),
      ),
    );
  }
}