import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_store_app/ModeLs/my_product_model.dart';
import 'package:my_store_app/Screens/my_update_product_page.dart';

class MyProductCard extends StatelessWidget {
  const MyProductCard({
    super.key,
    required this.myProduct,
  });
  final MyProductModeL myProduct;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              spreadRadius: 2,
              blurRadius: 20,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyUpdateProductPage.id,
                    arguments: myProduct);
              },
              child: Card(
                shadowColor: Colors.grey.withOpacity(.5),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        myProduct.productTitLe.substring(0, 6),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r"$" "${myProduct.productPrice}",
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              MdiIcons.cart,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            child: Icon(
                              MdiIcons.heart,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 35,
              bottom: 100,
              child: Image.network(
                myProduct.productImage,
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
