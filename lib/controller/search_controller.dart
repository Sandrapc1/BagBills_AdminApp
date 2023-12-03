import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  var searchResult = <Map<String, dynamic>>[].obs;

  void searchProduct(String query) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('products')
        .where('name', isGreaterThanOrEqualTo: query)
        .get();
    searchResult.value =
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}
