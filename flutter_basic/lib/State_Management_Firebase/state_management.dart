//! State Management là gì?
//? Quản lý trạng thái trong Flutter là một vấn đề quan trọng khi bạn muốn tạo ra một ứng dụng 
//? có nhiều màn hình hoặc nhiều dữ liệu cần theo dõi và cập nhật

//? Khi người dùng tương tác với ứng dụng của bạn, trạng thái của ứng dụng thay đổi.
//! Ví dụ:
//   khi người dùng nhấp vào nút "Thêm vào giỏ hàng", số lượng mặt hàng trong giỏ hàng sẽ thay đổi.

//?  Quản lý trạng thái đúng cách là rất cần thiết để xây dựng ứng dụng hiệu quả, dễ bảo trì và dễ mở rộng.

//! Có nhiều cách để quản lý trạng thái trong Flutter, bao gồm:

//?   - Local State Management: 
//      Quản lý trạng thái cục bộ bên trong phạm vi một widget hoặc một nhóm các widget 

//?   - Global State Management: 
//      Quản lý trạng thái có ảnh hưởng đến nhiều phần của ứng dụng hoặc (toàn bộ app).


//! Các phương pháp và công cụ phổ biến cho việc quản lý trạng thái trong Flutter bao gồm:
//?   setState, Provider, Riverpod, Bloc, ... 
//?   Mỗi công cụ có cách tiếp cận riêng và phù hợp với các tình huống sử dụng khác nhau.


//! Inherited Widget làm state management có dc ko?
//? Có thể sử dụng InheritedWidget để cho phép các widget ”chắt” “chít” lấy dữ liệu 
//? nhưng việc này cực kỳ rườm rà và khó quản lý.


//! Bloc
//? Do đó, chúng ta cần phải sử dụng 1 thư viện State management để tách logic code ra, 
//? Từ đó, ta có thể control và sử dụng data từ Widget ”tổ tiên” đến widget ”chắt, chít” một cách dễ dàng

//? Khoá học này chúng ta sẽ sử dụng BLoC 

//? Bloc (Business Logic Component) là một thư viện quản lý trạng thái dựa trên sự kiện,
//? Nó được thiết kế để tách biệt giao diện người dùng (presentation layer) khỏi logic nghiệp vụ (business logic), 
//? giúp ứng dụng dễ bảo trì và kiểm thử hơn.

//? Bloc bao gồm 3 bộ phận chính: event, state, bloc.
//?   - Event: là các sự kiện được gửi từ UI đến Bloc
//?   - Bloc: là nơi nhận sự kiện, sau đó xử lý logic, rồi trả lại state cho UI
//?   - State: là trạng thái đã được Bloc xử lý, được trả về UI

//! Ví dụ: thực hiện Bloc cho phần Login của app xem phim.
//? Phân tích:
//?   - Event thì có 3 event tương ứng 3 tác vụ lớn cần Bloc xử lý: 
//        - login với username password, 
//        - login với third party, 
//        - forgot password
//?   - Bloc sẽ có 3 phần xử lý logic cho 3 event tương ứng.
//?   - State gồm 3 trạng thái: success, failed, loading. 
//?     Và có thêm 2 thông điệp cần hiển thị trong một số tình huống error message, toast successfully message

//! Để sử dụng BLoC, các bạn vào pub.dev và cài thư viện flutter_bloc

