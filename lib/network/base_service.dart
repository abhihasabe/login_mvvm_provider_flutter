abstract class BaseService {
  final String mediaBaseUrl = "https://fdw.mahindra.com/cfpUAT";
  final String mnmLogin = "/dlroneview/v1/authenticateUser";
  Future<dynamic> getResponse(String url);

}