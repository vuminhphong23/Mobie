import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:qly_ban_hang/widghets/components/MyDrawer.dart';

import '../../models/hoadonmodel.dart';
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
      tongTien : "100\$",
      ngayBan : DateTime(2024, 1, 17),
      trangThai : "Paid the bill",
    ),
    HoaDon(
      maHD : "Nike02",
      tongTien : "120\$",
      ngayBan : DateTime(2024, 1, 18),
      trangThai : "Unpaid the bill",
    ),
    HoaDon(
      maHD : "Nike03",
      tongTien : "150\$",
      ngayBan : DateTime(2024, 1, 19),
      trangThai : "Unpaid the bill",
    ),
    HoaDon(
      maHD : "Nike04",
      tongTien : "200\$",
      ngayBan : DateTime(2024, 1, 20),
      trangThai : "Unpaid the bill",
    ),
    HoaDon(
      maHD : "Nike05",
      tongTien : "250\$",
      ngayBan : DateTime(2024, 1, 21),
      trangThai : "Unpaid the bill",
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

  addHoaDon(String maHD, String tongTien, String trangThai) {
    final newHoaDon = HoaDon(
      maHD: maHD,
      tongTien: tongTien,
      ngayBan: DateTime.now(),
      trangThai: trangThai,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
          style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold) ,
        ),
        backgroundColor: Color(0xFF475269),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).openDrawer();
            },
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search,color: Colors.white),
          )
        ],
      ),

      drawer: MyDrawer(),

      body:SingleChildScrollView(
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
                        DateTime currentDate = DateTime.now().add(Duration(days: index));
                        return DropdownMenuItem<String>(
                          value: DateFormat('dd/MM/yyyy').format(currentDate),
                          child: Text(DateFormat('dd/MM/yyyy').format(currentDate)),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total: ${hd.tongTien.toString()}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    '${hd.trangThai}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    DateFormat('dd-MM-yyyy').format(hd.ngayBan),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF475269),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.edit),
                                        iconSize: 20.0,
                                        color: Colors.white,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ChiTietHoaDon(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF475269),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.delete),
                                        iconSize: 20.0,
                                        color: Colors.white,
                                        onPressed: () {
                                          setState(() {
                                            _showDeleteConfirmationDialog(hd);
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

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => formAddHoaDon(context),
      ),
    );
  }
}