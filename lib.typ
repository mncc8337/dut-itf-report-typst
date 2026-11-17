#import "cover.typ": cover-border, cover-page

#let front-heading(title) = align(
  center,
  text(size: 14pt, heading(level: 1, numbering: none, title)),
)

#let frontmatter(
  body,
  title: "Đồ án Cơ sở lập trình",
  header-title: [Đồ án Cơ sở lập trình],
  font: "Liberation Serif",
  font-size: 13pt,
  margin: (left: 2.5cm, right: 2.5cm, top: 2.8cm, bottom: 2.5cm),
  cover-margin: (left: 2.5cm, right: 2.5cm, top: 2.5cm, bottom: 2.5cm),
  ..cover-options,
) = {
  set document(title: title)
  set text(font: font, size: font-size)
  set par(justify: true, leading: 1.3em, first-line-indent: (amount: 1.2cm, all: true))

  set heading(numbering: "1.1.1.")
  show heading: it => block(
    above: if it.level == 1 { 2em } else if it.level == 2 { 1.2em } else { 0.9em },
    below: if it.level == 1 { 1em } else if it.level == 2 { 0.55em } else { 0.35em },
    text(
      weight: "bold",
      style: if it.level == 3 { "italic" } else { "normal" },
    )[
      #if it.numbering != none {
        numbering(it.numbering, ..counter(heading).get())
        h(if it.level == 1 { 1em } else if it.level == 2 { 0.8em } else { 0.6em })
      }
      #it.body
    ],
  )

  show figure.where(kind: image): set figure(supplement: "Hình", numbering: "1")
  show figure.where(kind: table): set figure(supplement: "Bảng", numbering: "1")

  // cover: decorated border, no header, no footer
  set page(
    paper: "a4",
    margin: cover-margin,
    background: cover-border,
    header: none,
    footer: none,
  )
  cover-page(..cover-options)

  // front matter: border removed, running header, lowercase Roman pages
  pagebreak()
  set page(
    margin: margin,
    background: none,
    header-ascent: 0.65cm,
    header: context {
      set par(first-line-indent: 0pt)
      text(size: font-size, header-title)
      v(-9pt)
      line(length: 100%, stroke: 2.5pt + black)
    },
    footer: context {
      set par(first-line-indent: 0pt)
      align(right, numbering("i", counter(page).get().first()))
    },
    numbering: "i",
  )
  counter(page).update(1)

  body
}

// add a standalone page with only a big title and paragraphs
// no border or header/footer
#let standalone-page(
  body,
  title: "LỜI MỞ ĐẦU",
) = {
  set page(header: none, footer: none)
  front-heading(title)
  body
  pagebreak()
}


// add
// #show: start-mainmatter
// before writting main matter
#let start-mainmatter(body) = {
  set page(
    footer: context {
      set par(first-line-indent: 0pt)
      align(right, numbering("1", counter(page).get().first()))
    },
    numbering: "1",
  )
  counter(page).update(1)
  body
}
