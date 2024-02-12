// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/products_cubit/products_cubit.dart';
import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/services/add_products_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class AddProductBottomSheet extends StatefulWidget {
  const AddProductBottomSheet({Key? key, required this.categoryName})
      : super(key: key);
  final String categoryName;

  @override
  State<AddProductBottomSheet> createState() => _AddProductBottomSheetState();
}

class _AddProductBottomSheetState extends State<AddProductBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, desc, img;
  num? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 32,
            bottom: 32 + MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                text: 'Category Name',
                onSaved: (data) {
                  title = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                text: 'Description',
                maxLines: 3,
                onSaved: (data) {
                  desc = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                text: 'Price',
                inputType: TextInputType.number,
                onSaved: (data) {
                  price = num.parse(data!);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                text: 'Url Image',
                onSaved: (data) {
                  img = data;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              CustomMaterialButton(
                isLoading: isLoading,
                text: 'Add',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    isLoading = true;
                    setState(() {});
                    try {
                      await addProduct(widget.categoryName);
                      BlocProvider.of<ProductsCubit>(context)
                          .getProductsCategory(
                              categoryName: widget.categoryName);
                      Navigator.pop(context);
                      showSnackBar(context,
                          message: 'The product added successfully');
                    } catch (e) {
                      Navigator.pop(context);
                      showSnackBar(context,
                          message: 'Failed, please try later');
                      log(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addProduct(String categoryName) async {
    await AddProductsService().addProduct(
      title: title!,
      price: price!,
      description: desc!,
      image: img!,
      category: categoryName,
    );
  }
}
