import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Util {
  // 分を時間と分に変換するメソッド
  static String convertMinutesToHoursAndMinutes(int minutes) {
    // 分を時間と分に変換
    int hours = minutes ~/ 60; // 時間部分
    int remainingMinutes = minutes % 60; // 残りの分

    // 結果を文字列として返す
    return '${hours}h ${remainingMinutes}m';
  }

  // YYYY-MM-DDをYYYY年MM月DD日に変換するメソッド
  static String convertDateToJapaneseFormat(String date) {
    // 日付を "-" で分割
    List<String> parts = date.split('-');

    if (parts.length != 3) {
      return 'Invalid date format'; // エラーメッセージ
    }

    String year = parts[0];
    String month = parts[1];
    String day = parts[2];

    // YYYY年MM月DD日形式に変換して返す
    return '${year}年${month}月${day}日';
  }

  static String formatDateTime({required DateTime dateTime}) {
    return DateFormat("yyyy年MM月dd日 HH:mm").format(dateTime);
  }

  static DateTime timestampToDateTime({required Timestamp timestamp}) {
    return timestamp.toDate();
  }
}
