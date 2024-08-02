import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sum_calculator/model/sumItem.dart';
import 'package:sum_calculator/screens/add_sum.dart';
import 'package:sum_calculator/screens/my_sum_list.dart';
import 'package:sum_calculator/screens/sum_result.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Summarization App',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        fontFamily: "BR Cobane",
        useMaterial3: true,
      ),
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const MySumList();
        },
      ),
      GoRoute(
        path: '/AddSum',
        builder: (BuildContext context, GoRouterState state) {
          return const AddSum();
        },
      ),
      GoRoute(
        path: '/SumResult',
        builder: (BuildContext context, GoRouterState state) {
          final sumItem = state.extra as SumItem;
          return SumResult(sumItem: sumItem);
        },
      ),
    ],
  );
}
