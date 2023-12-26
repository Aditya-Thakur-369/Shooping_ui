import 'package:animation/common/common_imports.dart';
import 'package:animation/model/product_model.dart';
import 'package:animation/router/router.dart';
import 'package:animation/screens/product_page.dart';

import '../common/common_color.dart';
import '../model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                    decoration: BoxDecoration(
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
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shopping",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 40,
                            fontFamily: "Lora"),
                      ),
                      Text(
                        "Cart",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            fontFamily: 'Lora'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.delete,
                        size: 30,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 20, left: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
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
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: 250,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: 130,
                                  child: Hero(
                                    tag: data.name,
                                    child: Image.asset(
                                      data.image,
                                      scale: 0.2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 5, right: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.name,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Lora"),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text.rich(TextSpan(children: <InlineSpan>[
                                        TextSpan(
                                            text: "\$ ",
                                            style: TextStyle(
                                                color: MyColors().mainColor)),
                                        TextSpan(
                                          text: "${data.price}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ]))
                                    ],
                                  ),
                                ),
                                const Text(
                                  "x1",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lora'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 25, right: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "3 Items",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Lora",
                        color: Colors.grey.shade400),
                  ),
                  const Text("\$650.00",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lora"))
                ],
              ),
            ),
            CupertinoButton(
                color: MyColors().mainColor,
                alignment: Alignment.center,
                borderRadius: BorderRadius.circular(15),
                child: const Padding(
                  padding: EdgeInsets.only(left: 110, right: 110),
                  child: Text("Next",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "Lora")),
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
