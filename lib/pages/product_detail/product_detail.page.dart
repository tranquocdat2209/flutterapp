import 'package:flutter/material.dart';
import '../../components/appbar.dart';
import './widget/swiper_product.dart';

class ProductDetail extends StatefulWidget {

  const ProductDetail({super.key});
  static const routeName = '/productdetail';
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    return SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          body: Column(
            children: [
              SwiperProduct(skuProduct: arg["skuProduct"],)
            ],
          ),
        )
    );
  }
}

