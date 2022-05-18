import 'package:alhaddad_driver/app/utils/app_storage_keys.dart';
import 'package:alhaddad_driver/app/utils/navigation_utils.dart';
import 'package:alhaddad_driver/app/widgets/bottomsheet/bottomsheet_content/title_subtitle_bottomsheet_content.dart';
import 'package:alhaddad_driver/app/widgets/bottomsheet/bottomsheet_with_style.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxString name = ("Jithin Jyoth").obs;

  String className = "ProfileController";
  @override
  void onInit() {
    super.onInit();
  }

  void logout() {
    CustomBottomSheet.showCustomBottomSheetWithMargin(
        TitleSubtitleBottomSheetContent(
      title: "${LocaleKeys.logout.tr} !",
      subtitle: LocaleKeys.logoutMessage.tr,
      negativeButtonPressed: () {
        Get.back();
      },
      positiveButtonPressed: () {
        AppStorageKeys().clearAllDetails();
        NavigationUtils().exitToLogin(className: className);
      },
    ));
  }
}
