import 'package:flutter/material.dart';

class ChiTietHoaDon  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details',
          style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold) ,
        ),
        backgroundColor: Color(0xFF475269),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search,color: Colors.white),
          )
        ],
      ),

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Row 1
                Row(
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 8.0),
                    Text('Mặt hàng đã chọn'),
                  ],
                ),
                SizedBox(height: 8.0),
                Divider(),
                SizedBox(height: 8.0),
                // Row 2
                Row(
                  children: [
                    // Bên trái - ảnh sản phẩm
                    Expanded(
                      flex: 2,
                      child: Image.network(
                        'https://lh3.googleusercontent.com/6euB1qM538WNYNFPEl1w1sNM00sTlgr0KBRqk_CeOlMFGOqq2yEBqe49HIldpfv8oVypbiwsdoQ6VMUsamiyGr_JibvyKUon85vMJtAxihuOC80xF_6le7hsx3ptiYce1N5pEGDCRNDL9I2X4kZ5AXY',
                        width: 100.0, // Điều chỉnh kích thước ảnh theo mong muốn
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(width: 16.0),

                    // Bên phải - mô tả sản phẩm
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Giày nam - giày Thể Thao Nam Tăng Chiều Cao Siêu Hot 2024 Bền Đẹp.',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Row 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tổng tiền hàng:'),
                        Text('Phí ship:')
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('\$100.00'),
                        Text('\$10.00'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.0),

                // Row 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tổng thanh toán:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$110.00',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.local_offer,
                  color: Colors.blue,
                ),
                SizedBox(width: 8.0),
                Text("Voucher"),
                SizedBox(width: 24.0),

                Container(
                  height: 24.0,
                  width: 1.0,
                  color: Colors.grey,
                ),

                SizedBox(width: 8.0),

                Expanded(
                  child: Text(
                    'Chọn hoặc nhập mã',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {},
      ),
    );
  }
}
