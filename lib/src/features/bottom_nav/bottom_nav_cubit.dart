import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_nav_item_type.dart';

class BottomNavCubit extends Cubit<BottomNavItemType> {
  BottomNavCubit() : super(BottomNavItemType.profile);

  void changeTab(BottomNavItemType type) {
    if (type != state) emit(type);
  }
}
