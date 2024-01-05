#import "@preview/tablex:0.0.7": gridx, hlinex
#let english-cover(
  roman: "Times New Roman", songti: "Noto Serif CJK SC", heiti: "Noto CJKSans SC",
  secret: [公开], title: [Master/Doctoral Disstertation], dissertation-title, student-id,
  name, major, supervisor, institute,
  date,
) = {
  set page(paper: "a4", margin: (x: 3.17cm, y: 2.54cm))
  align(
    center, grid(
      columns: (25%, 75%), align(center, image("./image/logo.png")), align(center + horizon, text(
        font: heiti, weight: "bold", size: 26pt,
      )[BEIJING UNIVERSITY OF\ POSTS AND\ TELECOMMUNICATIONS]),
    ),
  )

  {
    v(2em)
    set text(size: 26pt)
    align(center, text(size: 24pt, font: roman, title))
    v(1em)
  }

  set underline(evade: false, offset: 8pt, stroke: 1.5pt)
  set par(justify: true)
  set text(font: (roman, songti), weight: "bold")
  {
    set text(size: 18pt)
    align(center, underline(dissertation-title))
    set text(size: 26pt)
    v(3em)
  }

  {
    set text(size: 14pt)
    gridx(
      columns: (6.05em, 25%, 30%), row-gutter: 1em, map-cells: cell => {
        if cell.x == 1 {
          cell.content = align(right, cell.content)
        }

        cell
      }, [],
      [Student ID:], [#student-id], hlinex(start: 2, gutter-restrict: top), [],
      [Author:], [#name], hlinex(start: 2, gutter-restrict: top), [],
      [Subject:], [#major], hlinex(start: 2, gutter-restrict: top), [],
      [Supervisor:], [#supervisor], hlinex(start: 2, gutter-restrict: top), [],
      [Institute:], [#institute], hlinex(start: 2, gutter-restrict: top),
    )
  }

  v(1em)
  align(
    center + bottom, text(size: 14pt, date.display("[day]/[month]/[year]")),
  )
}
