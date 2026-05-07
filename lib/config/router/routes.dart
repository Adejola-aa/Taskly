// routes.dart

class AppRoutes {
  static const logIn = '/log-in';
  static const splash = '/splash-screen';
  static const otpVerification = '/otp-verification';
  static const forgetPassword = '/forget-password';
  static const resetPassword = '/reset-password';

  // --- Protected Routes ---
  static const users = '/users';
  static const profile = '/profile';

  //--- Dasboard Tabs ---
  static const dashboard = '/dashboard';
  static const allProducts = 'all-products';
  static const createProduct = 'create-product';
  static const productDetail = 'product-detail';

  //---Orders Tab ---
  static const orders = '/product-orders';
  static const orderDetail = 'order-detail';
}

// route names
class RouteNames {
  static const String otp = 'otp';
  static const String login = 'login';
  static const String splash = 'splash';
  static const String forgetPassword = 'forget_password';
  static const String resetPassword = 'reset_password';

  // --- Protected Route Names
  static const String users = 'users';
  static const String profile = 'profile';

  //--- Dashboard TabName ---
  static const String dashboard = 'dashboard';
  static const String allProducts = 'all_products';
  static const String createProduct = 'create_products';
  static const String productDetail = 'product_details';
  static const String updateProduct = 'update_products';

  //---Orders TabName ---
  static const String orders = 'product_orders';
  static const String orderDetail = 'order_details';
}
