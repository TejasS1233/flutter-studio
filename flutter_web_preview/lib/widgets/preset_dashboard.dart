import 'package:flutter/material.dart';

class PresetDashboard extends StatelessWidget {
  const PresetDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Color(0xFF1a1a1a),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Color(0xFF1a1a1a),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Cards
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Total Revenue',
                    '\$15,231.89',
                    '+20.1%',
                    Icons.trending_up,
                    const Color(0xFF0460c6),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Users',
                    '2,350',
                    '+12.5%',
                    Icons.people_outline,
                    const Color(0xFF10b981),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Chart Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Activity Overview',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1a1a1a),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 120,
                    child: CustomPaint(
                      size: const Size(double.infinity, 120),
                      painter: SimpleChartPainter(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Recent Activity
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent Activity',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1a1a1a),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildActivityItem(
                    'New user registered',
                    '2 min ago',
                    Icons.person_add,
                  ),
                  _buildActivityItem(
                    'Payment received',
                    '15 min ago',
                    Icons.payment,
                  ),
                  _buildActivityItem(
                    'Order completed',
                    '1 hour ago',
                    Icons.check_circle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0460c6),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String label,
    String value,
    String change,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              Icon(icon, size: 18, color: color),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1a1a1a),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            change,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF10b981),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String title, String time, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF0460c6).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 16, color: const Color(0xFF0460c6)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1a1a1a),
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SimpleChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0460c6)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    final points = [0.2, 0.5, 0.3, 0.7, 0.4, 0.8, 0.6, 0.9];

    path.moveTo(0, size.height * (1 - points[0]));

    for (int i = 1; i < points.length; i++) {
      final x = (size.width / (points.length - 1)) * i;
      final y = size.height * (1 - points[i]);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);

    // Draw dots
    final dotPaint = Paint()
      ..color = const Color(0xFF0460c6)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < points.length; i++) {
      final x = (size.width / (points.length - 1)) * i;
      final y = size.height * (1 - points[i]);
      canvas.drawCircle(Offset(x, y), 3, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
