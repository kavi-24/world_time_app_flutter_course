import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_location.dart';

class Home extends StatelessWidget {
  final String time;
  const Home({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    /*
    The contents inside a const must be non-variable
    */
    String isDay = time.contains("AM") ? "day" : "night";
    
    /*
    Split from :
    1st element -> hour

    if 6 < hour < 12 and contains AM
    or 12 < hour < 6 and contains PM
    */

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/$isDay.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            /*
            Main axis of a column -> vertical
            */
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => ChooseLocation()),
                    ),
                  );
                },
                child: const Column(
                  // icon button
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Choose Location",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                  // text
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                time,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
