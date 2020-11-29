import 'package:http/http.dart' as http;
/*BUSCA POR RUC*/
class SearchService2 {
  static Future<String> searchDjangoApi(String query)async{
    String url = 'http://192.168.0.24:8000/ruc/?search=$query';
    http.Response response = await http.get(Uri.encodeFull(url));

    return response.body;
  }
}