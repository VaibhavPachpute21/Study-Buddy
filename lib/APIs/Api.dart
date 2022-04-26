import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:study_buddy/global.dart' as global;

class StudyBuddyApis {
  static const server = "https://studybuddy-2acc8-default-rtdb.firebaseio.com/";

  getAllData(dept, year,sem) async {
    var response = await http.get(Uri.parse(server + "COMPUTER" + ".json"));
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse["$year"]["$sem"]);
    global.syllabus=jsonResponse["$year"]["$sem syllabus"].toString();
    return jsonResponse["$year"]["$sem"];
  }
}
