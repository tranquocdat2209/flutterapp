import 'package:flutter/material.dart';
import '../variables/colors.dart';

AppBar buildAppBar () => AppBar(
backgroundColor: colorTheme,
  leading: Container(
    width: 35,
    height: 32,
    padding: EdgeInsets.only(left: 20),
    child: InkWell(
        onTap: (){
          // Navigator.pushNamed(context, HomePage.routeName);
        },
        child: Image.asset("images/logo.png", fit: BoxFit.contain)
    ),
  ),
  title: Container(
    width: double.infinity,
    height: 32,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(20)
    ),
    child: Row(
      children: [
        const Expanded(
          flex: 1,
          child: TextField(
            style: TextStyle(fontSize: 14.0),
            decoration: InputDecoration(
            fillColor: Colors.white,
              contentPadding: EdgeInsets.all(0),
              hintText: 'Tìm kiếm sản phẩm',
              border: OutlineInputBorder(borderSide: BorderSide(width: 0, style: BorderStyle.none)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5),
          width: 24,
          height: 24,
          child: Image.asset("images/Search.png"),
        )
      ],
    ),
  ),
  actions: [
    Container(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
          width: 25,
          height: 25,
          child: Image.asset("images/cart.png")
      ),
    )
  ],
);