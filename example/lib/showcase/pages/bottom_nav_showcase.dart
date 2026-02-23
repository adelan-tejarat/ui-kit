import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vamstreet_components/vamstreet_components.dart'
    show
        BottomNavItemType,
        BottomNavCubit,
        CenterBarcodeFab,
        BottomNavConfig,
        CustomBottomNav;

class BottomNavShowcase extends StatelessWidget {
  const BottomNavShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavItemType>(
      builder: (context, currentTab) {
        return Scaffold(
          body: _buildBody(currentTab),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CenterBarcodeFab(
            backgroundColor: BottomNavConfig.centerButtonColor,
            onPressed: () {
              context.read<BottomNavCubit>().changeTab(
                BottomNavItemType.barcode,
              );
            },
          ),
          bottomNavigationBar: CustomBottomNav(
            currentTab: currentTab,
            onChanged: (type) {
              context.read<BottomNavCubit>().changeTab(type);
            },
          ),
        );
      },
    );
  }

  Widget _buildBody(BottomNavItemType currentTab) {
    switch (currentTab) {
      case BottomNavItemType.profile:
        return const ProfileSamplePage();
      case BottomNavItemType.settings:
        return const SettingsSamplePage();
      case BottomNavItemType.wallet:
        return const WalletSamplePage();
      case BottomNavItemType.services:
        return const ServicesSamplePage();
      case BottomNavItemType.barcode:
        return const BarcodeSamplePage();
    }
  }
}

class ProfileSamplePage extends StatelessWidget {
  const ProfileSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("♻️ Rebuilding ProfileSamplePage");
    return const Center(
      child: Text("صفحه پروفایل (نمونه)", style: TextStyle(fontSize: 24)),
    );
  }
}

class SettingsSamplePage extends StatelessWidget {
  const SettingsSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("♻️ Rebuilding SettingsSamplePage");
    return const Center(
      child: Text("صفحه تنظیمات", style: TextStyle(fontSize: 24)),
    );
  }
}

class ServicesSamplePage extends StatelessWidget {
  const ServicesSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("♻️ Rebuilding ServicesSamplePage");

    return const Center(
      child: Text("صفحه خدمات ما", style: TextStyle(fontSize: 24)),
    );
  }
}

class WalletSamplePage extends StatelessWidget {
  const WalletSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("♻️ Rebuilding WalletSamplePage");

    return const Center(
      child: Text("صفحه کیف پول", style: TextStyle(fontSize: 24)),
    );
  }
}

class BarcodeSamplePage extends StatelessWidget {
  const BarcodeSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("♻️ Rebuilding BarcodeSamplePage");

    return const Center(
      child: Text("صفحه بارکد", style: TextStyle(fontSize: 24)),
    );
  }
}
