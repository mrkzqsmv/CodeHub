// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app1/common/colors.dart';
import 'package:app1/common/paths.dart';
import 'package:app1/features/widgets/content_list_view.dart';
import 'package:flutter/material.dart';

import 'package:app1/common/sizes.dart';
import 'package:app1/features/widgets/appbar_title.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/subtitle_widget.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: scaffoldPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const appbar_title(title: 'Browse'),
              const SubtitleWidget(title: 'Most Viewed Articles'),
              const Expanded(
                flex: 3,
                child: ContentListView()
              ),
              const SubtitleWidget(title: 'Most Viewed Articles'),
              Expanded(
                flex: 5,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 6),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: AspectRatio(
                              aspectRatio: 16 / 14,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: const DecorationImage(
                                    image: AssetImage(bookmarkImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Padding(
                              padding: horizontalPadding10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'For My Project Needs',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.values[3],
                                    maxLines: 2,
                                  ),
                                  Text(
                                    'Markaz Gasimov',
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                                  Text(
                                    '125,928 views • 1 day ago',
                                    style: GoogleFonts.poppins(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: horizontalPadding5,
                              child: CircleAvatar(
                                backgroundColor: activeColor,
                                child: SvgPicture.asset(
                                  bookmarkActiveSvg,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
