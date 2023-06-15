import 'package:flutter/material.dart';
import './pages/category/category_page.dart';
import './pages/home/home_page.dart';
import './variables/colors.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
final HttpLink httpLink = HttpLink("https://flutter.ecommage.com/graphql/");
  ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore())
    )
  );
  runApp(
    GraphQLProvider(
      client: client,
      child:  MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: colorTheme,
        ),
        initialRoute: HomePage.routeName,
        routes:{
          HomePage.routeName: (context) => HomePage(),
          CategoryPage.routeName: (context) => CategoryPage(),
        },

    ),
    )
  );
}