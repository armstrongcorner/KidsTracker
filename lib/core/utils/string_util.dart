import '../log.dart';

String toSnakeCase(String value) {
  return value.replaceAllMapped(RegExp(r'[A-Z]'), (Match match) => '_' + match[0]!.toLowerCase());
}

bool isEmpty(String? s) => s == null || s.isEmpty;

bool isNotEmpty(String? s) => s != null && s.isNotEmpty;

bool isEmptyList(List<Object>? list) => list == null || list.isEmpty;

bool isNotEmptyList(List<Object>? list) => list != null && list.isNotEmpty;

String getErrorMsg(String msg) {
  return msg.split(': ').last;
}

// 正则表达式匹配中国大陆的手机号码
bool isValidPhoneNumber(String phoneNumber) {
  final RegExp regExp = RegExp(r'^1[3-9]\d{9}$');
  return regExp.hasMatch(phoneNumber);
}

// Regular contain
bool isContain(
    {required String input,
    bool onlyNumber = false,
    bool onlyChar = false,
    bool onlyLowerCase = false,
    bool onlyUpperCase = false,
    bool onlyCharAndNum = false,
    bool onlyChinese = false,
    bool onlyEmail = false}) {
  var theReg = '';
  if (isNotEmpty(input)) {
    if (onlyEmail) {
      // Email format
      theReg = '^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}\$';
    }

    return RegExp(theReg).hasMatch(input);
  }

  return false;
}

String getFlieName({required String url}) {
  try {
    if (isNotEmpty(url)) {
      List<String> lstStr = url.split('/');
      return lstStr.last;
    }
  } catch (e) {
    Log.d('StringUtil', 'error when get file name $e');
  }

  return '';
}
