import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart' as http;
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'app_exception.dart';
import 'base_service.dart';

class MediaService extends BaseService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(mediaBaseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future<Map<String, dynamic>> postResponse(Map<String, String> input) async {
    dynamic responseJson;
    final ioClient = new HttpClient();
    ioClient.connectionTimeout = const Duration(seconds: 10);
    final client = http.IOClient(ioClient);

    final String uri = mediaBaseUrl + mnmLogin;
    final String jsonBody = json.encode(input);
    final encoding = Encoding.getByName('utf-8');
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await client.post(Uri.parse(uri), headers: headers, body: jsonBody, encoding: encoding);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeOutException{
      throw TimeOutException('Time Out Exception');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.statusCode.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.statusCode.toString());
      case 404:
        throw NotFoundException(response.statusCode.toString());
      case 408:
        throw TimeOutException(response.statusCode.toString());
      case 409:
        throw ConflictException(response.statusCode.toString());
      case 500:
        throw InternalServerErrorException(response.statusCode.toString());
      case 503:
        throw ServiceUnavailableException(response.statusCode.toString());
      default:
        throw FetchDataException('Error occured while communication with server' + ' with status code : ${response.statusCode}');
    }
  }
}
