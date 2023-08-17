
// ignore_for_file: unused_local_variable

import 'package:bagbliss_admin/colors/colors.dart';
// import 'package:bagbliss_admin/screen/addproducts/image_picker.dart';
import 'package:bagbliss_admin/screen/admin/admin_login.dart';
import 'package:bagbliss_admin/screen/home/screen/order_screen.dart';
import 'package:bagbliss_admin/screen/home/screen/product_screen.dart';
import 'package:bagbliss_admin/screen/search/search.dart';
import 'package:bagbliss_admin/screen/update/update_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../addproducts/add_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appbar,
          actions:  [
            IconButton(onPressed: () {
              Get.to( SearchScreen());
            },
             icon: const Icon(Icons.search,color: white,size: 30,)),
             SizedBox(width: width*0.03,),
            InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: 'Are you sure you want to ',
                  titleStyle: const TextStyle(fontSize: 15),
                  middleText: 'Logout?',
                  textCancel: 'Cancel',
                  cancelTextColor: Colors.black,
                  textConfirm: 'Confirm',
                  confirmTextColor: white,
                  backgroundColor: white,
                  onCancel: () {},
                  onConfirm: () {
                FirebaseAuth.instance.signOut().then((value) {
                  // GetPage(name: , page: page)
               Get.off(AdminLoginScreen());
                }); },
                  buttonColor: Colors.red
                );
              },
              child: const Icon(Icons.logout,color: Colors.white,size: 25,),
              
              ),
            SizedBox(width: width*0.03,),
          ],
          iconTheme: const IconThemeData(color: appbar),

          bottom: const TabBar(unselectedLabelColor: white,labelColor: black,indicatorColor: white,
            tabs: [
              Tab(text: 'Products',),
              Tab(text: 'Orders',),
            ]
            ),
        ),
    body: const TabBarView(children: [
      ProductScreen(),
      OrderScreen()
    ]),
        
        floatingActionButton:FloatingActionButton(
          onPressed: () {
            Get.to(AddproductsScreen());
           imagePickerController.clear();
           imagePickerController.downloadURLs.clear();
           imagePickerController.imagelist.clear();
          },
        backgroundColor: appbar,
        child: const Icon(Icons.add,color: white,size: 38,),
        ) ,
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
    );
      
  
  }
}