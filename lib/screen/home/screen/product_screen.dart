// ignore_for_file: unused_local_variable, avoid_unnecessary_containers
import 'dart:developer';
import 'package:bagbliss_admin/colors/colors.dart';
import 'package:bagbliss_admin/screen/update/update_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference bags =
        FirebaseFirestore.instance.collection('products');
    void deleteproduct(docId) {
      bags.doc(docId).delete();
    }

    return Scaffold(
        body: StreamBuilder(
      stream: bags.orderBy('name').snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot bagsnap = snapshot.data.docs[index];
              log(bagsnap.toString());
              log(bagsnap['name'].toString());
              log(bagsnap['image'].toString());
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: white,
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 222, 219, 219),
                            blurRadius: 10,
                            spreadRadius: 15)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child:  CircleAvatar(
                            // backgroundColor: appbar,
                            radius: 30,
                            backgroundImage:NetworkImage(bagsnap['image'][0]) ,
                             ),
                        ),
                      ),
                      Text(
                        bagsnap['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.to( EditProductScreen(snap:bagsnap ), 
                                arguments: {
                                  'name': bagsnap['name'],
                                  'category': bagsnap['category'],
                                  'quantity': bagsnap['quantity'],
                                  'size': bagsnap['size'],
                                  'price': bagsnap['price'],
                                  'description': bagsnap['description'],
                                  'id': bagsnap.id,
                                  'brand':bagsnap['brand']
                                  
                                });
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                              )),
                          IconButton(
                              onPressed: () {
                                Get.defaultDialog(
                                    title: 'Are you sure you want to ',
                                    titleStyle: const TextStyle(fontSize: 15),
                                    middleText: 'Delete?',
                                    textCancel: 'Cancel',
                                    cancelTextColor: Colors.black,
                                    textConfirm: 'Confirm',
                                    confirmTextColor:white,
                                    backgroundColor: white,
                                    onCancel: () {},
                                    onConfirm: () {
                                      deleteproduct(bagsnap.id);
                                      Get.back();
                                    },
                                    buttonColor: Colors.red);
                              },
                              icon: const Icon(Icons.delete,
                              color: Colors.redAccent)),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
        return Container();
      },
    )
    );
  }
}
