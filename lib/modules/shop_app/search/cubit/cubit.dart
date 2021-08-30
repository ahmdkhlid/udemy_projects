//@dart=2.9
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_projects/Models/shop_app/search_model.dart';
import 'package:udemy_projects/modules/shop_app/search/cubit/states.dart';
import 'package:udemy_projects/shared/components/constants.dart';
import 'package:udemy_projects/shared/network/end_points.dart';
import 'package:udemy_projects/shared/network/remote/dio_helper.dart';

class ShopAppSearchCubit extends Cubit<SearchStates> {
  ShopAppSearchCubit() : super(SearchInitialState());

  static ShopAppSearchCubit get(context) => BlocProvider.of(context);
  SearchModel model;

  void search(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {
        'text': text,
      },
    ).then((value) {
      model = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error) {
      emit(SearchErrorState());
    });
  }
}
