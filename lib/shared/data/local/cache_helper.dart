import 'package:shared_preferences/shared_preferences.dart';
import 'package:zero_waste_app/shared/data/local/shared_pref_keys_enum.dart';

// class CacheHelper {
//   static Map<String, dynamic> cachedData = {
//     SharedPrefKeys.onBoarding.key: true,
//     SharedPrefKeys.userToken.key: '',
//   };

//   static late SharedPreferences prefs;
//   static init() async {
//     prefs = await SharedPreferences.getInstance();
//   }

//   static Future<bool> setData({
//     required String key,
//     required dynamic value,
//   }) async {
//     if (value is bool) {
//       bool result = await prefs.setBool(key, value);
//       _getData(key);
//       return result;
//     }
//     if (value is String) {
//       bool result = await prefs.setString(key, value);
//       _getData(key);
//       return result;
//     }
//     if (value is int) {
//       bool result = await prefs.setInt(key, value);
//       _getData(key);
//       return result;
//     } else {
//       bool result = await prefs.setDouble(key, value);
//       _getData(key);
//       return result;
//     }
//   }

//   static void _getData(String key) {
//     if(prefs.get(key)!=null){

//     cachedData[key] = prefs.get(key);
//     }
//   }

//   static Future<bool> removeData({required String key}) {
//     return prefs.remove(key);
//   }

//   static void loadPreferences() =>
//       cachedData.forEach((key, value) => _getData(key));
// }



class CacheHelper {
  static final Map<String, dynamic> cachedData = {
    SharedPrefKeys.onBoarding.key: true,
    SharedPrefKeys.userToken.key: '',
  };

  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    _loadPreferences();
  }

  static Future<bool> setData(
    String key,
    dynamic value,
  ) async {
    bool result;
    result = switch (value) {
      bool() => await prefs.setBool(key, value),
      String() => await prefs.setString(key, value),
      int() => await prefs.setInt(key, value),
      _ => await prefs.setDouble(key, value)
    };
    if (result) _updateCache(key);
    return result;
  }

  static void _updateCache(String key) {
    final value = prefs.get(key);
    if (value != null) {
      cachedData[key] = value;
    }
  }

  static Future<bool> removeData({required String key}) async {
    final result = await prefs.remove(key);
    if (result) {
      cachedData.remove(key);
    }
    return result;
  }

  static void _loadPreferences() {
    cachedData.forEach((key, _) => _updateCache(key));
  }
}
