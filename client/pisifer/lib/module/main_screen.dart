import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pisifer/data/topic_provider.dart';
import 'package:pisifer/module/main_controller.dart';
import 'package:pisifer/widget/result_card.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final _controller = Get.put<MainController>(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 56),
        child: Column(
          children: [
            TextField(
              minLines: 5,
              maxLines: 10,
              controller: _controller.contentController,
              style: GoogleFonts.nunitoSans(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: 'Type anything...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                _controller.getTopics();
              },
              child: Obx(
                () => _controller.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.black)
                    : Text(
                        'Pisifer!',
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ResultCard(
                      topic: _controller.topics[index],
                    );
                  },
                  itemCount: _controller.topics.length),
            ),
          ],
        ),
      ),
    );
  }
}
