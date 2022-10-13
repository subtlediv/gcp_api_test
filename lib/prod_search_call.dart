import 'package:gcp_api_test/constants/app.dart';
import 'package:gcp_api_test/constants/images.dart';
import 'package:gcp_api_test/constants/key.dart';
import 'package:http/http.dart' as http;

Future<String> demoRequest({String base64img = image1Base64}) async {
  print("in req");
  String requestJson =
      '{"requests": [{"image": {"content": "$base64img"},"features": [{ "type": "PRODUCT_SEARCH", "maxResults": $VISION_API_PRODUCT_MAX_RESULT}],"imageContext": {"productSearchParams": {  "productSet": "projects/$VISION_API_PROJECT_ID/locations/$VISION_API_LOCATION_ID/productSets/$VISION_API_PRODUCT_SET_ID",  "productCategories": [ "apparel-v2"]}}}]}';

  print(
      "----------------------------------------------------------------------------------------");
  print(requestJson);
  print(
      "----------------------------------------------------------------------------------------");
  http.Response response = await http.post(
      Uri.parse(
        "$VISION_API_URL/images:annotate?key=$VISION_API_KEY",
      ),
      body: requestJson);
  print(response.body);
  print(
      "----------------------------------------------------------------------------------------");
  print(
      "----------------------------------------------------------------------------------------");
  return response.body;
}
