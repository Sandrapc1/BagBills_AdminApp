// ignore_for_file: avoid_print

import 'dart:developer';
import 'dart:io';
import 'package:bagbliss_admin/core/colors.dart';
import 'package:bagbliss_admin/screen/addproducts/function.dart';
import 'package:bagbliss_admin/screen/addproducts/widgets/row_costume_widget.dart';
import 'package:bagbliss_admin/screen/home/homescreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/product_details.dart';
import 'widgets/build_textfield.dart';

// final GlobalKey<FormState> _formkeys=GlobalKey<FormState>();
final brands = ['Baggit', 'Allen Solly', 'H&M', 'Saint Laurent'];
final Categorys = [
  'Cross Bag',
  'Tote Bag',
  'Shoulder Bag',
  'Clutches Bag',
  'Messengerr Bag'
];
final sizes = [
  'X',
  'M',
  'S',
  'XL',
  'XXL',
];

TextEditingController productcontoller = TextEditingController();
TextEditingController categorycontoller = TextEditingController();
TextEditingController quantitycontoller = TextEditingController();
TextEditingController sizecontoller = TextEditingController();
TextEditingController pricecontoller = TextEditingController();
TextEditingController descriptioncontoller = TextEditingController();
final CarouselController _controller = CarouselController();
late String imageUrl1;

class AddproductsScreen extends StatelessWidget {
  AddproductsScreen({
    Key? key,
  }) : super(key: key);

  final bags = FirebaseFirestore.instance.collection('products').doc();
  final imagePickerController = Get.put(ImagePickerController());

  Future<void> addproducts(ProductDetails details) async {
    bags.set({
      'name': details.name,
      'category': details.category,
      'quantity': details.quantity,
      'size': details.size,
      'price': details.price,
      'id': details.id,
      'description': details.description,
      'image': details.image,
      'brand': details.brand,
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appbar,
          iconTheme: const IconThemeData(color: white),
          title: const Text(
            'Add Product',
            style: TextStyle(color: white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() => CarouselSlider.builder(
                      itemCount: imagePickerController.imagelist.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return Container(
                          // width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Stack(
                            children: [
                              Image(
                                image: FileImage(File(
                                    imagePickerController.imagelist[index])),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor: white,
                                  child: IconButton(
                                    onPressed: () {
                                      imagePickerController
                                          .removeImageAtIndex(index);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      carouselController: _controller,
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        aspectRatio: 2.0,
                        initialPage: 1,
                      ),
                    )),
                SizedBox(
                  height: height * 0.02,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xFF00B2B6))),
                    onPressed: () async {
                      await imagePickerController.takePhoto();
                      //  imagePickerController.uploadImagesToFirebase(imagelist,context );
                      log(imagePickerController.imagelist.length.toString());
                    },
                    child: const Text(
                      'Add Image',
                      style: TextStyle(color: white),
                    )),
                SizedBox(
                  height: height * 0.03,
                ),
                BuildTextField(
                    labelText: 'Product name', controller: productcontoller),
                SizedBox(
                  height: height * 0.02,
                ),
                CostumRow(
                  dropdownList: Categorys,
                  labelText2: 'Quantity',
                  controller2: quantitycontoller,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CostumRow(
                  dropdownList: sizes,
                  labelText2: 'Price',
                  controller2: pricecontoller,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text('Brands'),
                Obx(() => Container(
                      height: height * 0.06,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 90, 89, 89)),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton<String>(
                        value: imagePickerController.dropgetx.value.isNotEmpty
                            ? imagePickerController.dropgetx.value
                            : null,
                        items: brands
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newvalue) {
                          if (newvalue != null) {
                            print(newvalue);
                            imagePickerController.setSelectedBrand(newvalue);
                          }
                        },
                      ),
                    )),

                //  BuildTextField(
                //     labelText: 'Brand', controller: brandcontroller),
                SizedBox(
                  height: height * 0.02,
                ),
                BuildTextField(
                    labelText: 'Description', controller: descriptioncontoller),
                SizedBox(
                  height: height * 0.03,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const LinearBorder(),
                        fixedSize: Size(width, 50),
                        backgroundColor: appbar),
                    onPressed: () async {
                      log(imagePickerController.imagelist.toString());
                      await addproducts(ProductDetails(
                          name: productcontoller.text,
                          category: categorycontoller.text,
                          quantity: quantitycontoller.text,
                          size: sizecontoller.text,
                          price: pricecontoller.text,
                          id: bags.id,
                          description: descriptioncontoller.text,
                          image: imagePickerController.downloadURLs,
                          brand: imagePickerController.dropgetx.toString()));
                      imagePickerController.imagelist.clear();
                      imagePickerController.downloadURLs.clear();
                      log(imagePickerController.imagelist.toString());
                      Get.back();

                      // if (imagePickerController.imagelist.isEmpty) {
                      //   Get.snackbar('', 'Please add the Image',colorText: red);
                      //   log(imagePickerController.imagelist.length.toString()

                      //   );
                      // return;

                      Get.to(const HomeScreen());
                      imagePickerController.clear();
                      productcontoller.clear();
                      categorycontoller.clear();
                      quantitycontoller.clear();
                      sizecontoller.clear();
                      pricecontoller.clear();
                      descriptioncontoller.clear();
                      brands.clear();

                      // }
                      // Get.back();
                    },
                    child: const Text(
                      'SAVE',
                      style: TextStyle(color: white),
                    ))
              ],
            ),
          ),
        ));
  }
}
