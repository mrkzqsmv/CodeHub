//Dashboard Screen is a discover screen

import 'package:app1/common/paths.dart';
import 'package:app1/common/sizes.dart';
import 'package:app1/features/widgets/appbar_title.dart';
import 'package:app1/features/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/colors.dart';
import '../../widgets/content_list_view.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: horizontalPadding10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const appbar_title(title: 'Discover'),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: horizontalPadding5,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              profileImage,
                            ),
                            radius: 30,
                          ),
                          Padding(
                            padding: top10,
                            child: Text('Budi'),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SubtitleWidget(title: 'Most Viewed Articles'),
              const Expanded(
                flex: 2,
                child: ContentListView(),
              ),
              const SubtitleWidget(title: 'Most Viewed Codes'),
              const Expanded(
                flex: 2,
                child: ContentListView(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
