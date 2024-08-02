import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sum_calculator/colors.dart';
import 'package:sum_calculator/model/sumItem.dart';
import 'package:sum_calculator/screens/initial_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(SumItemAdapter());
  await Hive.openBox<SumItem>('sumItem');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: yellowColor),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false, // Disable the debug banner
        home: const InitialScreen(),
      ),
    );
  }
}
