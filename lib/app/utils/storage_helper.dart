import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:easyflutter/app/constants/storage_key_constants.dart';

class StorageHelper extends GetxController {
  late GetStorage storageManager;

  @override
  void onInit() {
    super.onInit();

    storageManager = GetStorage();

  }

  void setIdUser(String userId) {
    storageManager.write(KEY_ID_USER, userId);
  }

  String getIdUser() {
    return storageManager.read(KEY_ID_USER);
  }

  void setPasswordUser(String password) {
    storageManager.write(KEY_PASSWORD_USER, password);
  }

  String getPasswordUser() {
    return storageManager.read(KEY_PASSWORD_USER);
  }

  void setNameUser(String nameUser) {
    storageManager.write(KEY_NAME_USER, nameUser);
  }

  String getNameUser() {
    return storageManager.read(KEY_NAME_USER);
  }

  void setIsLoginUser(bool state) {
    storageManager.write(KEY_IS_LOGIN_USER, state);
  }

  bool getIsLoginUser() {
    return storageManager.read(KEY_IS_LOGIN_USER) ?? false;
  }

  void setIdClassUser(String idClass) {
    storageManager.write(KEY_ID_CLASS_USER, idClass);
  }

  String getIdClassUser() {
    return storageManager.read(KEY_ID_CLASS_USER);
  }

}