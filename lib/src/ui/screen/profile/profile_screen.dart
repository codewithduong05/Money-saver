// src/ui/screen/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_money/src/data/local/app_database.dart';
import 'package:save_money/src/ui/screen/profile/category/category_list_screen.dart';
import 'package:save_money/src/ui/screen/profile/group/group_screen.dart';
import 'package:save_money/src/ui/screen/profile/setting/setting_screen.dart';
import 'package:save_money/src/ui/screen/profile/wallet/wallet_screen.dart';
import 'package:save_money/src/ui/viewmodel/category_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:save_money/src/ui/viewmodel/category_viewmodel.dart';
import 'package:save_money/src/domain/usecase/get_category_tree_usecase.dart';
import 'package:save_money/src/injector.dart';
import 'package:save_money/src/ui/screen/profile/category/category_list_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tài khoản'), centerTitle: true),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_outlined),
            title: const Text('Ví của tôi'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WalletScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.all_inbox),
            title: const Text('Nhóm'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider(
                    create: (_) =>
                        CategoryViewModel(_getCategoryTree)(_getCategoryTree)(
                          getIt<GetCategoryTreeUseCase>(),
                        )..loadCategories("expense"),
                    child: const CategoryScreen(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Cài đặt'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingScreen()),
              );
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.brightness_6_outlined),
            title: const Text('Giao diện sáng/tối'),
            value: true,
            onChanged: (val) {},
          ),
          ListTile(
            leading: const Icon(Icons.file_upload_sharp),
            title: const Text('Xuất file dữ liệu'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.cloud),
            title: const Text('Đồng bộ cloud'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.attach_money),
            title: const Text('Sổ nợ'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Giới thiệu'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
