// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables
import 'dart:developer';
import 'package:bagbliss_admin/colors/colors.dart';
import 'package:bagbliss_admin/screen/addproducts/image_picker.dart';
import 'package:bagbliss_admin/screen/addproducts/widgets/row_costume_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../addproducts/add_screen.dart';
import '../addproducts/widgets/build_textfield.dart';

TextEditingController productcontoller = TextEditingController();
TextEditingController categorycontoller = TextEditingController();
TextEditingController quantitycontoller = TextEditingController();
TextEditingController sizecontoller = TextEditingController();
TextEditingController pricecontoller = TextEditingController();
TextEditingController descriptioncontoller = TextEditingController();
TextEditingController brandcontroller = TextEditingController();
final CarouselController _controller = CarouselController();

// collection reference(product)

final CollectionReference bags =
    FirebaseFirestore.instance.collection('products');
final imagePickerController = Get.put(ImagePickerController());

Future<void> updateproduct(docId) async {
  final data = {
    'name': productcontoller.text,
    'category': categorycontoller.text,
    'quantity': quantitycontoller.text,
    'size': sizecontoller.text,
    'price': pricecontoller.text,
    'description': descriptioncontoller.text,
    'image': imagePickerController.downloadURLs,
    'brand':brandcontroller.text,
  };
  bags.doc(docId).update(data).then((value) => Get.back());
}

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key, required this.snap}) : super(key: key);
  final snap;

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  void initState() {
    productcontoller.text = widget.snap['name'];
    categorycontoller.text = widget.snap['category'];
    quantitycontoller.text = widget.snap['quantity'];
    sizecontoller.text = widget.snap['size'];
    pricecontoller.text = widget.snap['price'];
    descriptioncontoller.text = widget.snap['description'];
    //imagePickerController.imagelist = widget.snap['image'];
    imagePickerController.downloadURLs = widget.snap['image'];
    brandcontroller.text=widget.snap['brand'];
    super.initState();
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
            ' Update Product',
            style: TextStyle(color: white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CarouselSlider.builder(
                      itemCount: imagePickerController.downloadURLs.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return Container(
                          // width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Stack(
                            children: [
                              Image(
                                image: NetworkImage(
                                    imagePickerController.downloadURLs[index]),
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
                                      log(imagePickerController.downloadURLs.toString());
                                      imagePickerController
                                          .removeUpdateIndex(index);
                                          log(imagePickerController.downloadURLs.toString());
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
                    ),
                SizedBox(
                  height: height * 0.02,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xFF00B2B6))),
                    onPressed: () async {
                      await imagePickerController.takePhoto();
                      log(imagePickerController.imagelist.toString());
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
                    labelText1: 'Category',
                    controller1: categorycontoller,
                    labelText2: 'Quantity',
                    controller2: quantitycontoller),
                SizedBox(
                  height: height * 0.02,
                ),
                CostumRow(
                  labelText1: 'Size',
                  controller1: sizecontoller,
                  labelText2: 'Price',
                  controller2: pricecontoller,
                ),
                  SizedBox(
                  height: height * 0.02,
                ),
                const Text('Brands'),
                Obx(() => Container(
                  height: height*0.06,
                  alignment: Alignment.center,
                  decoration: 
                  BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 90, 89, 89)),
                  borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton<String>(
                        value: imagePickerController.dropgetx.value.isNotEmpty
                            ? imagePickerController.dropgetx.value
                            : null,
                        items:
                            brands.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newvalue) {
                          if (newvalue != null) {
                            imagePickerController.setSelectedBrand(newvalue);
                          }
                        },
                      ),
                )),
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
                    onPressed: () {
                      updateproduct(widget.snap['id']);
                      Get.back();
                      // updateproduct(docId);
                      // print(args);
                    },
                    child: const Text(
                      'UPDATE',
                      style: TextStyle(color: white),
                    ))
              ],
            ),
          ),
        ));
  }
}