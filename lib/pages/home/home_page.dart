import 'package:flutter/material.dart';
import '../../components/appbar.dart';
import '../../variables/colors.dart';
import '../../components/sticky_ft.dart';
import '../../components/menu/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> Ftkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          key: Ftkey,
          drawer: const Drawer(
            backgroundColor: colorWhite,
            child: Menu(),
          ),
            appBar: buildAppBar(),
          body: Text('abc'),
          bottomSheet: SizedBox(
            height: 80,
            child: StickyFooter(Ftkey: Ftkey,),
          ) ,
        )
    );
  }
}
