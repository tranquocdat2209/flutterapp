import 'package:flutter/material.dart';
import '../variables/colors.dart';
class StickyFooter extends StatelessWidget {
 const StickyFooter({
    super.key,
    required GlobalKey<ScaffoldState> Ftkey,
  }) : _Ftkey = Ftkey;

  final GlobalKey<ScaffoldState> _Ftkey;
  @override
   Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 20,
              color: Colors.white,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 60,
              decoration: const BoxDecoration(
                color: colorWhite,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    blurRadius: 10.0,
                    offset: Offset(0,-5),
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  InkWell(
                    onTap: (){
                    },
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image.asset("images/bill.png"),
                      const SizedBox(height: 5),
                      const Text('Đơn mua', style: TextStyle(color: colorTheme, fontSize: 12))
                    ]),
                  ),
                  InkWell(
                    onTap: (){
                    },
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image.asset("images/address.png"),
                      const SizedBox(height: 5),
                      const Text('Hệ thống', style: TextStyle(color: colorTheme, fontSize: 12))
                    ]),
                  ),
                  const SizedBox(
                    width: 60,
                    height: 80
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                   Image.asset("images/hotline.png"),
                    const SizedBox(height: 5),
                    const Text('Hotline', style: TextStyle(color: colorTheme, fontSize: 12))
                  ]),
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Image.asset("images/account.png"),
                    const SizedBox(height: 5),
                    const Text('Tài khoản', style: TextStyle(color: colorTheme, fontSize: 12))
                  ]),
                ],
              ),
            ),
          ]),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    _Ftkey.currentState!.openDrawer();
                  },
                  child: Container(
                    width: 68,
                    height: 65,
                    decoration: BoxDecoration(
                      color: const Color(0xffFCE4F0),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset("images/menu.png"),
                      ),
                      const SizedBox(height: 5),
                      const Text('Danh mụcc', style: TextStyle(fontWeight: FontWeight.w600, color: colorTheme, fontSize: 12))
                    ],),
                  ),
                )
              ],
            ),
          )
        )
      ]
    );
  }
}