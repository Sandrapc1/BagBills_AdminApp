import 'package:bagbliss_admin/colors/colors.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
final TextEditingController searchtextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchtextController = TextEditingController();
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: appbar,
        title: const Text('Search',style: TextStyle(color: white),),
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: width*0.15,top: height*0.04),
            child: Container(
              alignment: Alignment.center,
              height: height * 0.06,
              width: width * 0.7,
              // color: black,
              child: TextFormField(
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: appbar),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: appbar),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: appbar),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search ...',
                  hintStyle: const TextStyle(color: boxcolorfill),
                  prefixIcon: const Icon(Icons.search, color: boxcolorfill),
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchtextController.clear();
                    },
                    icon: const Icon(Icons.clear, color: black),
                  ),
                ),
              ),
            ),
          ),
        ]
        ),
        
    );
      
    
  }
}