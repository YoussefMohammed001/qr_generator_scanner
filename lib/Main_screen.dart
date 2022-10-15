import 'package:flutter/material.dart';
import 'package:qr_generator_scanner/generate_qr_code.dart';
import 'package:qr_generator_scanner/scan_qr_code.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index =0;

  List<Widget> screens = [GenerateQrCode(),ScanQrCode()];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(

          bottomNavigationBar: buildBottomNavigationBar(),
          body: Column(children: [

            screens[index]
          ],)
      ),
    );
  }

  Widget buildBottomNavigationBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black.withOpacity(.60),
      selectedFontSize: 16,
      unselectedFontSize: 15,

      onTap: (value) {

        index = value;
        setState(() {});
      },
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home_filled,),
        ),
        BottomNavigationBarItem(
          label: "Categories",
          icon: Icon(Icons.category_outlined),
        ),



      ],
    );
  }
}
