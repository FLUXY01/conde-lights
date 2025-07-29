import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  final Rx<LatLng?> currentLocation = Rx<LatLng?>(null);

  @override
  void onInit() {
    super.onInit();
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.locationWhenInUse.request();

    if (status.isGranted) {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar("Location Error", "Location services are disabled.");
        return;
      }

      try {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        currentLocation.value = LatLng(position.latitude, position.longitude);
      } catch (e) {
        Get.snackbar("Location Error", "Failed to get current location.");
      }
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      Get.snackbar(
        "Permission Needed",
        "Enable location permission in settings.",
      );
    } else {
      Get.snackbar("Permission Denied", "Location permission is required.");
    }
  }
}
