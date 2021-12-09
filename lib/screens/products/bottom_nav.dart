import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/states.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class BottomNav extends StatefulWidget {
  final String? token;
  BottomNav(this.token);

  @override
  _BottomNavState createState() => _BottomNavState(token);
}

class _BottomNavState extends State<BottomNav> {
  final String? token;

  _BottomNavState(this.token);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (BuildContext context, state) {},
        builder: (context, state){

          final items = [
            const Icon(Icons.shopping_cart_outlined, size: 30),
            const Icon(Icons.person_outlined, size: 30),
          ];
          var cubit = ShopCubit.get(context);

          return Scaffold(
            body: cubit.bottomsScreens[cubit.currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              height: 60,
              onTap: (index){
                cubit.changeBottom(index);
              },
              index: cubit.currentIndex,
              items: items,
            ),
          );
        },
      )
    );
  }
}
