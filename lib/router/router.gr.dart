// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditProfileScreen(
          key: args.key,
          userName: args.userName,
          userEmail: args.userEmail,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    MortgageCalculatorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MortgageCalculatorScreen(),
      );
    },
    MortgageResultRoute.name: (routeData) {
      final args = routeData.argsAs<MortgageResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MortgageResultScreen(
          key: args.key,
          propertyValue: args.propertyValue,
          initialFee: args.initialFee,
          term: args.term,
          rate: args.rate,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
  };
}

/// generated route for
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    Key? key,
    required String userName,
    required String userEmail,
    List<PageRouteInfo>? children,
  }) : super(
          EditProfileRoute.name,
          args: EditProfileRouteArgs(
            key: key,
            userName: userName,
            userEmail: userEmail,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<EditProfileRouteArgs> page =
      PageInfo<EditProfileRouteArgs>(name);
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({
    this.key,
    required this.userName,
    required this.userEmail,
  });

  final Key? key;

  final String userName;

  final String userEmail;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, userName: $userName, userEmail: $userEmail}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MortgageCalculatorScreen]
class MortgageCalculatorRoute extends PageRouteInfo<void> {
  const MortgageCalculatorRoute({List<PageRouteInfo>? children})
      : super(
          MortgageCalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'MortgageCalculatorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MortgageResultScreen]
class MortgageResultRoute extends PageRouteInfo<MortgageResultRouteArgs> {
  MortgageResultRoute({
    Key? key,
    required double propertyValue,
    required double initialFee,
    required int term,
    required double rate,
    List<PageRouteInfo>? children,
  }) : super(
          MortgageResultRoute.name,
          args: MortgageResultRouteArgs(
            key: key,
            propertyValue: propertyValue,
            initialFee: initialFee,
            term: term,
            rate: rate,
          ),
          initialChildren: children,
        );

  static const String name = 'MortgageResultRoute';

  static const PageInfo<MortgageResultRouteArgs> page =
      PageInfo<MortgageResultRouteArgs>(name);
}

class MortgageResultRouteArgs {
  const MortgageResultRouteArgs({
    this.key,
    required this.propertyValue,
    required this.initialFee,
    required this.term,
    required this.rate,
  });

  final Key? key;

  final double propertyValue;

  final double initialFee;

  final int term;

  final double rate;

  @override
  String toString() {
    return 'MortgageResultRouteArgs{key: $key, propertyValue: $propertyValue, initialFee: $initialFee, term: $term, rate: $rate}';
  }
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
