//! CustomScrollView
//? CustomScrollView trong Flutter là một widget cho phép bạn
//? tạo các bố cục cuộn phức tạp hơn so với các widget cuộn tiêu chuẩn như ListView hoặc GridView.
//? Nó cho phép bạn kết hợp nhiều loại sliver bao gồm:
//?   - các danh sách, lưới, và các phần tử tùy chỉnh khác trong một cây cuộn duy nhất.

//! Các khái niệm cơ bản
//?   - Sliver:
//        Là một khái niệm trong Flutter dùng để mô tả các phần tử có thể cuộn.
//        Mỗi sliver có thể thay đổi kích thước và vị trí trong khi cuộn.

//?   - CustomScrollView:
//        Là widget cho phép bạn chỉ định các sliver khác nhau (như SliverList, SliverGrid, và SliverAppBar)
//        trong cùng một widget cuộn.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyCustomScrollView()));
}

class MyCustomScrollView extends StatelessWidget {
  const MyCustomScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //! slivers
        //? Đây là tham số quan trọng nhất của CustomScrollView.
        //? Nó nhận một danh sách các widget sliver,
        //? cho phép bạn kết hợp nhiều loại sliver khác nhau (như SliverList, SliverGrid, SliverAppBar, v.v.) trong cùng một cây cuộn.
        slivers: <Widget>[
          //! SliverAppBar
          //? Là một app bar có thể cuộn và có khả năng mở rộng.
          //? Nó có thể có một tiêu đề, một không gian linh hoạt,
          //? và có thể hiển thị hình ảnh hoặc bất kỳ nội dung nào khác khi cuộn.
          SliverAppBar(
            // title: const Text('Custom Scroll View'),
            //? expandedHeight:
            //  Chiều cao tối đa của app bar khi nó được mở rộng.
            expandedHeight: 150.0,
            //? flexibleSpace
            //  Widget con có thể được sử dụng để tạo nội dung trong không gian mở rộng của app bar.
            //  Thường sử dụng FlexibleSpaceBar để thêm hình ảnh hoặc các widget khác.
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Custom Scroll View'),
              background: Image.network(
                  'https://images.ctfassets.net/23aumh6u8s0i/4TsG2mTRrLFhlQ9G1m19sC/4c9f98d56165a0bdd71cbe7b9c2e2484/flutter',
                  fit: BoxFit.cover),
            ),
            //? pinned
            //  Nếu đặt là true, app bar sẽ được giữ cố định ở đầu màn hình khi cuộn xuống.
            //  Nếu là false, app bar sẽ biến mất khi cuộn.
            pinned: true,
            //? floating
            //  Nếu đặt là true, app bar sẽ hiển thị lại khi người dùng cuộn lên,
            //  ngay cả khi app bar đã cuộn ra ngoài màn hình. Điều này tạo ra một hiệu ứng "nổi" cho app bar.
            floating: false,
          ),
          //! SliverList
          //? Là một danh sách các phần tử có thể cuộn, tương tự như ListView và ListView.builder().
          //? Nó cho phép bạn tạo một danh sách dài các widget mà có thể cuộn.
          SliverList(
            //? delegate
            // Nó nhận một đối tượng SliverChildDelegate, xác định cách các phần tử con trong danh sách được tạo ra và quản lý.
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                print("ListTile #$index build");
                return ListTile(title: Text('Item $index'));
              },
              childCount: 50,
            ),
          ),
          //! SliverGrid
          //? Là một lưới các phần tử có thể cuộn. Nó tương tự như GridView nhưng được sử dụng trong CustomScrollView.
          SliverGrid(
            //! gridDelegate
            //? Xác định cách các phần tử trong lưới được sắp xếp và bố trí.
            //? Bạn có thể sử dụng các delegate khác nhau, chẳng hạn như:
            //?   - SliverGridDelegateWithFixedCrossAxisCount để định nghĩa số cột cố định
            //?   - hoặc SliverGridDelegateWithMaxCrossAxisExtent để đặt chiều rộng tối đa cho mỗi phần tử.
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            //! delegate
            //? Xác định cách các phần tử con trong lưới được tạo ra và quản lý.
            //? Tham số này nhận một đối tượng SliverChildDelegate,
            //? cho phép bạn sử dụng SliverChildBuilderDelegate để tạo phần tử con một cách động
            //? hoặc SliverChildListDelegate để cung cấp một danh sách tĩnh.
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                print("Grid Item #$index build");
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Center(child: Text('Grid Item $index')),
                );
              },
              childCount: 30,
            ),
          ),
          //! SliverToBoxAdapter
          //? Cho phép bạn chèn một widget không phải sliver vào CustomScrollView
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.orange,
              child: const Center(child: Text('Non-Sliver Widget')),
            ),
          ),
        ],
      ),
    );
  }
}
