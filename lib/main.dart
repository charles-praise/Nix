import 'package:flutter/rendering.dart';

import 'export.dart';

void main() {
  setupLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<NavigationCubit>()),
        BlocProvider(create: (context) => getIt<BottomNavigationBarCubit>()),
        BlocProvider(create: (context) => getIt<ShopCubit>()),
        BlocProvider(create: (context) => getIt<SearchCubit>()),
        BlocProvider(create: (context) => getIt<ProductCubit>()),
        BlocProvider(
            create: (context) => getIt<AuthCubit>()..checkRegistrationStatus()),
      ],
      child: const Splashscreen(),
    ),
  );
}

// ignore: must_be_immutable
class ShopLax extends StatefulWidget {
  const ShopLax({super.key});

  @override
  State<ShopLax> createState() => _ShopLaxState();
}

class _ShopLaxState extends State<ShopLax> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();

    scrollController.addListener(() {
      _updateNavigationBarVisibility(
          scrollController.position.userScrollDirection,
          context.read<BottomNavigationBarCubit>());
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthRegistered) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, child) {
              return BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthRegistered) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('welcome ${state.email}')));
                  }
                },
                builder: (context, state) {
                  return MaterialApp(
                    title: 'Nix',
                    onGenerateRoute: Routes.generateRoutes,
                    debugShowCheckedModeBanner: false,
                    home: SafeArea(
                      child: Scaffold(
                        key: scaffoldKey,
                        bottomNavigationBar: BlocBuilder<
                            BottomNavigationBarCubit, NavigationVisibility>(
                          builder: (context, state) {
                            return state == NavigationVisibility.visible
                                ? BlocBuilder<NavigationCubit, NavigationState>(
                                    builder: (context, state) {
                                      if (state is NavigationInitial) {
                                        return NavigationBar(
                                          selectedIndex: state.index,
                                          destinations: destination,
                                          onDestinationSelected: (value) {
                                            context
                                                .read<NavigationCubit>()
                                                .route(value);
                                          },
                                        );
                                      }
                                      return const SizedBox();
                                    },
                                  )
                                : const SizedBox();
                          },
                        ),
                        body: NotificationListener<ScrollNotification>(
                          onNotification: (ScrollNotification notification) {
                            return true;
                          },
                          child: BlocBuilder<NavigationCubit, NavigationState>(
                            builder: (context, state) {
                              if (state is NavigationInitial) {
                                return views[state.index];
                              }
                              return const SizedBox();
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        }

        return ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (context, child) {
            return MaterialApp(
              title: 'Nix',
              onGenerateRoute: Routes.generateRoutes,
              debugShowCheckedModeBanner: false,
              home: SafeArea(
                child: Scaffold(
                  key: scaffoldKey,
                  bottomNavigationBar: BlocBuilder<BottomNavigationBarCubit,
                      NavigationVisibility>(
                    builder: (context, state) {
                      return state == NavigationVisibility.visible
                          ? BlocBuilder<NavigationCubit, NavigationState>(
                              builder: (context, state) {
                                if (state is NavigationInitial) {
                                  return NavigationBar(
                                    selectedIndex: state.index,
                                    destinations: destination,
                                    onDestinationSelected: (value) {
                                      context
                                          .read<NavigationCubit>()
                                          .route(value);
                                    },
                                  );
                                }
                                return const SizedBox();
                              },
                            )
                          : const SizedBox();
                    },
                  ),
                  body: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification notification) {
                      return true;
                    },
                    child: BlocBuilder<NavigationCubit, NavigationState>(
                      builder: (context, state) {
                        if (state is NavigationInitial) {
                          return views[state.index];
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

final ScrollController scrollController = ScrollController();
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

List views = <Widget>[
  const Shop(),
  const Advertise(),
  Chat(),
  Profile(),
];

_updateNavigationBarVisibility(ScrollDirection scrollDirection,
    BottomNavigationBarCubit bottomNavigationBarCubit) {
  if (scrollDirection == ScrollDirection.reverse) {
    bottomNavigationBarCubit.updateVisibility(false);
  } else if (scrollDirection == ScrollDirection.forward) {
    bottomNavigationBarCubit.updateVisibility(true);
  }
}

List<NavigationDestination> destination = [
  NavigationDestination(
    icon: ImageIcon(
      AssetImage(Assets.bottomNavigationImage[10]),
      size: 26,
    ),
    label: 'Products',
    tooltip: 'Products',
    selectedIcon: ImageIcon(
      AssetImage(Assets.bottomNavigationImage[10]),
      color: Colors.deepPurple,
      size: 26,
    ),
  ),
  NavigationDestination(
    icon: ImageIcon(
      AssetImage(Assets.bottomNavigationImage[6]),
      size: 26,
    ),
    label: 'Advertise',
    tooltip: 'Advertise',
    selectedIcon: ImageIcon(
      AssetImage(Assets.bottomNavigationImage[6]),
      size: 26,
      color: Colors.deepPurple,
    ),
  ),
  NavigationDestination(
    icon: ImageIcon(
      AssetImage(Assets.bottomNavigationImage[4]),
      size: 26,
    ),
    label: 'Connections',
    tooltip: 'Connections',
    selectedIcon: ImageIcon(
      AssetImage(Assets.bottomNavigationImage[4]),
      color: Colors.deepPurple,
      size: 26,
    ),
  ),
  NavigationDestination(
    icon: ImageIcon(
      AssetImage(Assets.bottomNavigationImage[9]),
      size: 26,
    ),
    label: 'Profile',
    tooltip: 'Profile',
    selectedIcon: ImageIcon(
      AssetImage(Assets.bottomNavigationImage[9]),
      color: Colors.deepPurple,
      size: 26,
    ),
  ),
];
