import 'package:easy_localization/easy_localization.dart';

extension StringLocalization on String {
  // kullanmak için hangi sayfada çağırılırsa çağrılsın  StringLocalization yazıp bu dpsyanın dahil edilmesi gerekiyor
  String get locale => this.tr();
}
