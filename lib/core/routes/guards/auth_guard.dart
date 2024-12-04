import 'package:auto_route/auto_route.dart';
import 'package:iworkout/core/routes/app_router.gr.dart';
import 'package:iworkout/features/auth/data/source/auth_firebase_service.dart';
import 'package:iworkout/service_locater.dart';


class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isLoggedIn = sl<AuthApiService>().isLoggedIn();
    print("isLoggedIn $isLoggedIn");
    if (isLoggedIn) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());

    }
  }
}