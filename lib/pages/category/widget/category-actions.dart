import 'package:flutter/material.dart';
import '../../../variables/colors.dart';
import '../../../components/popup-filter.dart';

class CategoryAction extends StatelessWidget {
  const CategoryAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10,top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
          onTap: (){
            showDialog(
                context: context, builder: (context) {
              return CategoryFilter();
            }
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: Color(0xffFCE1EF),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(children: [
              Image.asset("images/filter.png"),
              SizedBox(width: 10),
              Text('Lọc', style: TextStyle(color: colorTheme, fontSize: 14, fontWeight: FontWeight.w600))
            ]),
          ),
        ),
        Row(children: [
          Text('Sắp xếp theo', style: TextStyle(fontSize: 10)),
          SizedBox(width: 10),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
              decoration: BoxDecoration(
                  border: Border.all(color: colorBorder, width: 1),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(children: [
                Text('Giá tăng dần'),
                SizedBox(width: 10),
                Image.asset("images/down.png"),
              ])
          )
        ])
      ]),
    );
  }
}
