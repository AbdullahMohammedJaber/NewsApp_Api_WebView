import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Screen/search.dart';
import 'package:newsapp/helper/api.dart';
import 'package:newsapp/news_cubit.dart';

class HomeNew extends StatelessWidget {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Search()));
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  NewsCubit.get(context).changeTheme();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          body: NewsCubit.get(context)
              .Screen[NewsCubit.get(context).currentindex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

            currentIndex: NewsCubit.get(context).currentindex,
            onTap: (index) {
              if (index == 1) {
                NewsCubit.get(context).getApiDataSports();
              } else if (index == 2) {
                NewsCubit.get(context).getApiDataScince();
              } else if (index == 3) {}
              NewsCubit.get(context).ChangeNavBar(index);
            },
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              // ignore: prefer_const_constructors
              BottomNavigationBarItem(
                  icon: Icon(Icons.business), label: 'business'),
              // ignore: prefer_const_constructors
              BottomNavigationBarItem(
                  // ignore: prefer_const_constructors
                  icon: Icon(Icons.sports),
                  label: 'sports'),
              // ignore: prefer_const_constructors
              BottomNavigationBarItem(
                  // ignore: prefer_const_constructors
                  icon: Icon(Icons.science),
                  label: 'Sciences'),
              // ignore: prefer_const_constructors
              BottomNavigationBarItem(
                  // ignore: prefer_const_constructors
                  icon: Icon(Icons.settings),
                  label: 'settings'),
            ],
          ),
        );
      },
    );
  }
}
