import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../common/sizes.dart';

class ContentListView extends StatelessWidget {
  const ContentListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 15,
      itemBuilder: (context, index) {
        return Padding(
          padding: right5,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: blueColor.withOpacity(0.5),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: all15,
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Prepare for your first skateboard jump',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Markaz Gasimov',
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.white),
                          ),
                          Text(
                            '125,928 views',
                            style: GoogleFonts.poppins(
                                fontSize: 13, color: Colors.white),
                          ),
                          Text(
                            '1 day ago',
                            style: GoogleFonts.poppins(
                                fontSize: 13, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: all10,
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
