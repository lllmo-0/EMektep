// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:emektep/pages/cards.dart';
// // import 'package:emektep/pages/profile.dart';

// class HomePage extends StatefulWidget {
//   final Widget child;
//   const HomePage({super.key, required this.child});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int currentIndex = 0;
//   void changeTab(int index) {
//     switch (index) {
//       case 0:
//         context.go('/');
//         break;
//       case 1:
//         context.go(CardsPage.route);
//         break;
//     }
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(Icons.add),
//       ),
//       extendBody: true,
//       body: widget.child,
//       bottomNavigationBar: NavigationBar(
//           selectedIndex: currentIndex,
//           onDestinationSelected: changeTab,
//           destinations: const [
//             NavigationDestination(icon: Icon(Icons.newspaper), label: 'News'),
//             NavigationDestination(
//                 icon: Icon(Icons.card_giftcard), label: 'Cards'),
//           ]),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:emektep/pages/reports.dart';

class HomePage extends StatelessWidget {
  final PocketBase pb;
  final RecordModel currentUser;

  const HomePage({
    Key? key,
    required this.pb,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Upper section with logo and buttons
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: const BoxDecoration(
                color:
                    Color(0xFF004D40), // Dark green color as in the screenshot
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  // Menu button (3 lines)
                  Positioned(
                    top: 16,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        // Menu functionality to be implemented
                      },
                    ),
                  ),

                  // Options button (3 dots)
                  Positioned(
                    top: 16,
                    right: 16,
                    child: IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {
                        // Options functionality to be implemented
                      },
                    ),
                  ),

                  // Logo in center
                  Center(
                    child: Text(
                      'Σ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Notifications section
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  // Email icon
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.email, color: Colors.white),
                  ),
                  const SizedBox(width: 12),

                  // Notification text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Уведомления',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Kozlov Alexei 10-B: Reduced 10 points for repeatedly being late to class and failing to submit assignments on time. ...',
                          style: TextStyle(color: Colors.white70),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  // More button
                  IconButton(
                    icon: const Icon(Icons.more_horiz, color: Colors.white),
                    onPressed: () {
                      // More notifications functionality
                    },
                  ),
                ],
              ),
            ),

            // Navigation grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(16),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  // Cards button
                  _buildNavButton(
                    context,
                    title: 'Карточки',
                    icon: Icons.credit_card,
                    iconColor: Colors.red,
                    accentColor: Colors.green,
                    onTap: () {
                      // Navigate to Cards page
                    },
                  ),

                  // Fast-report button
                  _buildNavButton(
                    context,
                    title: 'Fast-report',
                    icon: Icons.speed,
                    iconColor: Colors.blue,
                    accentColor: Colors.purple,
                    onTap: () {
                      // Navigate to Report Form page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReportFormPage(
                            pb: pb,
                            currentUser: currentUser,
                          ),
                        ),
                      );
                    },
                  ),

                  // My class button
                  _buildNavButton(
                    context,
                    title: 'Мой класс',
                    icon: Icons.people,
                    iconColor: Colors.orange,
                    accentColor: Colors.orange,
                    onTap: () {
                      // Navigate to My Class page
                    },
                  ),

                  // Merit button
                  _buildNavButton(
                    context,
                    title: 'Merit',
                    icon: Icons.arrow_circle_up,
                    iconColor: Colors.white,
                    accentColor: Colors.purple,
                    onTap: () {
                      // Navigate to Merit page
                    },
                  ),

                  // Events button
                  _buildNavButton(
                    context,
                    title: 'События',
                    icon: Icons.calendar_today,
                    iconColor: Colors.white,
                    accentColor: Colors.blue,
                    onTap: () {
                      // Navigate to Events page
                    },
                  ),

                  // Support button
                  _buildNavButton(
                    context,
                    title: 'Поддержка',
                    icon: Icons.warning,
                    iconColor: Colors.white,
                    accentColor: Colors.teal,
                    onTap: () {
                      // Navigate to Support page
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color iconColor,
    required Color accentColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: accentColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
