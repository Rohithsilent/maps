import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'BNB_controller.dart';


class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {

  @override
  Widget build(BuildContext context) {
    bnbController controller = Get.put(bnbController());
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,

      bottomNavigationBar: GNav(
        backgroundColor: Colors.blueGrey,
        color: Colors.black,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.grey.shade700,
        padding: EdgeInsets.all(16),
        tabMargin: EdgeInsets.all(15),
        gap: 8,
          onTabChange: (value){
              controller.index.value = value;
          },
          tabs: [
        GButton(icon: Icons.map_outlined,
          text: 'Maps',
        ),
        GButton(icon: Icons.add_location_alt_outlined,
        text: 'Geo coder',
        ),
      ]),
      body: Obx(()=>controller.pages[controller.index.value]),
    );
  }
}
