import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/sizes.dart';

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: verticalPadding10,
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )
      ),
    );
  }
}
