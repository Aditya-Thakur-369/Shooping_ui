import 'package:animation/common/common_color.dart';
import 'package:animation/common/common_imports.dart';
import 'package:animation/model/product.dart';
import 'package:animation/model/product_model.dart';
import 'package:animation/router/router.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../model/catagory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool liked = false;
  int selectedIndex = 0;
  List<Catagory> catagory = [
    Catagory(
        id: 1, name: "Sneakers", image: "assets/shoe.png", isSelected: false),
    Catagory(
        id: 2, name: "Watch", image: "assets/watch.png", isSelected: false),
    Catagory(
        id: 3, name: "Jacket", image: "assets/jacket.png", isSelected: false),
  ];
  int selectedProductIndex = 0;

  List<String> tags = [
    "Trending Now",
    "Best Selling",
  ];

  final ItemScrollController _itemScrollController = ItemScrollController();

  void _scrollToIndex(int index) {
    _itemScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const RotatedBox(
                      quarterTurns: 0,
                      child: Icon(
                        Icons.sort,
                        color: Colors.grey,
                        size: 30,
                      )),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/product/user.png"))),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Our",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 40,
                          fontFamily: "Lora"),
                    ),
                    const Text(
                      "Products",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          fontFamily: 'Lora'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: CupertinoTextFormFieldRow(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            placeholder: "Search Products",
                            placeholderStyle:
                                TextStyle(color: Colors.grey.shade400),
                            showCursor: false,
                            prefix: Icon(
                              CupertinoIcons.search,
                              size: 25,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        CupertinoButton(
                            child: const Icon(
                              Icons.filter_list,
                              color: Colors.black,
                            ),
                            onPressed: () {}),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 20, left: 20),
              child: SizedBox(
                height: 55,
                width: double.infinity,
                child: ScrollablePositionedList.builder(
                  itemScrollController: _itemScrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: catagory.length,
                  itemBuilder: (context, index) {
                    var data = catagory[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          if (selectedIndex != catagory.length - 1) {
                            _scrollToIndex(selectedIndex);
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                                border: index == selectedIndex
                                    ? Border.all(color: MyColors().mainColor)
                                    : null,
                                borderRadius: BorderRadius.circular(20)),
                            child: SizedBox(
                              height: 50,
                              width: 135,
                              child: Row(
                                children: [
                                  Image.asset(data.image),
                                  FittedBox(
                                    child: Text(
                                      data.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15,
                                          fontFamily: "Lora"),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 20, left: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4 - 30,
                width: double.infinity,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: ProductList().product.length,
                  itemBuilder: (context, index) {
                    var data = ProductList().product[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          var sendinfo = Product(
                              id: data.id,
                              name: data.name,
                              category: data.category,
                              price: data.price,
                              isliked: data.isliked,
                              isSelected: data.isSelected,
                              image: data.image);

                          GoRouter.of(context).pushNamed(
                            Routers.productpage.name,
                            extra: sendinfo,
                          );
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          child: SizedBox(
                            width: 250,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(
                                      onPressed: () {
                                        if (data.isliked == false) {
                                          setState(() {
                                            data.isliked = true;
                                          });
                                        } else if (data.isliked == true) {
                                          setState(() {
                                            data.isliked = false;
                                          });
                                        }
                                      },
                                      icon: Icon(
                                        data.isliked
                                            ? CupertinoIcons.heart_fill
                                            : CupertinoIcons.heart,
                                        color: Colors.grey,
                                        size: 30,
                                      )),
                                ),
                                Stack(
                                  children: [
                                    Positioned(
                                      top: 70,
                                      left: 110,
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: MyColors()
                                              .mainColor
                                              .withOpacity(0.2),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: MyColors()
                                                    .mainColor
                                                    .withOpacity(0.4),
                                                blurRadius: 50.0,
                                                spreadRadius:
                                                    60.0, //extend the shadow
                                                offset: Offset(5.0, 0.0))
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 200,
                                      child: Hero(
                                        tag:  data.name,
                                        child: Image.asset(
                                          data.image,
                                          scale: 0.2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  data.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Lora"),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  index == 0
                                      ? tags[0]
                                      : index == 1
                                          ? tags[1]
                                          : ' ',
                                  style: TextStyle(
                                      color: MyColors().mainColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text.rich(TextSpan(children: <InlineSpan>[
                                  TextSpan(
                                      text: "\$",
                                      style: TextStyle(
                                          color: MyColors().mainColor)),
                                  TextSpan(
                                    text: "${data.price}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
