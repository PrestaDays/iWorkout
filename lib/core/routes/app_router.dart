import 'package:auto_route/auto_route.dart';
import 'package:iworkout/core/routes/guards/auth_guard.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
        path: "/",
        initial: true,
        page: HomeRoute.page,
        guards: [AuthGuard()]
    ),

    AutoRoute(path: "/login", page: LoginRoute.page),
  ];
}