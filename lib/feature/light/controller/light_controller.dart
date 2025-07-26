import 'package:get/get.dart';
import '../../../services/tuya_auth_service.dart';

class LightController extends GetxController {
  var accessToken = ''.obs;
  final TuyaAuthService _authService = TuyaAuthService();

  @override
  void onInit() {
    super.onInit();
    fetchToken();
  }

  Future<void> fetchToken() async {
    final token = await _authService.getAccessToken();
    if (token != null) {
      accessToken.value = token;
      print("✅ Tuya Token: $token");
    } else {
      print("❌ Failed to get Tuya token");
    }
  }
}
