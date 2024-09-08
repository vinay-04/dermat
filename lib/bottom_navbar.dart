import 'package:dermat/screens/account_screen.dart';
import 'package:dermat/screens/home_screeen.dart';
import 'package:dermat/screens/kit.dart';
import 'package:dermat/screens/products.dart';
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
    Home(),
    Products(),
    Kit(),
    Account(),
  ];

  BottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(pageindex);
    final tabitems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.add_box_outlined),
        label: 'Products',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.backpack),
        label: 'Kit',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Account',
      ),
    ];
    return Scaffold(
      body: pages[index.index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Set the type to fixed
        items: tabitems,
        currentIndex: index.index,
        onTap: (int tappedIndex) {
          ref.read(pageindex.notifier).state = PageType.values[tappedIndex];
        },
      ),
    );
  }
}
