import 'rive_model.dart';
import 'package:flutter/cupertino.dart';

class Menu {
  final String title;
  final IconData icon;

  Menu({required this.title, required this.icon});
}

List<Menu> sidebarMenus = [
  Menu(
    title: "Home",
    icon: CupertinoIcons.home,
  ),
  Menu(
    title: "Status",
    icon: CupertinoIcons.antenna_radiowaves_left_right,
    // Opcional: Personaliza el tamaño, color y otros atributos del icono
  ),
];
List<Menu> sidebarMenus2 = [
  Menu(
    title: "Graphics",
    icon: CupertinoIcons.graph_square,
    // Opcional: Personaliza el tamaño, color y otros atributos del icono
  ),
  Menu(
    title: "Exportable",
    icon: CupertinoIcons.doc_chart_fill,
    // Opcional: Personaliza el tamaño, color y otros atributos del icono
  ),
];

List<Menu> bottomNavItems = [
  Menu(
    title: "Chat",
    icon: CupertinoIcons.chart_bar,
    // Opcional: Personaliza el tamaño, color y otros atributos del icono
  ),
  Menu(
    title: "Search",
    icon: CupertinoIcons.search,
    // Opcional: Personaliza el tamaño, color y otros atributos del icono
  ),
  Menu(
    title: "Timer",
    icon: CupertinoIcons.time,
    // Opcional: Personaliza el tamaño, color y otros atributos del icono
  ),
  Menu(
    title: "Notification",
    icon: CupertinoIcons.app_badge,
    // Opcional: Personaliza el tamaño, color y otros atributos del icono
  ),
  Menu(
    title: "Profile",
    icon: CupertinoIcons.profile_circled,
    // Opcional: Personaliza el tamaño, color y otros atributos del icono
  ),
];
