// @dart=2.9
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_projects/layout/news_app/cubit/states.dart';
import 'package:udemy_projects/modules/news_app/business_screen/business_screen.dart';
import 'package:udemy_projects/modules/news_app/science_screen/science_screen.dart';
import 'package:udemy_projects/modules/news_app/sports_screen/sports_screen.dart';
import 'package:udemy_projects/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();

    emit(NewBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'da745ac90cbc4106a8fa6fe501087179'
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError(
      (error) {
        print(error.toString());
        emit(
          NewsGetBusinessErrorState(
            error.toString(),
          ),
        );
      },
    );
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': 'da745ac90cbc4106a8fa6fe501087179'
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError(
        (error) {
          print(error.toString());
          emit(
            NewsGetSportsErrorState(
              error.toString(),
            ),
          );
        },
      );
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetBusinessLoadingState());
    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'da745ac90cbc4106a8fa6fe501087179'
        },
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError(
        (error) {
          print(error.toString());
          emit(
            NewsGetScienceErrorState(
              error.toString(),
            ),
          );
        },
      );
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
