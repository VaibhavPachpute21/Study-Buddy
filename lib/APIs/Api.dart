import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class StudyBuddyApis {
  static const server = "https://studybuddy-2acc8-default-rtdb.firebaseio.com/";

  getAllData(dept, year,sem) async {
    var response = await http.get(Uri.parse(server + "$dept" + ".json"));
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse["$year"]);
    return jsonResponse["$year"]["$sem"];
  }
}
