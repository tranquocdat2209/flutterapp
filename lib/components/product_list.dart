import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../variables/colors.dart';
import '../pages/category/category_page.dart';
import '../pages/product_detail/product_detail.page.dart';
import '../consts/graphql_pdp.dart';

const productsGrapQl = """
    query product(\$categoryId: String! ){
        products(filter: {category_id: {eq: \$categoryId}}) {
          total_count
          items {
            id
            sku
            name
            image{
              url
              label
              position
            }
            price_range{
              maximum_price{
                regular_price{
                  value
                  currency
                }
                final_price{
                  value
                  currency
                }
              }
            }
            special_price
          }
        }
    }
""";

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.categoryId});
  final int categoryId;
  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(productsGrapQl),
          variables: {
            "categoryId": "$categoryId",
          }
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
        final productList = result.data?['products']['items'];

        return Expanded(
          flex: 1,
          child: GridView.builder(
              shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
                childAspectRatio: 0.75),
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ProductDetail.routeName,
                              arguments: {"skuProduct": productList[index]['sku']});
                        },
                        child: Image.network(
                          productList[index]['image']['url'],
                          width: 184,
                          height: 184,
                        )),
                    SizedBox(height: 5),
                    Container(
                      child: Wrap(
                        children: [
                          Text(
                            productList[index]['name'],
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Wrap(
                      children: [
                        Text(
                          productList[index]['price_range']['maximum_price']
                                  ['final_price']['value']
                              .toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: colorTheme,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text('-20%',
                                style: TextStyle(fontSize: 10, color: colorWhite))),
                        Image.asset("images/cart-product.png"),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
