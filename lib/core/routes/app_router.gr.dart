// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:iworkout/features/auth/presentation/pages/enter_user_informations_page.dart'
    as _i2;
import 'package:iworkout/features/auth/presentation/pages/login_page.dart'
    as _i4;
import 'package:iworkout/features/workout/presentation/pages/add_workout_page.dart'
    as _i1;
import 'package:iworkout/features/workout/presentation/pages/home_page.dart'
    as _i3;
import 'package:iworkout/features/workout/presentation/pages/workout_day_page.dart'
    as _i5;

/// generated route for
/// [_i1.AddWorkoutPage]
class AddWorkoutRoute extends _i6.PageRouteInfo<void> {
  const AddWorkoutRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AddWorkoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddWorkoutRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddWorkoutPage();
    },
  );
}

/// generated route for
/// [_i2.EnterUserInformationsPage]
class EnterUserInformationsRoute extends _i6.PageRouteInfo<void> {
  const EnterUserInformationsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          EnterUserInformationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterUserInformationsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.EnterUserInformationsPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginPage();
    },
  );
}

/// generated route for
/// [_i5.WorkoutDayPage]
class WorkoutDayRoute extends _i6.PageRouteInfo<WorkoutDayRouteArgs> {
  WorkoutDayRoute({
    _i7.Key? key,
    required String id,
    required String day,
    List<_i6.PageRouteInfo>? children,
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

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WorkoutDayRouteArgs>();
      return _i5.WorkoutDayPage(
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

  final _i7.Key? key;

  final String id;

  final String day;

  @override
  String toString() {
    return 'WorkoutDayRouteArgs{key: $key, id: $id, day: $day}';
  }
}
