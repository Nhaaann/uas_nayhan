// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:uas_nayhan/utils/flushbar.dart';
import 'package:uas_nayhan/page/detail/Detail.dart';
// import 'package:uas_nayhan/page/home/components/appbar.dart';
import 'package:uas_nayhan/page/home/model/model.dart';
import 'package:uas_nayhan/page/keranjang/keranjang.dart';
import 'package:uas_nayhan/utils/color.dart';

import '../../utils/text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  bool test = false;
  // Jumbotron
  static List<JumbotronModel> list_jumbotron = [
    JumbotronModel('assets/images/Rectangle 5.png', 'Kamar Tidur'),
    JumbotronModel('assets/images/Rectangle 5.png', 'Ruang Kerja'),
    JumbotronModel('assets/images/Rectangle 5.png', 'Dapur'),
    JumbotronModel('assets/images/Rectangle 5.png', 'Bayi & Anak'),
    JumbotronModel('assets/images/Rectangle 5.png', 'Tekstil'),
    JumbotronModel('assets/images/Rectangle 5.png', 'Penyimpanan'),
  ];
  List<JumbotronModel> display_jumbotron = List.of(list_jumbotron);

  // Produk Populer
  static List<ProdukPopulerModel> list_produkPopuler = [
    ProdukPopulerModel(
      'assets/images/Rectangle 15.png',
      'KROKFJORDEN',
      'Pengait dengan plastik isap ...',
      99900,
    ),
    ProdukPopulerModel(
      'assets/images/Rectangle 16.png',
      'ALEX/LAGKAPTEN',
      'Meja, hijau muda/putih, 120x60 cm',
      1909000,
    ),
    ProdukPopulerModel(
      'assets/images/Rectangle 17.png',
      'FARDAL/PAX',
      'Kombinasi lemari pakaian, putih/hig...',
      8400000,
    ),
    ProdukPopulerModel(
      'assets/logo/Rectangle 16 (1).png',
      'ALEX',
      'Unit laci, abu-abu toska, 36x70 cm',
      1350000,
    ),
    ProdukPopulerModel(
      'assets/logo/Rectangle 16 (2).png',
      'MILLBERGET',
      'Kursi putar, murum hitam',
      1799000,
    ),
    ProdukPopulerModel(
      'assets/logo/Rectangle 16 (3).png',
      'SONGESAND',
      'Rngk tmpt tdr dg 2 ktk penyimpanan, cokelat, 160x200 cm',
      3499000,
    ),
    ProdukPopulerModel(
      'assets/logo/Rectangle 16 (4).png',
      'HEKTAR',
      'Lampu lantai, abu-abu tua',
      1299000,
    ),
    ProdukPopulerModel(
      'assets/logo/Rectangle 16 (5).png',
      'MACKAPÄR',
      'Kabinet/tempat sepatu, putih, 80x35x102 cm',
      1499000,
    ),
  ];
  List<ProdukPopulerModel> display_produkPopuler = List.of(list_produkPopuler);

  // koleksi kami
  static List<KoleksiModel> list_koleksi = [
    KoleksiModel(
      'assets/images/Rectangle 19.png',
      0xff4F707F,
      'BLÅVINGAD0',
      'Koleksi yang terinspirasi dari lautan untuk menciptakan ...',
    ),
    KoleksiModel(
      'assets/images/Rectangle 21.png',
      0xff5E4238,
      'VINTERFINT',
      'Koleksi VINTERFINT hadir dengan warna dan pola indah ...',
    ),
    KoleksiModel(
      'assets/images/Rectangle 19.png',
      0xff4F707F,
      'BLÅVINGAD0',
      'Koleksi yang terinspirasi dari lautan untuk menciptakan ...',
    ),
  ];
  List<KoleksiModel> display_koleksi = List.of(list_koleksi);

  void FilterProduk(String value) {
    setState(() {
      display_jumbotron = list_jumbotron
          .where((element) =>
              element.jumbotronText.toLowerCase().contains(value.toLowerCase()))
          .toList();

      display_produkPopuler = list_produkPopuler
          .where((element) => element.ProdukPopulertext.toLowerCase()
              .contains(value.toLowerCase()))
          .toList();

      display_koleksi = list_koleksi
          .where((element) =>
              element.KoleksiText.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  bool drwr = true;
  bool _showTextField = true;
  bool _showSearchIcon = true;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final double currentScroll = _scrollController.position.pixels;
    if (currentScroll > 20 && _showTextField) {
      setState(() {
        _showTextField = false;
        _showSearchIcon = true;
      });
    } else if (currentScroll <= 20 && !_showTextField) {
      setState(() {
        _showTextField = true;
        _showSearchIcon = false;
      });
    }
  }

  Widget build(BuildContext context) {
    final screenWitdh = MediaQuery.of(context).size.width;
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/logo/image 1 (1).png'),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        drwr = !drwr;
                      });
                    },
                    child: !_showTextField
                        ? Icon(
                            LucideIcons.search,
                            color: primaryText,
                          )
                        : SizedBox(),
                  ),
                  SizedBox(width: 24),
                  Icon(
                    LucideIcons.bell,
                    color: primaryText,
                  ),
                  SizedBox(width: 24),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Keranjang();
                        },
                      ));
                    },
                    child: Icon(
                      LucideIcons.shoppingCart,
                      color: primaryText,
                    ),
                  ),
                ],
              )
            ],
          ),
          pinned: true,
          floating: true,
          expandedHeight: 160.0,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return FlexibleSpaceBar(
                title: _showTextField
                    ? Container(
                        height: 42,
                        width: screenWitdh,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        // decoration: BoxDecoration(
                        //   border:
                        //       Border.all(color: Color(0xffE7E7E7), width: 1),
                        // ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 5),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: secondText,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    hintText: 'Cari barang impianmu',
                                    prefixIcon: Column(
                                      children: [
                                        SizedBox(height: 10),
                                        Icon(
                                          Iconsax.search_normal_1,
                                          size: 20,
                                          color: primaryText,
                                        ),
                                      ],
                                    ),
                                    fillColor: white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xffE7E7E7)),
                                    ),
                                    focusColor: Colors.blue,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors
                                              .blue), // Change color for focused state
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xffE7E7E7)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
                centerTitle: true,
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: !test
                              ? Image.asset(
                                  'assets/logo/page__en_us_1668678827252_0_1 1.png',
                                  fit: BoxFit.cover,
                                  width: screenWitdh,
                                )
                              : SizedBox(),
                        ),
                        SizedBox(
                            height: display_jumbotron.isEmpty &&
                                    display_koleksi.isEmpty
                                ? 0
                                : 48),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 16.0, // Spasi horizontal antara item
                          runSpacing: 16.0, // Spasi vertikal antara baris
                          children: display_jumbotron.map((e) {
                            return container_1(e);
                          }).toList(),
                        ),
                        SizedBox(
                            height: display_jumbotron.isEmpty &&
                                    display_koleksi.isEmpty
                                ? 0
                                : 48),
                        Container(
                          child: display_produkPopuler.isEmpty
                              ? Text('')
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Produk Populer',
                                      style: TextStyle(
                                        color: primaryText,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    TextLihatSemua()
                                  ],
                                ),
                        ),
                        SizedBox(height: 16),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: display_produkPopuler.map((e) {
                              return _ProdukPopuler(e);
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: display_jumbotron.isEmpty ? 0 : 48),
                        Container(
                          child: display_koleksi.isEmpty
                              ? Text('')
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text('anjing'),
                                            duration: Duration(seconds: 1),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Telusuri Koleksi Kami',
                                        style: TextStyle(
                                          color: primaryText,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    TextLihatSemua()
                                  ],
                                ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: display_koleksi.map((e) {
                              return _KoleksiKami(e);
                            }).toList(),
                          ),
                        ),
                        // SizedBox(height: 48),
                        // _Penawaran(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     // automaticallyImplyLeading: false,
    //     backgroundColor: white,
    //     elevation: 1.2,
    //     toolbarHeight: 80,
    //     title: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Image.asset('assets/logo/image 1 (1).png'),
    //         Row(
    //           children: [
    //             GestureDetector(
    //               onTap: () {
    //                 setState(() {
    //                   drwr = !drwr;
    //                 });
    //               },
    //               child: Icon(
    //                 LucideIcons.search,
    //                 color: primaryText,
    //               ),
    //             ),
    //             SizedBox(width: 24),
    //             Icon(
    //               LucideIcons.bell,
    //               color: primaryText,
    //             ),
    //             SizedBox(width: 24),
    //             GestureDetector(
    //               onTap: () {
    //                 Navigator.of(context).push(MaterialPageRoute(
    //                   builder: (context) {
    //                     return Keranjang();
    //                   },
    //                 ));
    //               },
    //               child: Icon(
    //                 LucideIcons.shoppingCart,
    //                 color: primaryText,
    //               ),
    //             ),
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    //   body: Stack(
    //     children: [
    //       drwr
    //           ? SizedBox()
    //           : Positioned(
    //               left: 24,
    //               right: 24,
    //               child: TextField(
    //                 onChanged: (value) {
    //                   FilterProduk(value);
    //                 },
    //                 decoration: InputDecoration(
    //                   hintText: 'Cari barang impianmu',
    //                   prefixIcon: Icon(LucideIcons.search),
    //                   iconColor: Colors.black87,
    //                   fillColor: Colors.grey.shade200,
    //                   filled: true,
    //                   border: OutlineInputBorder(
    //                     borderSide: BorderSide.none,
    //                     borderRadius: BorderRadius.circular(8),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //       Padding(
    //         padding:
    //             const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 0),
    //         child: SingleChildScrollView(
    //           scrollDirection: Axis.vertical,
    //           child: Column(
    //             children: [
    //               TextField(
    //                 onChanged: (value) {
    //                   FilterProduk(value);
    //                 },
    //                 decoration: InputDecoration(
    //                   hintText: 'Cari barang impianmu',
    //                   prefixIcon: Icon(LucideIcons.search),
    //                   iconColor: Colors.black87,
    //                   fillColor: Colors.grey.shade200,
    //                   filled: true,
    //                   border: OutlineInputBorder(
    //                     borderSide: BorderSide.none,
    //                     borderRadius: BorderRadius.circular(8),
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(height: 24),
    //               Container(
    //                 child: display_jumbotron.isEmpty &&
    //                         display_produkPopuler.isEmpty &&
    //                         display_koleksi.isEmpty
    //                     ? Center(
    //                         child: Text('data gaada'),
    //                       )
    //                     : Column(
    //                         children: [
    //                           Container(
    //                             child: test
    //                                 ? Image.asset(
    //                                     'assets/logo/page__en_us_1668678827252_0_1 1.png',
    //                                     fit: BoxFit.cover,
    //                                   )
    //                                 : null,
    //                           ),
    //                           SizedBox(
    //                               height: display_jumbotron.isEmpty &&
    //                                       display_koleksi.isEmpty
    //                                   ? 0
    //                                   : 48),
    //                           Wrap(
    //                             alignment: WrapAlignment.center,
    //                             spacing: 16.0, // Spasi horizontal antara item
    //                             runSpacing: 16.0, // Spasi vertikal antara baris
    //                             children: display_jumbotron.map((e) {
    //                               return container_1(e);
    //                             }).toList(),
    //                           ),
    //                           SizedBox(
    //                               height: display_jumbotron.isEmpty &&
    //                                       display_koleksi.isEmpty
    //                                   ? 0
    //                                   : 48),
    //                           Container(
    //                             child: display_produkPopuler.isEmpty
    //                                 ? Text('')
    //                                 : Row(
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.spaceBetween,
    //                                     children: [
    //                                       Text(
    //                                         'Produk Populer',
    //                                         style: TextStyle(
    //                                           color: primaryText,
    //                                           fontWeight: FontWeight.w600,
    //                                           fontSize: 18,
    //                                         ),
    //                                       ),
    //                                       TextLihatSemua()
    //                                     ],
    //                                   ),
    //                           ),
    //                           SizedBox(height: 16),
    //                           SingleChildScrollView(
    //                             scrollDirection: Axis.horizontal,
    //                             child: Row(
    //                               children: display_produkPopuler.map((e) {
    //                                 return _ProdukPopuler(e);
    //                               }).toList(),
    //                             ),
    //                           ),
    //                           SizedBox(
    //                               height: display_jumbotron.isEmpty ? 0 : 48),
    //                           Container(
    //                             child: display_koleksi.isEmpty
    //                                 ? Text('')
    //                                 : Row(
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.spaceBetween,
    //                                     children: [
    //                                       Text(
    //                                         'Telusuri Koleksi Kami',
    //                                         style: TextStyle(
    //                                           color: primaryText,
    //                                           fontWeight: FontWeight.w600,
    //                                           fontSize: 18,
    //                                         ),
    //                                       ),
    //                                       TextLihatSemua()
    //                                     ],
    //                                   ),
    //                           ),
    //                           SingleChildScrollView(
    //                             scrollDirection: Axis.horizontal,
    //                             child: Row(
    //                               children: display_koleksi.map((e) {
    //                                 return _KoleksiKami(e);
    //                               }).toList(),
    //                             ),
    //                           ),
    //                           // SizedBox(height: 48),
    //                           // _Penawaran(),
    //                         ],
    //                       ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Column _KoleksiKami(KoleksiModel item) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 16, top: 16),
                color: Color(item.KoleksiColor),
                width: 172,
                height: 232,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(item.KoleksiImg),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.KoleksiText,
                            style: TextStyle(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            item.KoleksiSubText,
                            style: TextStyle(
                              color: white.withOpacity(0.9),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Container _ProdukPopuler(ProdukPopulerModel item) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Detail(
                        images: item.ProdukPopulerImg,
                        text: item.ProdukPopulertext,
                        subText: item.ProdukPopulerSubText,
                        harga: item.ProdukPopulerHarga,
                      );
                    },
                  ));
                },
                child: Container(
                  width: 140,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        item.ProdukPopulerImg,
                        width: 146,
                        height: 146,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 12),
                      Text(
                        item.ProdukPopulertext,
                        style: TextStyle(
                          color: primaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        item.ProdukPopulerSubText,
                        style: TextStyle(
                          color: secondText,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(height: 12),
                      Text(
                        NumberFormat.currency(
                                locale: 'id_ID',
                                symbol: 'Rp.',
                                decimalDigits: 0)
                            .format(item.ProdukPopulerHarga)
                            .toString(),
                        style: TextStyle(
                          color: primaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container container_1(JumbotronModel item) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            item.jumbotronImg,
            fit: BoxFit.cover,
            width: 117,
            height: 80,
          ),
          SizedBox(height: 6),
          Text(
            item.jumbotronText,
            style: TextStyle(
              color: primaryText,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Row _Penawaran() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Penawaran Terkini',
          style: TextStyle(
            color: primaryText,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        TextLihatSemua()
      ],
    );
  }
}
