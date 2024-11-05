import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingtask/core/const_data/app_colors.dart';
import 'binding/initial_bindings.dart';
import 'core/service/routes.dart';
import 'core/service/services.dart';
import 'core/service/media_query.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.primaryColor,
        appBarTheme: const AppBarTheme(backgroundColor: AppColor.primaryColor),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Lab Owner Registration',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
      builder: (context, child) {
        MediaQueryUtil.init(context);
        return child!;
      },
    );
  }
}
