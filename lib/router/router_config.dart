import 'package:animation/common/common_imports.dart';
import 'package:animation/model/product_model.dart';
import 'package:animation/router/router.dart';
import 'package:animation/screens/cart_page.dart';
import 'package:animation/screens/home_page.dart';
import 'package:animation/screens/navigation_bar.dart';
import 'package:animation/screens/product_page.dart';
import 'package:flutter/cupertino.dart';

final router = GoRouter(routes: [
  GoRoute(
    name: Routers.navigation.name,
    path: Routers.navigation.path,
    builder: (context, state) => const Navigation_Bar(),
  ),
  GoRoute(
    name: Routers.homepage.name,
    path: Routers.homepage.path,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    name: Routers.cartpage.name,
    path: Routers.cartpage.path,
    builder: (context, state) => const CartPage(),
  ),
  GoRoute(
    name: Routers.productpage.name,
    path: Routers.productpage.path,
    pageBuilder: (context, state) {
      return CupertinoPage(child: ProductPage(product: state.extra as Product));
    },
  )
]);
