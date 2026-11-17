#import "lib.typ": (
  frontmatter,
  standalone-page,
  front-heading,
  start-mainmatter,
)

// frontmatter configs
#show: frontmatter.with(
  university: "ĐẠI HỌC ĐÀ NẴNG",
  faculty: "TRƯỜNG ĐẠI HỌC BÁCH KHOA",
  department: "KHOA CÔNG NGHỆ THÔNG TIN",
  title: "document title",
  header-title: "header title",
  report-title: [FRONTMATTER TITLE \ YES],
  topic: "frontmatter topic",
  advisor-label: "GIẢNG VIÊN HƯỚNG DẪN:",
  advisor: "Nguyễn Văn A",
  student-label: "SINH VIÊN THỰC HIỆN:",
  students: (
    (name: "Lê Văn B", column1: "xxx", column2: "yyy"),
    (name: "Trần Thị C", column1: "xxx", column2: "yyy"),
  ),
  column1-label: "LỚP:", // set to "" to hide this column
  column2-label: "NHÓM:", // set to "" to hide this column
  city: "Đà Nẵng",
  date: datetime.today().display("[month]/[year]"),
  logo: image("faculty-logo.jpg", width: 12%),
)

// add some more pages like this if you needed
#standalone-page(title: "LỜI MỞ ĐẦU")[
  #lorem(300)
]

// auto generated pages
// start of do not touch section
#front-heading[MỤC LỤC]
#outline(title: none, indent: 1.5em, depth: 3)

#pagebreak()

#front-heading[DANH MỤC HÌNH VẼ]
#outline(title: none, target: figure.where(kind: image))

#pagebreak()

#front-heading[DANH MỤC BẢNG BIỂU]
#outline(title: none, target: figure.where(kind: table))

#pagebreak()
// end of do not touch section

#show: start-mainmatter

// main content goes here
= GIỚI THIỆU TỔNG QUAN ĐỀ TÀI
#lorem(120)

= CƠ SỞ LÝ THUYẾT
== Ý tưởng
#lorem(120)

== Cơ sở lý thuyết
#lorem(120)

= TỔ CHỨC CẤU TRÚC DỮ LIỆU VÀ THUẬT TOÁN
== Phát biểu bài toán
#lorem(120)

== Cấu trúc tổ chức dữ liệu đầu vào
#lorem(120)

#figure(
  table(
    columns: (1fr, 1fr),
    [Trường], [Kiểu dữ liệu],
    [Mã sinh viên], [Chuỗi],
    [Họ tên], [Chuỗi],
  ),
  caption: [Cấu trúc dữ liệu đầu vào],
)

== Thuật toán xử lý
#lorem(120)

= CÀI ĐẶT VÀ TRIỂN KHAI
== Ngôn ngữ cài đặt
#lorem(120)

== Tổ chức chương trình
#lorem(120)

== Kết quả Demo
=== Giao diện chương trình
#lorem(120)

#figure(
  rect(width: 70%, height: 4cm, fill: luma(235), stroke: 0.5pt + luma(150)),
  caption: [placeholder],
)

=== Nhận xét
#lorem(120)

= Kết luận và hướng phát triển
#lorem(120)

#pagebreak()

#front-heading[TÀI LIỆU THAM KHẢO]
#block[
  #set par(first-line-indent: 0pt)
  #set enum(numbering: "[1]")

  + Tài liệu tham khảo a
  + Tài liệu tham khảo b
  + Tài liệu tham khảo c
]
