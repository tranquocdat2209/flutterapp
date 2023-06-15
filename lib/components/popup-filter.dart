import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../variables/colors.dart';
import '../components/input-checkbox.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});
  final String filterOptions = """
      query dataFilterOptionQL {
      products(filter: { category_id: { eq: 23 } }) {
        total_count
        aggregations{
          attribute_code
          label
          count
          options{
            count
            label
            value
          }
        }
      }
    }
  """;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: colorWhite,
      padding: const EdgeInsets.all(20),
      child: Material(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("BỘ LỌC TÌM KIẾM",
                    style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: colorTheme,
                        fontWeight: FontWeight.w800)),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('images/close.png'))
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Query(
                    options: QueryOptions(
                      document: gql(filterOptions),
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
                      final labelFilter =
                          result.data?["products"]["aggregations"];
                      return ListView.builder(
                          itemCount: labelFilter.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final labelOptions = labelFilter[index]["options"];
                            if (labelFilter[index]["label"] == "Color") {
                              return ExpansionTile(
                                textColor: colorTheme,
                                title: Text(labelFilter[index]["label"],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                children: [
                                  GridView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: labelOptions.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 8,
                                              mainAxisSpacing: 20,
                                              crossAxisSpacing: 20),
                                      itemBuilder: (context, index) {
                                        print(labelOptions[index]["label"]);
                                        return Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                // color: Co,
                                                border: Border.all(
                                                    color: colorBorder,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5)));
                                      })
                                ],
                              );
                            } else {
                              return ExpansionTile(
                                textColor: colorTheme,
                                title: Text(labelFilter[index]["label"],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                children: [
                                  ListView.separated(
                                      itemCount: labelOptions.length,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Row(children: [
                                              const SizedBox(width: 20),
                                              InputCheckBox(),
                                              const SizedBox(width: 10),
                                              Text(labelOptions[index]["label"])
                                            ]),
                                            SizedBox(height: 20,)
                                          ],
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(height: 10);
                                      })
                                ],
                              );
                            }
                          });
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
