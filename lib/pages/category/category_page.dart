import 'package:flutter/material.dart';
import '../../components/appbar.dart';
import '../../components/product_list.dart';
import '../../components/sticky_ft.dart';
import '../../variables/colors.dart';
import '../category/widget/category-actions.dart';
import '../../components/menu/menu.dart';

class CategoryPage extends StatefulWidget {
  static const routeName = '/category';
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
 final GlobalKey<ScaffoldState> Ftkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    var ab = arg["categoryId"];
    print(ab.runtimeType);
    return SafeArea(
        child: Scaffold(
          key: Ftkey,
          drawer: const Drawer(
            backgroundColor: colorWhite,
            child: Menu(),
          ),
          appBar: buildAppBar(),
          body: Column(
            children: const [
              CategoryAction(),
              ProductItem(categoryId: 23),

            ],
          ),
          bottomSheet: SizedBox(
            height: 80,
            child: StickyFooter(Ftkey: Ftkey,),
          ) ,
        )
    );
  }
}