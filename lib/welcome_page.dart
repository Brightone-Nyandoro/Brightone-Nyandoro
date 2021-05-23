import 'package:cut_school_map/ui/custom_components/rounded_button.dart';
import 'package:cut_school_map/ui/home/home.dart';
import 'package:cut_school_map/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            //Positioned(bottom: 3, child: imageDisplay),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.05),
                Image.asset(
                  "assets/images/cut_launcher.jpg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.05),
                RoundedButton(
                  color: Colors.blueGrey,
                  text: "NAVIGATE",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
