// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/update_products_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductsPage extends StatefulWidget {
  const UpdateProductsPage({Key? key}) : super(key: key);
  static String id = 'updateProduct';

  @override
  State<UpdateProductsPage> createState() => _UpdateProductsPageState();
}

class _UpdateProductsPageState extends State<UpdateProductsPage> {
  String? title, desc, img;

  num? price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.grey),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Update Product',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  text: 'Category Name',
                  onChange: (data) {
                    title = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  text: 'description',
                  onChange: (data) {
                    desc = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  text: 'Price',
                  inputType: TextInputType.number,
                  onChange: (data) {
                    price = num.parse(data);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  text: 'Image',
                  onChange: (data) {
                    img = data;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomMaterialButton(
                  text: 'Update',
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      showSnackBar(context, message: 'Success');
                      log('success');
                    } catch (e) {
                      showSnackBar(context, message: 'Failed, try later');
                      log(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductsService().updateProduct(
        id: product.id,
        title: title ?? product.title,
        price: price ?? product.price,
        description: desc ?? product.description,
        image: img ?? product.image,
        category: product.category);
  }
}
