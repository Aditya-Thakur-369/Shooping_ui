import 'package:animation/common/common_color.dart';
import 'package:animation/screens/cart_page.dart';
import 'package:animation/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation_Bar extends StatefulWidget {
  const Navigation_Bar({super.key});

  @override
  State<Navigation_Bar> createState() => _Navigation_BarState();
}

class _Navigation_BarState extends State<Navigation_Bar> {
  int selectedIndex = 0;
  Widget selected_screen = const HomePage();
  List<IconData> icondata = [
    CupertinoIcons.home,
    CupertinoIcons.search,
    CupertinoIcons.cart,
    CupertinoIcons.heart
  ];
  List<Widget> screens = [
    const HomePage(),
    const Center(
      child: Text("Search Page"),
    ),
    const CartPage(),
    const Center(
      child: Text("Liked Product Page"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: icondata.length,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      margin: EdgeInsets.only(
                          bottom: index == selectedIndex ? 20 : 0),
                      width: 60,
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                          color: index == selectedIndex
                              ? MyColors().mainColor
                              : null,
                          shape: BoxShape.circle),
                      child: Icon(
                        icondata[index],
                        size: 25,
                        color: index == selectedIndex
                            ? Colors.white
                            : Colors.grey.shade500,
                      ),
                    ),
                  ));
            },
          ),
        ),
      ),
      body: screens[selectedIndex],
    );
  }
}
