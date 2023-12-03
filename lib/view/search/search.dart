import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/search_controller.dart';
import '../../core/colors.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final SearchScreenController searchController =
      Get.put(SearchScreenController());
  final TextEditingController searchtextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(color: white),
        ),
        iconTheme: const IconThemeData(color: white),
        backgroundColor: appbar,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              height: height * 0.04,
              width: width * 0.73,
              alignment: Alignment.center,
              child: TextField(
                controller: searchtextController,
                maxLines: 1,
                onChanged: searchController.searchProduct,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: boxcolorstock,
                  ),
                  hintText: 'Search ...',
                  hintStyle: const TextStyle(
                    color: boxcolorfill,
                    fontSize: 17,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchtextController.clear();
                      searchController.searchResult.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.1),
            Obx(() {
              final searchResults = searchController.searchResult;

              if (searchResults.isEmpty) {
                return Container(
                  height: height * 0.6,
                  child: const Center(child: Text('No results found.')),
                );
              }

              return Container(
                height: height * 0.6,
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
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
                            // backgroundImage:NetworkImage(bagsnap['image'][0]) ,
                             ),
                        ),
                      ),
                      // Text(
                      //   // bagsnap['name'],
                      //   // style: const TextStyle(fontWeight: FontWeight.bold),
                      // ),
                      // Row(
                      //   children: [
                      //     IconButton(
                      //         onPressed: () {
                      //           Get.to( EditProductScreen(snap:bagsnap ), 
                      //           arguments: {
                      //             'name': bagsnap['name'],
                      //             'category': bagsnap['category'],
                      //             'quantity': bagsnap['quantity'],
                      //             'size': bagsnap['size'],
                      //             'price': bagsnap['price'],
                      //             'description': bagsnap['description'],
                      //             'id': bagsnap.id,
                      //             'brand':bagsnap['brand']
                                  
                      //           });
                      //         },
                      //         icon: const Icon(
                      //           Icons.edit,
                      //           color: Colors.blue,
                      //         )),
                      //     IconButton(
                      //         onPressed: () {
                      //           Get.defaultDialog(
                      //               title: 'Are you sure you want to ',
                      //               titleStyle: const TextStyle(fontSize: 15),
                      //               middleText: 'Delete?',
                      //               textCancel: 'Cancel',
                      //               cancelTextColor: Colors.black,
                      //               textConfirm: 'Confirm',
                      //               confirmTextColor:white,
                      //               backgroundColor: white,
                      //               onCancel: () {},
                      //               onConfirm: () {
                      //                 deleteproduct(bagsnap.id);
                      //                 Get.back();
                      //               },
                      //               buttonColor: Colors.red);
                      //         },
                      //         icon: const Icon(Icons.delete,
                      //         color: Colors.redAccent)),
                      //   ],
                      // )
                    ],
                  ),
                ),
              );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
