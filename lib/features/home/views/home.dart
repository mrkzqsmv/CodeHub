import 'package:app1/features/bookmark/views/bookmark.dart';
import 'package:app1/features/browse/views/browse.dart';
import 'package:app1/common/paths.dart';
import 'package:app1/features/dashboard/views/dashboard.dart';
import 'package:app1/features/more/views/more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../profile/views/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> list= const[
    Dashboard(),
    Browse(),
    Bookmark(),
    More()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,  
        elevation: 20,
        selectedLabelStyle: const TextStyle(
          color: Colors.purple,
        ),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
        ),
        onTap: (value){
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(homeDeactiveSvg),
            activeIcon: SvgPicture.asset(homeActiveSvg),
            label: 'Home',    
            tooltip: 'Home',    
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(browseDeactiveSvg),
            activeIcon: SvgPicture.asset(browseActiveSvg),
            label: 'Browse',
            tooltip: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(bookmarkDeactiveSvg),
            activeIcon: SvgPicture.asset(bookmarkActiveSvg),
            label: 'Bookmark',
            tooltip: 'Bookmark'
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(userDeactiveSvg),
            activeIcon: SvgPicture.asset(userActiveSvg),
            label: 'More',
            tooltip: 'More',
          ),
        ],
      ),
    );
  }
}
