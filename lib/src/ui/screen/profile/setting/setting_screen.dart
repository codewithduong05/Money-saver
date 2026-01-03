// src/ui/screen/setting/setting_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String settingsMasterKey = 'SETTINGS_MASTER_KEY';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool excludeFromReport = false;
  bool alwaysShowDetail = false;
  bool syncWifiOnly = true;
  SharedPreferences? prefs;

  String selectedTheme = 'Sáng';
  String selectedLanguage = 'Tiếng Việt';
  String selectedMoneyFormat = '1,000,000';
  String selectedDateFormat = 'dd/MM/yyyy';
  String selectedCurrency = 'VND';
  String selectedReminder = 'Bật';

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      excludeFromReport = prefs?.getBool('excludeFromReport') ?? false;
      alwaysShowDetail = prefs?.getBool('alwaysShowDetail') ?? false;
      syncWifiOnly = prefs?.getBool('syncWifiOnly') ?? true;
      selectedTheme = prefs?.getString('selectedTheme') ?? 'Sáng';
      selectedLanguage = prefs?.getString('selectedLanguage') ?? 'Tiếng Việt';
      selectedMoneyFormat =
          prefs?.getString('selectedMoneyFormat') ?? '1,000,000';
      selectedDateFormat =
          prefs?.getString('selectedDateFormat') ?? 'dd/MM/yyyy';
      selectedCurrency = prefs?.getString('selectedCurrency') ?? 'VND';
      selectedReminder = prefs?.getString('selectedReminder') ?? 'Bật';
    });
  }

  void _saveBool(String key, bool value) {
    prefs?.setBool(key, value);
  }

  void _saveString(String key, String value) {
    prefs?.setString(key, value);
  }

  Future<void> _showRadioDialog(
    String title,
    List<String> options,
    String current,
    Function(String) onSelected,
  ) async {
    String tempSelected = current;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: options
              .map(
                (e) => RadioListTile<String>(
                  title: Text(e),
                  value: e,
                  groupValue: tempSelected,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        tempSelected = val;
                      });
                      Navigator.pop(context);
                      onSelected(val);
                    }
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Cài đặt'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          // Nhóm: Hiển thị
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Hiển thị',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6_outlined),
            title: Text('Giao diện: $selectedTheme'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              _showRadioDialog(
                'Chọn giao diện',
                ['Sáng', 'Tối', 'Tự động'],
                selectedTheme,
                (v) {
                  setState(() => selectedTheme = v);
                  _saveString('selectedTheme', v);
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text('Chọn ngôn ngữ: $selectedLanguage'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              _showRadioDialog(
                'Chọn ngôn ngữ',
                ['Tiếng Việt', 'English'],
                selectedLanguage,
                (v) {
                  setState(() => selectedLanguage = v);
                  _saveString('selectedLanguage', v);
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.format_list_numbered),
            title: Text('Kiểu hiển thị số tiền: $selectedMoneyFormat'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              _showRadioDialog(
                'Kiểu hiển thị số tiền',
                ['1,000,000', '1.000.000', '1000000'],
                selectedMoneyFormat,
                (v) {
                  setState(() => selectedMoneyFormat = v);
                  _saveString('selectedMoneyFormat', v);
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.date_range),
            title: Text('Chọn định dạng ngày tháng: $selectedDateFormat'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              _showRadioDialog(
                'Định dạng ngày tháng',
                ['dd/MM/yyyy', 'MM/dd/yyyy', 'yyyy-MM-dd'],
                selectedDateFormat,
                (v) {
                  setState(() => selectedDateFormat = v);
                  _saveString('selectedDateFormat', v);
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.attach_money),
            title: Text('Đơn vị Tiền cho ví: $selectedCurrency'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              _showRadioDialog(
                'Đơn vị tiền',
                ['VND', 'USD', 'EUR'],
                selectedCurrency,
                (v) {
                  setState(() => selectedCurrency = v);
                  _saveString('selectedCurrency', v);
                },
              );
            },
          ),
          // Không tính vào báo cáo
          ListTile(
            leading: const Icon(Icons.remove_circle_outline),
            title: const Text('Không tính vào báo cáo'),
            subtitle: const Text(
              'Bật tuỳ chọn không tính vào báo cáo, thêm giao dịch',
            ),
            trailing: Switch(
              value: excludeFromReport,
              onChanged: (val) {
                setState(() => excludeFromReport = val);
                _saveBool('excludeFromReport', val);
              },
            ),
            onTap: () {},
          ),
          SwitchListTile(
            secondary: const Icon(Icons.list_alt_outlined),
            title: const Text('Luôn hiển thị chi tiết giao dịch'),
            value: alwaysShowDetail,
            onChanged: (val) {
              setState(() => alwaysShowDetail = val);
              _saveBool('alwaysShowDetail', val);
            },
          ),
          // Nhóm: Thông báo
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Thông báo',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active_outlined),
            title: Text('Nhắc thêm giao dịch hàng ngày: $selectedReminder'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              _showRadioDialog(
                'Nhắc thêm giao dịch',
                ['Bật', 'Tắt'],
                selectedReminder,
                (v) {
                  setState(() => selectedReminder = v);
                  _saveString('selectedReminder', v);
                },
              );
            },
          ),
          // Nhóm: Cơ sở dữ liệu
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Cơ sở dữ liệu',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.wifi),
            title: const Text('Đồng bộ chỉ khi dùng wifi'),
            value: syncWifiOnly,
            onChanged: (val) {
              setState(() => syncWifiOnly = val);
              _saveBool('syncWifiOnly', val);
            },
          ),
          // Nhóm: Giới thiệu
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Giới thiệu',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Money Saver'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Money Saver',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2026 Money Saver',
              );
            },
          ),
        ],
      ),
    );
  }
}
