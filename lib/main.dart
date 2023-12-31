import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/pages/cart_page.dart';
import 'package:shoe_store/pages/checkout_page.dart';
import 'package:shoe_store/pages/checkout_success.dart';
import 'package:shoe_store/pages/detail_chat_page.dart';
import 'package:shoe_store/pages/edit_profile_page.dart';
import 'package:shoe_store/pages/home/main_page.dart';
import 'package:shoe_store/pages/poduct_page.dart';
import 'package:shoe_store/pages/sign_in_page.dart';
import 'package:shoe_store/pages/sign_up_page.dart';
import 'package:shoe_store/pages/splash_page.dart';
import 'package:shoe_store/providers/auth_provider.dart';
import 'package:shoe_store/providers/cart_provider.dart';
import 'package:shoe_store/providers/product_provider.dart';
import 'package:shoe_store/providers/wishlist_provider.dart';
import 'theme.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => const MainPage(),
          '/detail-chat': (context) => const DetailChatPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          // '/product': (context) => ProductPage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-success': (context) => const CheckoutSuccess(),
        },
      ),
    );
  }
}
