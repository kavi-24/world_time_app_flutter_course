/*
Send req to API (https://worldtimeapi.org/api/timezone/${timezoneCode})
Receive resp
Parse resp and fetch required details (time)
*/

/*
http - manage req and res
intl - handle date time
*/

import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String country;
  String timezone;
  String image;

  // We will receive time a little later
  // so since it is not initialized
  // we'll mark it as late
  late String time;

  WorldTime(this.country, this.timezone, this.image);

  /*
  Future
  async
  await
  */

  Future<void> getTime() async {
    try {
      Response response = await get(
          Uri.parse("https://worldtimeapi.org/api/timezone/$timezone"));
      Map data; // data can be of any type
      data = jsonDecode(response.body);
      DateTime dateTime = DateTime.parse(
          data["datetime"].toString().substring(0, 16).replaceAll("T", " "));
      time = DateFormat.jm().format(dateTime); // 5:08 PM
      // time = data["datetime"].toString().substring(11, 16);
    } catch (e) {
      print(e);
      time = "Failed to fetch time from server";
    }
  }
}

// void main(List<String> args) async {
//   WorldTime asiaKolkata = WorldTime("Asia/Kolkata");
//   await asiaKolkata.getTime();
//   print(asiaKolkata.time);
// }

/*
{"abbreviation":"IST","client_ip":"157.51.198.227","datetime":"2023-09-04T14:05:54.454489+05:30","day_of_week":1,
"day_of_year":247,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":19800,"timezone":"Asia/Kolkata",
"unixtime":1693816554,"utc_datetime":"2023-09-04T08:35:54.454489+00:00","utc_offset":"+05:30","week_number":36}
*/