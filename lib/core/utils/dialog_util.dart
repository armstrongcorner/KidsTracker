import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showTopDialog(BuildContext context, Widget child, {int duration = 500}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    transitionDuration: Duration(milliseconds: duration), // 控制动画时长
    pageBuilder: (context, animation1, animation2) {
      return Container();
    },
    transitionBuilder: (context, animation1, animation2, widget) {
      final curvedValue = Curves.easeInOut.transform(animation1.value) * 1.1;
      return Transform.translate(
        offset: Offset(0, -MediaQuery.of(context).size.height * (1 - curvedValue)),
        child: Opacity(
          opacity: animation1.value,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: child,
            ),
          ),
        ),
      );
    },
  );
}

void showEaseInDialog(BuildContext context, Widget child, {int duration = 500}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    transitionDuration: Duration(milliseconds: duration), // 控制动画时长
    pageBuilder: (context, animation1, animation2) {
      return Container();
    },
    transitionBuilder: (context, animation1, animation2, widget) {
      final curvedValue = Curves.easeIn.transform(animation1.value) * 1.1;
      return Transform.scale(
        scale: curvedValue,
        child: Opacity(
          opacity: animation1.value,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: child,
            ),
          ),
        ),
      );
    },
  );
}

Future<String?> showBottomMultiOptionsSheet(BuildContext context, List<String> options) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return _MultiOptionsSheetContent(
        options: options,
      );
    },
  );
}

Future<String?> showBottomWidget(BuildContext context, Widget child) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return child;
    },
  );
}

class _MultiOptionsSheetContent extends StatelessWidget {
  final List<String> options;
  _MultiOptionsSheetContent({Key? key, required this.options});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '请选择',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          ...options.map((option) {
            return Column(
              children: [
                ListTile(
                  title: Center(
                      child: Text(
                    option,
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  )),
                  titleAlignment: ListTileTitleAlignment.center,
                  onTap: () => Navigator.pop(context, option), // 选中后关闭弹窗并回传值
                ),
                Divider(
                  indent: 20,
                )
              ],
            );
          }).toList(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
