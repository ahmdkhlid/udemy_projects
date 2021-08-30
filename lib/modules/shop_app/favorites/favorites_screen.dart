//@dart=2.9
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_projects/layout/shop_app/cubit/cubit.dart';
import 'package:udemy_projects/layout/shop_app/cubit/states.dart';
import 'package:udemy_projects/shared/components/components.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! ShopAppLoadingGetFavoritesState,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildListProduct(
                ShopAppCubit.get(context).favoritesModel.data.data[index],
                context),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10.0,
            ),
            itemCount:
                ShopAppCubit.get(context).favoritesModel.data.data.length,
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
