import 'package:apa/tarik_dana.dart';
import 'package:flutter/material.dart';
import 'package:apa/login_page.dart';
import 'package:apa/produk_page.dart';
import 'package:apa/penarikan_table.dart';
import 'package:apa/banner_page.dart';
import 'package:apa/Admin_page.dart';
import 'package:apa/penarikan_form.dart';
import 'pesanan_table.dart'; // Make sure this file exists with the ProductTable widget

class PemesananPage extends StatefulWidget {
  @override
  _PemesananPageState createState() => _PemesananPageState();
}

class _PemesananPageState extends State<PemesananPage> {
  String _selectedMenu = 'Pemesanan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
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
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
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
                    _buildMenuItem(
                      context,
                      Icons.dashboard,
                      'Dashboard',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AdminPage()),
                        ).then((_) {
                          setState(() {
                            _selectedMenu = 'Dashboard';
                          });
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
                        'Pemesanan',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(color: Colors.black),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: 
                                       Container(
                                          margin: EdgeInsets.only(right : 10),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 248, 223, 0)),
                                          child : Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical :10),
                                              child:Column(
                                                children: [
                                                  Text(
                                                    "Menunggu Konfirmasi :",
                                                    textAlign: TextAlign.start,
                                                    style : TextStyle(color : Colors.white)
                                                    ),
                                                  Text(
                                                    "0",
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
                                                    ),
                                                  Text(
                                                  "Pesanan",
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            )
                                        ),
                                      ),                                   
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          margin: EdgeInsets.only(right : 10),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 0, 38, 255)),
                                          child : Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical :10),
                                              child:Column(
                                                children: [
                                                  Text(
                                                    "Pesanan Di Proses :",
                                                    textAlign: TextAlign.start,
                                                    style : TextStyle(color : Colors.white)
                                                    ),
                                                  Text(
                                                    "0",
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
                                                    ),
                                                  Text(
                                                  "Pesanan",
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            )
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            margin: EdgeInsets.only(right : 10),
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 255, 0, 128)),
                                            child : Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical :10),
                                                child:Column(
                                                  children: [
                                                    Text(
                                                      "Pesanan Di Kirim :",
                                                      textAlign: TextAlign.start,
                                                      style : TextStyle(color : Colors.white)
                                                      ),
                                                    Text(
                                                      "0",
                                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
                                                      ),
                                                    Text(
                                                    "Pesanan",
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              )
                                          ),
                                        ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            margin: EdgeInsets.only(right : 10),
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 0, 138, 30)),
                                            child : Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical :10),
                                                child:Column(
                                                  children: [
                                                    Text(
                                                      "Pesanan Selesai :",
                                                      textAlign: TextAlign.start,
                                                      style : TextStyle(color : Colors.white)
                                                      ),
                                                    Text(
                                                      "0",
                                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
                                                      ),
                                                    Text(
                                                    "Pesanan",
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              )
                                          ),
                                        )
                                    ],
                                ),
                              
                            SizedBox(height: 20),
                            Text(
                              "Daftar Pesanan ",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            Divider(color: Colors.black),
                            SizedBox(height: 20),
                            PesananTable()
                          ],
                        ) 
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
    return StatefulBuilder(
      builder: (context, setState) {
        bool isHovering = false;

        return MouseRegion(
          onEnter: (_) => setState(() => isHovering = true),
          onExit: (_) => setState(() => isHovering = false),
          child: GestureDetector(
            onTap: () {
              onTap();
              setState(() {
                _selectedMenu = title;
              });
            },
            child: Container(
              color: isSelected || isHovering
                  ? Colors.grey[300]
                  : Colors.transparent,
              child: ListTile(
                leading: Icon(
                  icon,
                  color: isSelected || isHovering
                      ? Colors.green[700]
                      : Colors.black,
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    color: isSelected || isHovering
                        ? Colors.green[700]
                        : Colors.black,
                    fontWeight: isSelected || isHovering
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
