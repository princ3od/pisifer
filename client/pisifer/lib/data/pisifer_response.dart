import 'package:pisifer/data/topic.dart';

class PisiferResponse {
  late String processedText;
  late List<dynamic> rawOutput;
  List<Topic> topics = [];
  PisiferResponse({required this.processedText, required this.rawOutput});
  PisiferResponse.fromJson(dynamic json) {
    processedText = json["processed_text"];
    rawOutput = json["output"] as List<dynamic>;
    for (var i = 0; i < rawOutput.length; i++) {
      final topicString = rawOutput[i].keys.elementAt(0);
      final percent = rawOutput[i][topicString] * 100;
      Topic topic = Topic(index: i + 1, title: topicString, percent: percent);
      topics.add(topic);
    }
  }
}
