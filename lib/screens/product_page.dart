import 'package:animation/common/common_color.dart';
import 'package:animation/common/common_imports.dart';
import 'package:animation/model/product_model.dart';
import 'package:animation/model/size_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final Product product;
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int selecteditem = 0;
  List<ShoesSize> size = [
    ShoesSize(id: 1, Size: "US 6"),
    ShoesSize(id: 2, Size: "US 7"),
    ShoesSize(id: 3, Size: "US 8"),
    ShoesSize(id: 4, Size: "US 9")
  ];
  int selectedcolor = 0;
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.black,
    Colors.deepPurple,
    Colors.pink
  ];
  int selectedphoto = 0;
  List<String> images = [
    'assets/product/shoe_thumb_1.png',
    'assets/product/shoe_thumb_3.png',
    'assets/product/shoe_thumb_4.png',
    'assets/product/shoe_thumb_5.png',
  ];

  late Product data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  void getdata() async {
    data = Product(
        id: widget.product.id,
        name: widget.product.name,
        category: widget.product.category,
        price: widget.product.price,
        isliked: widget.product.isliked,
        isSelected: widget.product.isSelected,
        image: widget.product.image);
  }

  @override
  Widget build(BuildContext context) {
    String selectedphotoname = data.image.toString();
    void changeimage(String image) {
      setState(() {
        selectedphotoname = image;
      });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: MyColors().mainColor,
        shape: const CircleBorder(),
        child: const Icon(
          CupertinoIcons.cart_badge_plus,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        icon: Icon(
                          CupertinoIcons.back,
                          size: 30,
                          color: Colors.grey.shade500,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.heart,
                          size: 30,
                          color: Colors.grey.shade500,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 15, right: 15),
                child: SizedBox(
                  height: 320,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            top: 100,
                            left: 180,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: MyColors().mainColor.withOpacity(0.2),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          MyColors().mainColor.withOpacity(0.4),
                                      blurRadius: 60.0,
                                      spreadRadius: 60.0, //extend the shadow
                                      offset: Offset(5.0, 0.0))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 250,
                            width: double.infinity,
                            child: Hero(
                                tag: data.name,
                                child: Image.asset(selectedphotoname)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: SizedBox(
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: images.length,
                            itemBuilder: (context, index) {
                              var data = images[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedphoto = index;
                                    changeimage(data);
                                    selectedphotoname = data;
                                  });
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 6, bottom: 6, right: 10),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: index == selectedphoto
                                                ? MyColors().mainColor
                                                : Colors.white)),
                                    child: SizedBox(
                                      width: 70,
                                      child: Image.asset(data),
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
              ),
              Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade400),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data.name,
                              style: const TextStyle(
                                  fontSize: 23,
                                  fontFamily: "Lora",
                                  fontWeight: FontWeight.w700),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "\$",
                                      style: TextStyle(
                                          color: MyColors().mainColor,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      data.price.toString(),
                                      style: const TextStyle(
                                          fontFamily: "Lora",
                                          fontWeight: FontWeight.w800,
                                          fontSize: 28),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.star_fill,
                                      size: 13,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                    Icon(
                                      CupertinoIcons.star_fill,
                                      size: 13,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                    Icon(
                                      CupertinoIcons.star_fill,
                                      size: 13,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                    Icon(
                                      CupertinoIcons.star_fill,
                                      size: 13,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                    Icon(
                                      CupertinoIcons.star_fill,
                                      size: 13,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 8),
                            child: Text(
                              'Available Sizes',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          )),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: size.length,
                          itemBuilder: (context, index) {
                            var data = size[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selecteditem = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: index == selecteditem
                                          ? MyColors().mainColor
                                          : Colors.white),
                                  child: Center(
                                    child: Text(
                                      data.Size,
                                      style: TextStyle(
                                          color: index == selecteditem
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 8),
                            child: Text(
                              'Color',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: colors.length,
                            itemBuilder: (context, index) {
                              var data = colors[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedcolor = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: index == selectedcolor
                                                ? MyColors().mainColor
                                                : Colors.white,
                                            width: 2)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: data,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: index == selectedcolor
                                          ? const Icon(
                                              Icons.done,
                                              color: Colors.white,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 8),
                            child: Text(
                              'Description',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          )),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 8),
                        child: SizedBox(
                          height: 110,
                          child: Text(
                            "Elit duis labore ad aute anim velit elit id eiusmod. Nisi culpa et proident qui Lorem ut nulla consectetur. Eu excepteur est quis duis elit irure magna laboris consequat laboris mollit cillum commodo do. Amet mollit ipsum ipsum et anim tempor irure laboris adipisicing ullamco fugiat. Laborum veniam eiusmod ad ad Lorem veniam labore enim laborum veniam. Duis Lorem do anim tempor irure amet occaecat mollit officia amet culpa nisi.lit duis labore ad aute anim velit elit id eiusmod. Nisi culpa et proident qui Lorem ut nulla consectetur. Eu excepteur est quis duis elit irure magna laboris consequat laboris mollit cillum commodo do. Amet mollit ipsum ipsum et anim tempor irure laboris adipisicing ullamco fugiat. Laborum veniam eiusmod ad ad Lorem veniam labore enim laborum veniam. Duis Lorem do anim tempor irure amet occaecat mollit officia amet culpa nisi.",
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
