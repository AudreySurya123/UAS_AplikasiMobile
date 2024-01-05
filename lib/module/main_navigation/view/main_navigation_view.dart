import 'package:flutter/material.dart';
import '../../dashboard/view/dashboard_view.dart';
import '../controller/main_navigation_controller.dart';
import '../../profile/view/profile_view.dart';
import '../../train/view/train_view.dart'; // Import TrainView

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  State<MainNavigationView> createState() => MainNavigationController();

  Widget build(BuildContext context, MainNavigationController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 4,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: [
            const DashboardView(),
            Container(), // Placeholder for Order
            TrainView(), // Use TrainView here
            const ProfileView(), // ProfileView
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: controller.selectedIndex,
              onTap: (newIndex) => controller.updateIndex(newIndex),
              showSelectedLabels: false,
              elevation: 0.0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 36.0,
                  ),
                  label: "Dashboard",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.confirmation_number,
                    size: 36.0,
                  ),
                  label: "Order",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.train,
                    size: 36.0,
                  ),
                  label: "Train",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 36.0,
                  ),
                  label: "User",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
