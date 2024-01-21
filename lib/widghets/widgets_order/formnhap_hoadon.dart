import "package:flutter/material.dart";

class FormNhapHoaDon extends StatelessWidget {
  final Function addHoaDon;
  final maHDController = TextEditingController();
  final tongTienController = TextEditingController();
  final trangThaiController = TextEditingController();

  FormNhapHoaDon(this.addHoaDon);

  submitData() {
    final enterMaController = maHDController.text;
    final enterTongTienController = tongTienController.text;
    final enterTrangThaiController = trangThaiController.text;

    if ((enterMaController.isNotEmpty) &&
        (enterTongTienController.length > 3) &&
        (enterTongTienController.isNotEmpty))
      addHoaDon(
        enterMaController,
        enterTongTienController,
        enterTrangThaiController,
      );
    else
      return;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Mã Hóa Đơn'),
              controller: maHDController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Tổng tiền'),
              controller: tongTienController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Trạng thái'),
              controller: trangThaiController,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              child: Text('Thêm hóa đơn'),
              onPressed: (){
                submitData();
              },
            )
          ],
        ),
      ),
    );
  }
}

