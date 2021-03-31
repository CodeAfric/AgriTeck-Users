
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
  static Future<bool> setUserID(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('userId', id);
  }

  static Future<String> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future(() => prefs.getString('userId'));
  }

  static Future<bool> removeUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('userId');
  }

  static Future<bool> setUserName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('userName', name);
  }

  static Future<String> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future(() => prefs.getString('userName'));
  }
  static Future<bool> removeUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('userName');
  }

  static Future<bool> setUserAge(bool age) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('isAdult', age);
  }
  static Future<bool> getUserAge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future(() => prefs.getBool('isAdult'));
  }


  static Future<bool> setUserEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('email', email);
  }

  static Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future(() => prefs.getString('email'));
  }
  static Future<bool> removeUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('email');
  }

  static Future<bool> setUserPhoto(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('photoUrl', url);
  }
  static Future<bool> removeUserPhoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('photoUrl');
  }

  static Future<bool> setRole(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('role', role);
  }
  static Future<String> getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future(() => prefs.getString('role'));
  }

  static Future<bool> removeRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('role');
  }

  static Future<String> getUserPhoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future(() => prefs.getString('photoUrl'));
  }
  static Future<bool> setLastStory(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('lastStory', id);
  }

  static Future<String> getLastStory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future(() => prefs.getString('lastStory'));
  }

}