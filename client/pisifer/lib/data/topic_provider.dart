import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pisifer/data/pisifer_response.dart';

class TopicProvider {
  static Future<PisiferResponse> getTopics(String content) async {
    final _response = await _classifyTopic(content);
    PisiferResponse result = PisiferResponse.fromJson(jsonDecode(_response.body));
    return result;
  }

  static Future<http.Response> _classifyTopic(String content) {
    return http.post(
      Uri.parse('https://pisifer.herokuapp.com/topic-classification'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'text': content,
        'top': 7,
        'remove_num': true,
      }),
    );
  }
}
