import 'package:flutter/material.dart';
import 'package:apa/login_page.dart';
import 'package:apa/produk_page.dart';
import 'package:apa/banner_page.dart';
import 'package:apa/kategori_page.dart';
import 'package:apa/tarik_dana.dart';
import 'package:apa/pemesanan.dart';
class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  String _selectedMenu = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              // Sidebar
              Container(
                width: 250,
                color: Colors.grey[200],
                child: Column(
                  children: [
                    // Logo
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset('assets/logo.png'),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'BIU Merch',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    _buildDivider(),

                    // Menu items
                    _buildMenuItem(
                      context,
                      Icons.dashboard,
                      'Dashboard',
                      () {
                        setState(() {
                          _selectedMenu = 'Dashboard';
                        });
                      },
                      _selectedMenu == 'Dashboard',
                    ),

                    _buildDivider(),

                    _buildMenuItem(
                      context,
                      Icons.monetization_on,
                      'Tarik Dana',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WalletPage()),
                        ).then((_) {
                          setState(() {
                            _selectedMenu = 'Tarik Dana';
                          });
                        });
                      },
                      _selectedMenu == 'Tarik Dana',
                    ),

                    _buildDivider(),

                    _buildMenuItem(
                      context,
                      Icons.inventory,
                      'Produk',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProdukPage()),
                        ).then((_) {
                          setState(() {
                            _selectedMenu = 'Produk';
                          });
                        });
                      },
                      _selectedMenu == 'Produk',
                    ),

                    _buildDivider(),

                    _buildMenuItem(
                      context,
                      Icons.category,
                      'Kategori',
                      () {
                        setState(() {
                          _selectedMenu = 'Kategori';
                        });
                        // Handle Kategori navigation
                      },
                      _selectedMenu == 'Kategori',
                    ),

                    _buildDivider(),

                    _buildMenuItem(
                      context,
                      Icons.shopping_cart,
                      'Pemesanan',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PemesananPage()),
                        ).then((_) {
                          setState(() {
                            _selectedMenu = 'Pemesanan';
                          });
                        });
                      },
                      _selectedMenu == 'Pemesanan',
                    ),

                    _buildDivider(),

                    _buildMenuItem(
                      context,
                      Icons.flag,
                      'Banner',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BannerPage()),
                        ).then((_) {
                          setState(() {
                            _selectedMenu = 'Banner';
                          });
                        });
                      },
                      _selectedMenu == 'Banner',
                    ),

                    _buildDivider(),

                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.exit_to_app, color: Colors.white),
                            SizedBox(width: 8),
                            Text('Keluar', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0B4D3B),
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 40),
                          side: BorderSide(color: Color(0xFF0B4D3B)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Main content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Datang Di Halaman Admin BIU Merch',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        _selectedMenu,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: SingleChildScrollView(
                          child: _selectedMenu == 'Dashboard' 
                            ? Column(
                                children: [
                                  // Use Row to place charts side by side
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 200,
                                          margin: EdgeInsets.only(right: 16),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 3,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Penjualan Bulanan',
                                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                                Expanded(child: _buildBarChart()),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 200,
                                          margin: EdgeInsets.only(left: 16),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 3,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Kategori Produk Terlaris',
                                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                                Expanded(child: _buildPieChart()),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Center(child: Text('Select a menu to see content')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey,
      thickness: 1,
      indent: 16,
      endIndent: 16,
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
    bool isSelected,
  ) {
    return MouseRegion(
      onEnter: (_) => setState(() {}),
      onExit: (_) => setState(() {}),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: isSelected
              ? Colors.grey[300]
              : Colors.transparent,
          child: ListTile(
            leading: Icon(icon,
                color: isSelected
                    ? Colors.green[700]
                    : Colors.black),
            title: Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? Colors.green[700]
                    : Colors.black,
                fontWeight: isSelected
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    final data = [
      {'month': 'Jan', 'sales': 5},
      {'month': 'Feb', 'sales': 25},
      {'month': 'Mar', 'sales': 30},
      {'month': 'Apr', 'sales': 25},
    ];

    return CustomBarChart(data: data);
  }

  Widget _buildPieChart() {
    final data = [
      {'category': 'Makanan', 'sales': 35, 'color': Colors.blue},
      {'category': 'Jasa', 'sales': 25, 'color': Colors.red},
      {'category': 'Minuman', 'sales': 20, 'color': Colors.green},
      {'category': 'Cemilan', 'sales': 20, 'color': Colors.yellow},
    ];

    return CustomPieChart(data: data);
  }
}

class CustomBarChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  CustomBarChart({required this.data});

  @override
  Widget build(BuildContext context) {
    double maxSales = data.map((e) => e['sales'] as int).reduce((a, b) => a > b ? a : b).toDouble();

    return LayoutBuilder(
      builder: (context, constraints) {
        double barWidth = constraints.maxWidth / (data.length * 2 + 1);
        double maxHeight = constraints.maxHeight - 20; // Reduce maxHeight to avoid overflow
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: data.map((item) {
            double height = (item['sales'] as int) / maxSales * maxHeight; // Use reduced maxHeight
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: barWidth / 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: barWidth,
                    height: height,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 4),
                  Text(item['month'], style: TextStyle(fontSize: 10)),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class CustomPieChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  CustomPieChart({required this.data});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double radius = constraints.maxWidth < constraints.maxHeight
            ? constraints.maxWidth / 2
            : constraints.maxHeight / 2;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Pie chart
            Container(
              width: radius * 2,
              height: radius * 2,
              child: CustomPaint(
                painter: PieChartPainter(data: data),
              ),
            ),
            SizedBox(width: 16), // Space between pie chart and labels
            // Labels
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: data.map((item) {
                return Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      color: item['color'],
                    ),
                    SizedBox(width: 8),
                    Text(
                      item['category'],
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}

class PieChartPainter extends CustomPainter {
  final List<Map<String, dynamic>> data;

  PieChartPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width < size.height ? size.width / 2 : size.height / 2;

    double total = data.map((item) => item['sales'] as int).reduce((a, b) => a + b).toDouble();
    double startAngle = 0;

    for (var item in data) {
      final sweepAngle = 2 * 3.14159 * (item['sales'] as int) / total;
      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = item['color'];

      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, sweepAngle, true, paint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
