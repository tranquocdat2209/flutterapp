import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../variables/colors.dart';
import '../../pages/category/category_page.dart';

const menuGrapQl = """
    query menu{
      categories(
        filters: { parent_id: { in: ["2"] } }
        pageSize: 10
        currentPage: 1
      ) {
        total_count
        items {
          id
          uid
          level
          name
          path
          url_key
          image
          children_count
          children {
            id
            uid
            level
            name
            path
            children_count
            children {
              uid
              level
              name
              path
            }
          }
        }
        page_info {
          current_page
          page_size
          total_pages
        }
      }
    }
""";

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: colorBorder))),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: colorTheme,
                        borderRadius: BorderRadius.circular(20)),
                    height: 30,
                    child: Row(children: [
                      Text('Danh mục',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: colorWhite))
                    ])),
                SizedBox(width: 10),
              ]),
            ],
          ),
        ),
        Expanded(
            child: Query(
          options: QueryOptions(
            document: gql(menuGrapQl),
          ),
          builder: (QueryResult result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }
            if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final menuList = result.data?['categories']['items'];

            return ListView.builder(
                shrinkWrap: true,
                itemCount: menuList.length,
                itemBuilder: (context, index) {
                  final menuListlv3 = menuList[index]['children'];
                  // print(menuList[index]["id"]);
                  if (menuListlv3.length == 0) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 44,
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Image.asset("images/image4.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(menuList[index]['name'])
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.all(0),
                          childrenPadding:
                              EdgeInsets.only(bottom: 15, left: 30),
                          textColor: colorTheme,
                          title: InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset("images/image4.png"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(menuList[index]['name'])
                              ],
                            ),
                          ),
                          children: [
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: menuListlv3.length,
                                itemBuilder: (context, index) {
                                  if (menuListlv3.length == 0) {
                                    const SizedBox();
                                  } else {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, CategoryPage.routeName,
                                            arguments: {"categoryId": menuList[index]["id"]});
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(menuListlv3[index]['name'])
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                })
                          ],
                        ));
                  }
                });
          },
        ))
      ],
    );
  }
}
