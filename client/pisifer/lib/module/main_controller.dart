import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pisifer/data/topic.dart';
import 'package:pisifer/data/topic_provider.dart';

class MainController extends GetxController {
  final TextEditingController contentController = TextEditingController();
  final topics = <Topic>[].obs;
  final isLoading = false.obs;
  getTopics() async {
    if (contentController.text.length < 20) {
      return;
    }
    isLoading.value = true;
    final result = await TopicProvider.getTopics(contentController.text);
    topics.value = result.topics;
    isLoading.value = false;
  }
}
