import 'package:login_reg_mvvm_provider/network/media_service.dart';

class MediaRepository {
  MediaService _mediaService = MediaService();


  Future<Map<String, dynamic>> loginPost(Map<String, String> input) async {
    dynamic response = await _mediaService.postResponse(input);
    return response;
  }
}
