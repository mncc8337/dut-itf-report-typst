#let border-color = blue.darken(40%)

#let cover-border = {
  let gap = 3pt
  let shift = gap
  pad(
    top: 1.5cm,
    bottom: 1.5cm,
    left: 2cm,
    right: 2cm,
    block(
      width: 100%,
      height: 100%,
      stroke: 1pt + black,
      inset: gap,
      {
        block(
          width: 100%,
          height: 100%,
          stroke: 2.5pt + border-color,
        )
      },
    ),
  )
}

#let cover-page(
  university: "ĐẠI HỌC ĐÀ NẴNG",
  faculty: "TRƯỜNG ĐẠI HỌC BÁCH KHOA",
  department: "KHOA CÔNG NGHỆ THÔNG TIN",
  report-title: [TITLE \ ALSO TITLE],
  topic: [real title],
  advisor-label: "GIẢNG VIÊN HƯỚNG DẪN:",
  advisor: "Nguyễn Văn A",
  student-label: "SINH VIÊN THỰC HIỆN:",
  students: (
    (name: "Lê Văn B", column1: "xxx", column2: "yyy"),
    (name: "Trần Thị C", column1: "xxx", column2: "yyy"),
  ),
  column1-label: "NHÓM:",
  column2-label: "LỚP:",
  city: "Đà Nẵng",
  date: datetime.today().display("[month]/[year]"),
  logo: image("faculty-logo.jpg", width: 12%),
) = {
  set par(first-line-indent: 0pt)

  align(center)[
    #text(weight: "bold", size: 14pt)[
      #university \
      #faculty \
      #department
    ]
    #v(-0.4cm)
    #line(length: 40%, stroke: 1.0pt + black)


    #v(0.4cm)
    #if logo != none { logo }

    #v(2.5cm)
    #{
      set par(leading: 1em)
      text(weight: "bold", size: 24pt)[#report-title]
    }

    #v(0.25cm)
    #text(weight: "bold", size: 18pt)[#topic]
  ]

  v(5cm)
  align(center)[
    #text(weight: "bold")[#advisor-label]
    #linebreak()
    #text(weight: "bold")[#advisor]
    #linebreak()
    #text(weight: "bold")[#student-label]
  ]

  v(0.4em)
  let extra-columns = (
    (label: column1-label, key: "column1"),
    (label: column2-label, key: "column2"),
  ).filter(col => col.label != "")

  let normalize(student) = if type(student) == dictionary {
    student
  } else {
    (name: student)
  }

  align(center)[
    #if extra-columns.len() == 0 [
      #for student in students [
        #text(weight: "bold", normalize(student).at("name", default: ""))
        #linebreak()
      ]
    ] else [
      #grid(
        columns: (auto,) * (1 + extra-columns.len()),
        column-gutter: 1.4em,
        row-gutter: 1.6em,
        ..students.map(student => {
          let student = normalize(student)
          (
            align(left)[#text(weight: "bold")[#student.at("name", default: "")]],
            ..extra-columns.map(col => [
              #text(weight: "bold")[#col.label] #student.at(col.key, default: "")
            ]),
          )
        }).flatten(),
      )
    ]
  ]

  v(1fr)
  align(center)[#text(weight: "bold")[#city, #date]]
}
