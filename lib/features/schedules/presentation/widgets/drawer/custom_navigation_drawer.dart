import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octo_image/octo_image.dart';
import 'package:unique_master_dashboard/features/schedules/presentation/cubit/cubit/drawer_cubit.dart';
import 'package:unique_master_dashboard/features/schedules/presentation/widgets/list_tiles/drawer_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../injection_container.dart' as di;

class CustomNavigationDrawer extends StatefulWidget {
  const CustomNavigationDrawer({@required this.permanentlyDisplay, Key key})
      : super(key: key);

  final bool permanentlyDisplay;

  @override
  _CustomNavigationDrawerState createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  final _drawerCubit = di.getIt<DrawerCubit>();

  @override
  void initState() {
    super.initState();

    //WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, DrawerState>(
      bloc: _drawerCubit,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.

          child: Row(
            children: [
              Container(
                width: 300,
                height: 700,
                child: SingleChildScrollView(
                  child: Column(
                    // Important: Remove any padding from the ListView.
                    //padding: EdgeInsets.zero,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 40),
                        height: 100,
                        child: OctoImage(
                          image: Image.asset(
                            "assets/icons/brand_icon.png",
                            alignment: Alignment.center,
                            isAntiAlias: true,
                            fit: BoxFit.fitWidth,
                          ).image,
                          placeholderBuilder: OctoPlaceholder.blurHash(
                            'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                          ),
                          errorBuilder: OctoError.icon(color: Colors.red),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      DrawerListTile(
                        id: 1,
                        isSelected: state.selectedIndex == 1,
                        text: 'home_page.drawer_items.dashboard'.tr(),
                        onTap: (int id) {
                          print('Dashboard Clicked!');
                          _drawerCubit.changeSelection(selectedItem: 1);
                        },
                      ),
                      DrawerListTile(
                        id: 2,
                        isSelected: state.selectedIndex == 2,
                        text: 'home_page.drawer_items.my_courses'.tr(),
                        onTap: (int id) {
                          print('my_courses Clicked!');
                          _drawerCubit.changeSelection(selectedItem: 2);
                        },
                      ),
                      DrawerListTile(
                        id: 3,
                        isSelected: state.selectedIndex == 3,
                        text: 'home_page.drawer_items.schedule'.tr(),
                        onTap: (int id) {
                          print('schedule Clicked!');
                          _drawerCubit.changeSelection(selectedItem: 3);
                        },
                      ),
                      DrawerListTile(
                        id: 4,
                        isSelected: state.selectedIndex == 4,
                        text: 'home_page.drawer_items.homework'.tr(),
                        onTap: (int id) {
                          print('homework Clicked!');
                          _drawerCubit.changeSelection(selectedItem: 4);
                        },
                      ),
                      DrawerListTile(
                        id: 5,
                        isSelected: state.selectedIndex == 5,
                        text: 'home_page.drawer_items.quizes'.tr(),
                        onTap: (int id) {
                          print('quizes Clicked!');
                          _drawerCubit.changeSelection(selectedItem: 5);
                        },
                      ),
                      DrawerListTile(
                        id: 6,
                        isSelected: state.selectedIndex == 6,
                        text: 'home_page.drawer_items.transactions'.tr(),
                        onTap: (int id) {
                          print('transactions Clicked!');
                          _drawerCubit.changeSelection(selectedItem: 6);
                        },
                      ),
                      DrawerListTile(
                        id: 7,
                        isSelected: state.selectedIndex == 7,
                        text: 'home_page.drawer_items.support'.tr(),
                        onTap: (int id) {
                          print('support Clicked!');
                          _drawerCubit.changeSelection(selectedItem: 7);
                        },
                      ),
                      DrawerListTile(
                        id: 8,
                        isSelected: state.selectedIndex == 8,
                        text: 'home_page.drawer_items.marks'.tr(),
                        onTap: (int id) {
                          print('marks Clicked!');
                          _drawerCubit.changeSelection(selectedItem: 8);
                        },
                      ),
                      DrawerListTile(
                        id: 9,
                        isSelected: state.selectedIndex == 9,
                        text: 'home_page.drawer_items.setting'.tr(),
                        onTap: (int id) {
                          print('setting Clicked!');
                          _drawerCubit.changeSelection(selectedItem: 9);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.permanentlyDisplay)
                const VerticalDivider(
                  width: 1,
                )
            ],
          ),
        );
      },
    );
  }

  /// Closes the drawer if applicable (which is only when it's not been displayed permanently) and navigates to the specified route
  /// In a mobile layout, the a modal drawer is used so we need to explicitly close it when the user selects a page to display
  Future<void> _navigateTo(BuildContext context, String routeName) async {
    if (widget.permanentlyDisplay) {
      Navigator.pop(context);
    }
    await Navigator.pushNamed(context, routeName);
  }

  List<Widget> _mockDrawerItems = <Widget>[];
}
