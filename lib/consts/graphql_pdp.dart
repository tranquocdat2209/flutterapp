const productDetailGrapQl = """
    query productdetai{
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

// menu
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
              id
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
//
// product item
const productsGrapQl = """
    query product(\$categoryId: String!, \$skuProduct: String! ){
        products(filter: {category_id: {eq: [\$categoryId,\$skuProduct]}}) {
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
//
// filter

const String filterOptions = """
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