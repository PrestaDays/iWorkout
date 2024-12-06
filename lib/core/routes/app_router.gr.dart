// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:iworkout/features/auth/presentation/pages/login_page.dart'
    as _i2;
import 'package:iworkout/features/workout/presentation/pages/home_page.dart'
    as _i1;
import 'package:iworkout/features/workout/presentation/screens/workout_day_screen.dart'
    as _i3;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}

/// generated route for
/// [_i3.WorkoutDayScreen]
class WorkoutDayRoute extends _i4.PageRouteInfo<WorkoutDayRouteArgs> {
  WorkoutDayRoute({
    _i5.Key? key,
    required String id,
    required String day,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          WorkoutDayRoute.name,
          args: WorkoutDayRouteArgs(
            key: key,
            id: id,
            day: day,
          ),
          initialChildren: children,
        );

  static const String name = 'WorkoutDayRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WorkoutDayRouteArgs>();
      return _i3.WorkoutDayScreen(
        key: args.key,
        id: args.id,
        day: args.day,
      );
    },
  );
}

class WorkoutDayRouteArgs {
  const WorkoutDayRouteArgs({
    this.key,
    required this.id,
    required this.day,
  });

  final _i5.Key? key;

  final String id;

  final String day;

  @override
  String toString() {
    return 'WorkoutDayRouteArgs{key: $key, id: $id, day: $day}';
  }
}
