import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../consts/graphql_pdp.dart';

const productDetailGrapQl = """
    query productdetai(\$skuProduct: String!){
  products(filter: { sku: { eq: \$skuProduct } }) {
    items {
      id
      name
      sku
      stock_status
      only_x_left_in_stock
      meta_keyword
      meta_description
      special_price
      special_from_date
      special_to_date
      attribute_set_id
      manufacturer
      canonical_url
      description {
        html
      }
      short_description {
        html
      }
      image {
        url
        label
        position
        disabled
      }
      small_image {
        url
        label
        position
        disabled
      }
      thumbnail {
        url
        label
        position
        disabled
      }
      new_from_date
      new_to_date
      price_tiers {
        quantity
        discount {
          percent_off
          amount_off
        }
        final_price {
          value
          currency
        }
      }
      ... on PhysicalProductInterface {
        weight
      }
      options_container
      created_at
      updated_at
      country_of_manufacture
      type_id
      websites {
        id
        name
        code
        sort_order
        default_group_id
        is_default
      }
      product_links {
        sku
        link_type
        linked_product_sku
        linked_product_type
        position
      }
      media_gallery {
        url
        label
        position
        disabled
        ... on ProductVideo {
          video_content {
            media_type
            video_provider
            video_url
            video_title
            video_description
            video_metadata
          }
        }
      }
      price_range {
        minimum_price {
          regular_price {
            value
            currency
          }
          final_price {
            value
            currency
          }
          fixed_product_taxes {
            label
            amount {
              value
              currency
            }
          }
        }
        maximum_price {
          discount {
            amount_off
            percent_off
          }
          fixed_product_taxes {
            label
            amount {
              value
              currency
            }
          }
        }
      }
      gift_message_available
      url_rewrites {
        parameters {
          name
          value
        }
      }
      related_products {
        id
        name
        sku
      }
      upsell_products {
        id
        name
        sku
      }
      crosssell_products {
        id
        name
        sku
      }
      categories {
        id
        url_key
        name
        position
        is_anchor
        url_suffix
        description
        display_mode
        meta_keywords
        path_in_store
        default_sort_by
        meta_description
        custom_layout_update_file
        available_sort_by
        products {
          items {
            id
            sku
          }
        }
        cms_block {
          title
          content
          identifier
        }
      }
    }
  }
}
""";

class SwiperProduct extends StatelessWidget {
  const SwiperProduct({super.key, required this.skuProduct});
  final String skuProduct;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(productDetailGrapQl),
        variables: {
          "skuProduct": skuProduct,
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
        final mediaGallery = productList[0]['media_gallery'];
        return Column(
          children: [
            Container(
              height: 388,
              width: double.infinity,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image(
                      image: NetworkImage(mediaGallery[index]['url']),
                      fit: BoxFit.cover);
                },
                autoplay: true,
                itemCount: mediaGallery.length,
                pagination: const SwiperPagination(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    builder: DotSwiperPaginationBuilder(
                        color: Color.fromRGBO(229, 26, 131, 0.3),
                        activeColor: Color.fromRGBO(229, 26, 131, 0.5),
                        size: 7.0,
                        activeSize: 7.0)),
              ),
            )
          ],
        );
      },
    );
  }
}
