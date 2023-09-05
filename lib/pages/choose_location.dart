/*
List of buttons with each country name
Here, we'll have only a few.
*/

import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

import 'home.dart';

class ChooseLocation extends StatelessWidget {
  ChooseLocation({super.key});

  final List<WorldTime> countryTimeZone = [
    WorldTime("London", "Europe/London", "uk"),
    WorldTime("Athens", "Europe/Berlin", "greece"),
    WorldTime("Cairo", "Africa/Cairo", "egypt"),
    WorldTime("Nairobi", "Africa/Nairobi", "kenya"),
    WorldTime("Chicago", "America/Chicago", "usa"),
    WorldTime("New York", "America/New_York", "usa"),
    WorldTime("Seoul", "Asia/Seoul", "south_korea"),
    WorldTime("Jakarta", "Asia/Jakarta", "indonesia"),
    WorldTime("India", "Asia/Kolkata", "india"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose location"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemCount: countryTimeZone.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                WorldTime instance = countryTimeZone[index];
                await instance.getTime();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Home(
                          time: instance.time,
                        )),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(),
                ),
                child: Row(
                  /*
                  Main axis alignment of row -> horizontal
                  */
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/${countryTimeZone[index].image.toString()}.png",
                      width: 30,
                      height: 30,
                    ),
                    Text(countryTimeZone[index].country.toString()),
                    const Icon(Icons.arrow_right_alt),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
