import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  /*
  At init, run a default WorldTime object.
  Then, go to Home page, displaying this default value
  */

  getTime() async {
    WorldTime asiaKolkata = WorldTime("India", "Asia/Kolkata", "india");
    await asiaKolkata.getTime();

    /*
    Navigator is used to navigate among pages/widgets
    */

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => Home(
              time: asiaKolkata.time,
            )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
