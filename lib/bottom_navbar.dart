import 'package:dermat/screens/account_screen.dart';
import 'package:dermat/screens/home_screeen.dart';
import 'package:dermat/screens/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageindex = StateProvider<PageType>((ref) => PageType.home);

enum PageType {
  home,
  products,
  account,
}

class BottomNavbar extends ConsumerWidget {
  final List<Widget> pages = const [
    Home(),
    Products(),
    Account(),
  ];

  const BottomNavbar({super.key});

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
        icon: Icon(Icons.account_circle),
        label: 'Account',
      ),
    ];
    return Scaffold(
      body: pages[index.index],
      bottomNavigationBar: BottomNavigationBar(
        items: tabitems,
        currentIndex: index.index,
        onTap: (int tappedIndex) {
          ref.read(pageindex.notifier).state = PageType.values[tappedIndex];
        },
      ),
    );
  }
}