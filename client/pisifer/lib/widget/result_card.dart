import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pisifer/data/topic.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({Key? key, required this.topic}) : super(key: key);
  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(
          '${topic.index}.',
          style: GoogleFonts.nunitoSans(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        title: Text(
          topic.title.capitalize(),
          style: GoogleFonts.nunitoSans(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        trailing: Text(
          '${topic.percent}%',
          style: GoogleFonts.nunitoSans(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
