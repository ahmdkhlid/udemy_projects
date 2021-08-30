// @dart=2.9
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_projects/layout/shop_app/cubit/cubit.dart';
import 'package:udemy_projects/layout/shop_app/shop_layout.dart';
import 'package:udemy_projects/shared/bloc_observer.dart';
import 'package:udemy_projects/shared/components/constants.dart';
import 'package:udemy_projects/shared/network/remote/dio_helper.dart';
import 'package:udemy_projects/z_cubit/cubit.dart';

import 'layout/news_app/cubit/cubit.dart';
import 'modules/shop_app/onboarding_screen/onboarding_screen.dart';
import 'modules/shop_app/shop_login/shop_login_screen.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/styles/themes.dart';
import 'z_cubit/states.dart';

// import 'modules/bmi/bmi_screen.dart';--
// import 'modules/login/login.dart';
// import 'modules/messenger_screen/messenger.dart';
// import 'modules/users_screen/users_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark');
  Widget widget;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');

  if (onBoarding != null) {
    if (token != null)
      widget = ShopLayout();
    else
      widget = ShopLoginScreen();
  } else
    widget = OnBoardingScreen();

  runApp(
    MyApp(
      isDark: isDark,
      startWidget: widget,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;

  MyApp({this.isDark, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AllAppCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => NewsCubit()..getBusiness(),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopAppCubit()
            ..getHomeData()
            ..getCategoriesData()
            ..getFavourites()
            ..getUserData(),
        ),
      ],
      child: BlocConsumer<AllAppCubit, AllAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            title: 'Flutter ',
            themeMode: ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
