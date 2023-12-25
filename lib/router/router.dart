class AppRouter {
  String name;
  String path;
  AppRouter({
    required this.name,
    required this.path,
  });
}

class Routers {
  static AppRouter navigation = AppRouter(name: '/', path: '/');
  static AppRouter homepage = AppRouter(name: 'home', path: '/home');
  static AppRouter cartpage = AppRouter(name: 'cart', path: '/cart');
  static AppRouter productpage = AppRouter(name: 'product', path: '/product');
}
