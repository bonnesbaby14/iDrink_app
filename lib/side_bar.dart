import 'package:flutter/material.dart';
import 'package:idrink_app/side_menu.dart';
import 'package:idrink_app/utils/rive_utils.dart';

import 'info_card.dart';
import 'menu.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    Key? key,
    required this.name,
    required this.selectedMenu,
    required this.updateSelectedSideMenu,
  }) : super(key: key);

  final Menu selectedMenu;
  final void Function(Menu) updateSelectedSideMenu;
  final String name;
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Menu selectedSideMenu = sidebarMenus.first;
  


  void updateSelectedMenu(Menu menu) {
    widget.updateSelectedSideMenu(menu);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 288,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF17203A),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               InfoCard(
                name: widget.name,
                bio: "TikToker",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sidebarMenus
                  .map((menu) => SideMenu(
                        menu: menu,
                        selectedMenu: widget
                            .selectedMenu, // Utiliza widget.selectedMenu en lugar de selectedSideMenu
                        press: () {
                          updateSelectedMenu(menu);
                        },
                      ))
                  .toList(),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
                child: Text(
                  "History".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sidebarMenus2
                  .map((menu) => SideMenu(
                        menu: menu,
                        selectedMenu: widget
                            .selectedMenu, // Utiliza widget.selectedMenu en lugar de selectedSideMenu
                        press: () {
                          updateSelectedMenu(menu);
                        },
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
