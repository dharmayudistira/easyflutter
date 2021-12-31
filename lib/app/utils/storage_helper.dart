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

  Future<void> setIdUser(String userId) async{
    await storageManager.write(KEY_ID_USER, userId);
  }

  String getIdUser() {
    return storageManager.read(KEY_ID_USER);
  }

  Future<void> setPasswordUser(String password) async {
    await storageManager.write(KEY_PASSWORD_USER, password);
  }

  String getPasswordUser() {
    return storageManager.read(KEY_PASSWORD_USER);
  }

  Future<void> setNameUser(String nameUser) async {
    await storageManager.write(KEY_NAME_USER, nameUser);
  }

  String getNameUser() {
    return storageManager.read(KEY_NAME_USER);
  }

  Future<void> setIsLoginUser(bool state) async {
    await storageManager.write(KEY_IS_LOGIN_USER, state);
  }

  bool getIsLoginUser() {
    return storageManager.read(KEY_IS_LOGIN_USER) ?? false;
  }

  Future<void> setIdClassUser(String idClass) async {
    await storageManager.write(KEY_ID_CLASS_USER, idClass);
  }

  String getIdClassUser() {
    return storageManager.read(KEY_ID_CLASS_USER);
  }

  Future<void> clearStorage() async {
    await storageManager.erase();
  }

}