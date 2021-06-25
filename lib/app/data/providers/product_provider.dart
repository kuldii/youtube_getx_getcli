import 'package:get/get.dart';

class ProductProvider extends GetConnect {
  String url = "https://get-cli-project-default-rtdb.firebaseio.com/";

  Future<void> editProduct(String id, String name) async {
    await patch(
      "$url" + 'products/$id.json',
      {
        "name": name,
      },
    );
  }

  Future<dynamic> postProduct(String name, String date) async {
    final response = await post(
      "$url" + 'products.json',
      {
        "name": name,
        "createdAt": date,
      },
    );
    return response.body;
  }

  Future<void> deleteProduct(String id) async =>
      await delete("$url" + 'products/$id.json');
}
