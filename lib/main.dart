import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Screen/home_layout.dart';
import 'package:newsapp/helper/api.dart';
import 'package:newsapp/helper/cachHelper.dart';
import 'package:newsapp/news_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CachHelper.init();
  bool isDark = CachHelper.getMode('isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => NewsCubit()
                ..changeTheme(
                  charedMode: isDark,
                )),
          BlocProvider(
              create: (context) => NewsCubit()
                ..getApiDataBusiness()
                ..getApiDataScince()
                ..getApiDataSports()),
        ],
        child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var mode = NewsCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: const TextTheme(
                  headline2: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backwardsCompatibility: false,
                  backgroundColor: Colors.white,
                  textTheme: TextTheme(
                    headline1: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  elevation: 5.0,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  elevation: 20.0,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.black,
                ),
              ),
              darkTheme: ThemeData(
                inputDecorationTheme: InputDecorationTheme(
                  prefixIconColor: Colors.deepOrange,
                  suffixIconColor: Colors.deepOrange,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange),
                  ),
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                scaffoldBackgroundColor: Colors.black54,
                textTheme: const TextTheme(
                  headline2: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                appBarTheme: const AppBarTheme(
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backwardsCompatibility: false,
                  backgroundColor: Colors.black,
                  textTheme: TextTheme(
                    headline1: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  elevation: 5.0,
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.black,
                  elevation: 20.0,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.white,
                ),
              ),
              themeMode: mode.isDark ? ThemeMode.dark : ThemeMode.light,
              home: HomeNew(),
            );
          },
        ));
  }
}
