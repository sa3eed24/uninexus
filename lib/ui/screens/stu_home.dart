import 'package:flutter/material.dart';

class StuHomeScreen extends StatefulWidget {
  const StuHomeScreen({Key? key}) : super(key: key);

  @override
  State<StuHomeScreen> createState() => _StuHomeScreenState();
}

class _StuHomeScreenState extends State<StuHomeScreen> {
  int _currentIndex = 0;

  static const Color primaryBlue = Color(0xFF237ABA);
  static const Color textBlue = Color(0xFF0A4C7D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ========= TOP BAR =========
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          'assets/images/menu.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Home',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: primaryBlue,
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),

                const SizedBox(height: 24),

                // ========= PROFILE HEADER =========
                Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      'Welcome Back!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: textBlue,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ========= CARD 1 (Schedule teaser) =========
                _StuHomeCard(
                  borderColor: primaryBlue,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Hi!',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: textBlue,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Want to check your\nschedule?',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: textBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          'assets/images/main_calender.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),

                const SizedBox(height: 16),

                // ========= TRANSPARENT NOTIFICATIONS AREA =========
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: primaryBlue,
                        width: 1.5,
                      ),
                    ),
                    child: const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // ========= CENTER QR BUTTON =========
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 62,
        height: 62,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: primaryBlue,
          onPressed: () {},
          child: Image.asset(
            'assets/images/qr_code.png',
            width: 30,
            height: 30,
          ),
        ),
      ),

      // ========= BOTTOM NAVIGATION =========
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 74,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _StuBottomItem(
                image: 'assets/images/home.png',
                label: 'Home',
                selected: _currentIndex == 0,
                onTap: () => setState(() => _currentIndex = 0),
              ),
              _StuBottomItem(
                image: 'assets/images/calendar.png',
                label: 'schedule',
                selected: _currentIndex == 1,
                onTap: () => setState(() => _currentIndex = 1),
              ),
              const SizedBox(width: 40),
              _StuBottomItem(
                image: 'assets/images/qa.png',
                label: 'Q&A',
                selected: _currentIndex == 2,
                onTap: () => setState(() => _currentIndex = 2),
              ),
              _StuBottomItem(
                image: 'assets/images/user.png',
                label: 'Profile',
                selected: _currentIndex == 3,
                onTap: () => setState(() => _currentIndex = 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========= REUSABLE CARD =========
class _StuHomeCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color borderColor;

  const _StuHomeCard({
    Key? key,
    required this.child,
    required this.borderColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.9),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderColor, width: 1.2),
          ),
          child: child,
        ),
      ),
    );
  }
}

// ========= REUSABLE NAV ITEM =========
class _StuBottomItem extends StatelessWidget {
  final String image;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _StuBottomItem({
    Key? key,
    required this.image,
    required this.label,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = selected ? _StuHomeScreenState.primaryBlue : Colors.grey;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 65,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Image.asset(
              image,
              width: 26,
              height: 26,
              color: selected ? _StuHomeScreenState.primaryBlue : Colors.black54,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: selected ? _StuHomeScreenState.primaryBlue : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
