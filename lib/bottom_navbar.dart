import 'package:dermat/screens/antiaging_screen.dart';
import 'package:dermat/screens/hair_screen.dart';
import 'package:dermat/screens/skincare_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageindex = StateProvider<PageType>((ref) => PageType.home);

enum PageType {
  home,
  products,
  kit,
  account,
}

class BottomNavbar extends ConsumerWidget {
  final List<Widget> pages = [
    HairScreen(),
    SkincareScreen(),
    AntiagingScreen(),
    // Account(),
  ];

  BottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(pageindex);
    final tabitems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Hair',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.boy_rounded),
        label: 'SkinCare',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.elderly),
        label: 'Antiaging',
      ),
      // const BottomNavigationBarItem(
      //   icon: Icon(Icons.account_circle),
      //   label: 'Account',
      // ),
    ];
    return Scaffold(
      body: pages[index.index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: tabitems,
        currentIndex: index.index,
        selectedItemColor: const Color(0xFFFF6347),
        onTap: (int tappedIndex) {
          ref.read(pageindex.notifier).state = PageType.values[tappedIndex];
        },
      ),
    );
  }
}
