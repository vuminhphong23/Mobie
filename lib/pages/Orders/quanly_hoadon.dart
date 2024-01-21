import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:intl/intl.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:qly_ban_hang/localization/locales.dart';
import 'package:qly_ban_hang/models/Interfaces.dart';
import 'package:qly_ban_hang/widghets/components/MyDrawer.dart';

import '../../models/hoadonmodel.dart';
import '../../widghets/widgets_home/HomeBottomNavBar.dart';
import '../../widghets/widgets_order/formnhap_hoadon.dart';
import 'chitiet_hoadon.dart';


class QuanLyHoaDon extends StatefulWidget {
  @override
  State<QuanLyHoaDon> createState() => _QuanLyHoaDonState();
}

class _QuanLyHoaDonState extends State<QuanLyHoaDon> {
  final List<HoaDon> danhSachHoaDon = [
    HoaDon(
      maHD : "Nike01",
      tongTien : "\$100",
      ngayBan : DateTime(2024, 1, 17),
      name : "Shoe Maker",
    ),
    HoaDon(
      maHD : "Nike02",
      tongTien : "\$120",
      ngayBan : DateTime(2024, 1, 18),
      name : "Shoe Maker",
    ),
    HoaDon(
      maHD : "Nike03",
      tongTien : "\$150",
      ngayBan : DateTime(2024, 1, 19),
      name : "Shoe Maker",
    ),
    HoaDon(
      maHD : "Nike04",
      tongTien : "\$200",
      ngayBan : DateTime(2024, 1, 20),
      name : "Shoe Maker",
    ),
    HoaDon(
      maHD : "Nike05",
      tongTien : "\$250",
      ngayBan : DateTime(2024, 1, 21),
      name : "Shoe Maker",
    ),
  ];
  String selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  void _showDeleteConfirmationDialog(HoaDon hd) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this invoice?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteHoaDon(hd);
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _deleteHoaDon(HoaDon hd) {
    setState(() {
      danhSachHoaDon.remove(hd);
    });
    Fluttertoast.showToast(msg: 'Invoice deleted ${hd.maHD}');
  }

  addHoaDon(String maHD, String tongTien, String name) {
    final newHoaDon = HoaDon(
      maHD: maHD,
      tongTien: tongTien,
      ngayBan: DateTime.now(),
      name: name,
    );

    setState(() {
      danhSachHoaDon.add(newHoaDon);
    });
  }

  formAddHoaDon(BuildContext contex) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: FormNhapHoaDon(addHoaDon),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  late List<HoaDon> _originalHoaDonList;
  @override
  void initState() {
    super.initState();
    _originalHoaDonList = List.from(danhSachHoaDon);
  }

  void searchHoaDon(String query) {
    setState(() {
      danhSachHoaDon.clear();
      danhSachHoaDon.addAll(_originalHoaDonList.where((hd) =>
          hd.maHD.toLowerCase().contains(query.toLowerCase())));
      if (danhSachHoaDon.isEmpty) {
        isSearching = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
        builder: (context, ui, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                LocaleData.orders.getString(context),
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Color(0xFF475269),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (isSearching) {
                        isSearching = false;
                        danhSachHoaDon.clear();
                        danhSachHoaDon.addAll(_originalHoaDonList);
                      } else {
                        isSearching = true;
                      }
                    });
                  },
                  icon: Icon(Icons.search, color: Colors.white),
                ),
                if (isSearching)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200.0,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Tìm kiếm theo maHD',
                        ),
                        onChanged: (value) {
                          searchHoaDon(value);
                        },
                        onSubmitted: (value) {},
                      ),
                    ),
                  ),
              ],
            ),

            drawer: MyDrawer(),

            body: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Date: $selectedDate',
                            style: TextStyle(fontSize: 18),
                          ),
                          DropdownButton<String>(
                            value: selectedDate,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedDate = newValue!;
                              });
                            },
                            items: List.generate(7, (index) {
                              DateTime currentDate = DateTime.now().add(
                                  Duration(days: index));
                              return DropdownMenuItem<String>(
                                value: DateFormat('dd/MM/yyyy').format(
                                    currentDate),
                                child: Text(DateFormat('dd/MM/yyyy').format(
                                    currentDate)),
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: danhSachHoaDon.map((hd) {
                      return Card(
                        color: Color(0xFFF5F9FD),
                        elevation: 5,
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFF475269),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                  hd.maHD,
                                  style: const TextStyle (
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF475269),
                                  )
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          'Total: ${hd.tongTien.toString()}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Text(
                                          '${hd.name}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Text(
                                          DateFormat('dd-MM-yyyy').format(
                                              hd.ngayBan),
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .end,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFF475269),
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                            ),
                                            child: IconButton(
                                              icon: Icon(Icons.edit),
                                              iconSize: 20.0,
                                              color: Colors.white,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChiTietHoaDon(
                                                          maHD: hd.maHD,
                                                          tongTien: hd.tongTien,
                                                          ngayBan: hd.ngayBan,
                                                          name: hd.name,
                                                        ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFF475269),
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                            ),
                                            child: IconButton(
                                              icon: Icon(Icons.delete),
                                              iconSize: 20.0,
                                              color: Colors.white,
                                              onPressed: () {
                                                setState(() {
                                                  _showDeleteConfirmationDialog(
                                                      hd);
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 10,),

                  Container(
                    child: Text(
                      LocaleData.totals.getString(context) + ': ${danhSachHoaDon.length}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: (16.0)),
                    ),
                  )
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation
                .centerFloat,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => formAddHoaDon(context),
            ),
            bottomNavigationBar: HomeBottomNavBar(),
          );
        }
    );
  }
}