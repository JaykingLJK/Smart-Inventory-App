import 'package:http/http.dart' as http;
enum MyHttpMethod {
  get,
  post,
  delete,
  put,
}
const String endpoint = "http://54.151.224.79:5000/listings";

var uri = Uri.parse(endpoint);

void main(){
  print(uri);
  final res = http.get(uri, headers: {"Access-Control-Allow-Origin":"*"}) as http.Response;
  print(res.statusCode);            //Response status code (200)
  print(res.body);                  //Response body ("")
}
