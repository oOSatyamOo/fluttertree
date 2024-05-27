import 'package:http/http.dart' as http;

void main() {
  /** . Flutter Logs Parse 
   * 
   * modify the script to perform a GET request on the route
   * https://logs/web-logs-raw which contains a portion of web server log. Each line begains with
   * a date. e.g. Apr 10 11:17:35. Your program should do the following:
   * 
   * Some of the log entries have a string that contains ?shareLinkId = [ID].
   * You should collect all the unique ID's from that string and reutrn all 
   * of them in string format with each ID on its own line. If an ID appears more than once,append:
   * N to the end of the ID where N is the number of times it appears
   * 
   * For example, your output could look like the following:
   * 
   * 69dff0hb32a0nv
   * tosrvsdse4v8q8q:3
   * 4esiramcsayu0:2
   * 
   * 
   * 
   */
  String result =
      """Apr 10 11:17:35 coderbyte app/web.3: IP_MASKED - - [10/Apr/2020:18:17:35 +0000] "GET /backend/requests/editor/placeholder?shareLinkId=69dff0hba0nv HTTP/1.1" 200 148 "https://coderbyte.com" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0
Apr 10 11:17:35 coderbyte heroku/router: at=info method=GET path="/backend/requests/editor/placeholder?key=s2fwad2Es2" host=coderbyte.com request_id=b19a87a1-1bbb-4e67-b207-bd9f23d46afa fwd="108.31.000.000" dyno=web.3 connect=0ms service=92ms status=200 bytes=3194 protocol=https

Apr 10 11:17:35 coderbyte heroku/router: at=info method=GET path="/backend/requests/editor/placeholder?shareLinkId=tosrve4v8q8q" host=coderbyte.com request_id=910b07d1-3f71-4347-a1a7-bfa20384ef65 fwd="108.31.000.000" dyno=web.2 connect=1ms service=17ms status=200 bytes=4435 protocol=https

Apr 10 11:17:35 coderbyte heroku/router: at=info method=GET path="/backend/requests/editor/placeholder?shareLinkId=tosrve4v8q8q" host=coderbyte.com request_id=097bf65e-e189-4f9f-9dfb-4758cff411b2 fwd="108.31.000.000" dyno=web.3 connect=1ms service=10ms status=200 bytes=4435 protocol=https

Apr 10 11:17:35 coderbyte app/web.2: IP_MASKED - - [10/Apr/2020:18:17:35 +0000] "GET /backend/requests/editor/placeholder?key=s2fwad2Es2 HTTP/1.1" 200 4263 "https://coderbyte.com" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36

Apr 10 11:17:35 coderbyte heroku/router: at=info method=GET path="/backend/requests/editor/placeholder?shareLinkId=4eiramcmayu0" host=coderbyte.com request_id=d48278c2-5731-464e-be38-ab9ad84ac4a8 fwd="108.31.000.000" dyno=web.4 connect=1ms service=7ms status=200 bytes=3194 protocol=https

Apr 10 11:17:35 coderbyte app/web.3: IP_MASKED - - [10/Apr/2020:18:17:35 +0000] "GET /backend/requests/editor/placeholder?shareLinkId=tosrve4v8q8q HTTP/1.1" 200 4263 "https://coderbyte.com" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36

Apr 10 11:17:35 coderbyte app/web.3: IP_MASKED - - [10/Apr/2020:18:17:35 +0000] "GET /backend/requests/editor/placeholder?shareLinkId=tosrve4v8q8q HTTP/1.1" 200 4263 "https://coderbyte.com" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36

Apr 10 11:17:36 coderbyte app/web.4: IP_MASKED - - [10/Apr/2020:18:17:35 +0000] "GET /backend/requests/editor/placeholder?shareLinkId=4eiramcmayu0 HTTP/1.1" 200 3023 "https://coderbyte.com" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36

Apr 10 11:17:36 coderbyte heroku/router: at=info method=GET path="/backend/requests/editor/placeholder?shareLinkId=tosrve4v8q8q" host=coderbyte.com request_id=8bb2413c-3c67-4180-8091-000313b8d9ca fwd="MASKED" dyno=web.3 connect=1ms service=32ms status=200 bytes=4435 protocol=https

Apr 10 11:17:36 coderbyte heroku/router: at=info method=GET path="/backend/requests/editor/placeholder?shareLinkId=tosrve4v8q8q" host=coderbyte.com request_id=10f93da3-2753-48a3-9485-857a93d8a88a fwd="MASKED" dyno=web.3 connect=1ms service=37ms status=200 bytes=4435 protocol=https""";

  RegExp regExp = RegExp(r'\?shareLinkId=([a-zA-Z0-9]+)');

  // Find all matches in the paragraph
  Iterable<RegExpMatch> matches = regExp.allMatches(result);

  // Extract the IDs and store them in a list
  List<String> ids = matches.map((match) => match.group(1)!).toList();

  // Print the list of IDs
//   print(ids); // Output: [123, 456, 789, 123]

  final map = Map();
  ids.forEach((element) {
    if (!map.containsKey(element)) {
      map[element] = 1;
    } else {
      map[element] += 1;
    }
  });
  regExp = RegExp(r',: 1');
  print(map.toString().replaceAll(': 1', '\n'));

  // // Find all matches in the paragraph
  // Iterable<RegExpMatch> matches1 = regExp.allMatches(map.toString());

  // // Extract the IDs and store them in a list
  // List<String> ids1 = matches.map((match) =>      match.group(1)!).toList();

  // // Print the list of IDs
  // print(ids); // Output:
}

//  Future<String> getLogs() async=>await getData('/challenges/logs/web-logs-raw');

//Accept
Future<http.Response> callCamServer(String endPoint, String contentType) async {
  try {
    final response = await http.get(
        Uri.parse('https://coderbyte.com/api' + endPoint),
        headers: {'Content-type': contentType});

    if (response.statusCode == 200) {
      return response;
    } else {
      throw ServerException(
          response.statusCode, 'Failed to get Response From Server');
    }
  } on Exception {
    throw InternetException('Something Went wrong while connecting The Server');
  }
}

// Future<T> getData<T>(String endpoint) async {
//     try{

//       final res=await callCamServer(endpoint,'text/plain');
//       return fromJson(json.decode(res.body));
//     } on ServerException {
//       return fromJson({});
//     }on Exception {
//       return fromJson({});
//     }
//   }

class ServerException implements Exception {
  final int statusCode;
  final String msg;

  ServerException(this.statusCode, this.msg);
}

class TokenExpiredException implements Exception {}

class SocketException implements Exception {}

class CacheException implements Exception {}

class InternetException implements Exception {
  final String msg;

  InternetException(this.msg);
}
/**
 *Apr 10 11:17:35 coderbyte app/web.3: IP_MASKED - - [10/Apr/2020:18:17:35 +0000] "GET /backend/requests/editor/placeholder?shareLinkId=69dff0hba0nv HTTP/1.1" 200 148 "https://coderbyte.com" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0
Apr 10 11:17:35 coderbyte heroku/router: at=info method=GET path="/backend/requests/editor/placeholder?key=s2fwad2Es2" host=coderbyte.com request_id=b19a87a1-1bbb-4e67-b207-bd9f23d46afa fwd="108.31.000.000" dyno=web.3 connect=0ms service=92ms status=200 bytes=3194 protocol=https

Apr 10 11:17:35 coderbyte heroku/router: at=info method=GET path="/backend/requests/editor/placeholder?shareLinkId=tosrve4v8q8q" host=coderbyte.com request_id=910b07d1-3f71-4347-a1a7-bfa20384ef65 fwd="108.31.000.000" dyno=web.2 connect=1ms service=17ms status=200 bytes=4435 protocol=https

Apr 10 11:17:35 coderbyte heroku/router: at=info method=GET path="/backend/requests/editor/placeholder?shareLinkId=tosrve4v8q8q" host=coderbyte.com request_id=097bf65e-e189-4f9f-9dfb-4758cff411b2 fwd="108.31.000.000" dyno=web.3 connect=1ms service=10ms status=200 bytes=4435 protocol=https

Apr 10 11:17:35 coderbyte app/web.2: IP_MASKED - - [10/Apr/2020:18:17:35 +0000] "GET /backend/requests/editor/placeholder?key=s2fwad2Es2 HTTP/1.1" 200 4263 "https://coderbyte.com" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36

Apr 10 11:17:35 coderbyte heroku/router: at=info method=GET path="/backend/requests/editor/placeholder?shareLinkId=4eiramcmayu0" host=coderbyte.com request_id=d48278c2-5731-464e-be38-ab9ad84ac4a8 fwd="108.31.000.000" dyno=web.4 connect=1ms service=7ms status=200 bytes=3194 protocol=https

Apr 10 11:17:35 coderbyte app/web.3: IP_MASKED - - [10/Apr/2020:18:17:35 +0000] "GET /backend/requests/editor/placeholder?shareLinkId=tosrve4v8q8q HTTP/1.1" 200 4263 "https://coderbyte.com" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36

Apr 10 11:17:35 coderbyte app/web.3: IP_MASKED - - [10/Apr/2020:18:17:35 +0000] "GET /backend/requests/editor/placeholder?shareLinkId=tosrve4v8q8q HTTP/1.1" 200 4263 "https://coderbyte.com" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36

Apr 10 11:17:36 coderbyte app/web.4: IP_MASKED - - [10/Apr/2020:18:17:35 +0000] "GET /backend/requests/editor/placeholder?shareLinkId=4eiramcmayu0 HTTP/1.1" 200 3023 "https://coderbyte.com" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36

Apr 10 11:17:36 coderbyte heroku/router: at=info method=GET path="/backend/requests/editor/placeholder?shareLinkId=tosrve4v8q8q" host=coderbyte.com request_id=8bb2413c-3c67-4180-8091-000313b8d9ca fwd="MASKED" dyno=web.3 connect=1ms service=32ms status=200 bytes=4435 protocol=https

Apr 10 11:17:36 coderbyte heroku/router: at=info method=GET path="/backend/requests/editor/placeholder?shareLinkId=tosrve4v8q8q" host=coderbyte.com request_id=10f93da3-2753-48a3-9485-857a93d8a88a fwd="MASKED" dyno=web.3 connect=1ms service=37ms status=200 bytes=4435 protocol=https
*/
