import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core_datz/flutter_core_datz.dart';

import '../../routes/app_router.dart';

@RoutePage()
class AllView extends StatelessWidget {
  const AllView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All View')),
      body: ListView.builder(
        itemCount: appRouter.routes.length,
        itemBuilder: (context, index) {
          final route = appRouter.routes[index];

          return buildListTitle(route);
        },
      ),
    );
  }

  Widget buildListTitle(AutoRoute route) => Builder(
    builder: (context) {
      if (route.children.isNotNullAndEmpty) {
        return ExpansionTile(
          title: Text(route.name),
          children:
              (route.children)!.map((subRoute) {
                if (subRoute.children.isNotNullAndEmpty) return buildListTitle(subRoute);
                return ListTile(title: Text(subRoute.name), onTap: () => navigator(context, subRoute));
              }).toList(),
        );
      }

      return ListTile(title: Text(route.name), onTap: () => navigator(context, route));
    },
  );

  Future<T?> navigator<T>(BuildContext context, AutoRoute route) {
    final data = RouteData.of(context);
    return Navigator.of(context).push(MaterialPageRoute(builder: (context) => Scaffold(body: route.page.builder(data))));
  }
}
