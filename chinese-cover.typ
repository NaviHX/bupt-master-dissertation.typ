#import "@preview/tablex:0.0.7": gridx, hlinex
#let chinese-cover(
  roman: "Times New Roman", songti: "Noto Serif CJK SC", heiti: "Noto CJKSans SC",
  secret: [公开], title: [硕/博士学位论文（学术学位）], method: [全日制], dissertation-title,
  student-id, name, major, supervisor,
  institute, date,
) = {
  set page(paper: "a4", margin: (x: 3.17cm, y: 2.54cm))
  align(right, text(font: songti, weight: "bold", size: 14pt)[密级：#secret])
  align(center, image("./image/name.png", width: 80%))
  align(center, text(font: heiti, weight: "bold", size: 32pt, title))
  align(center, image("./image/logo.png", width: 20%))
  v(1em)

  set underline(evade: false, offset: 8pt, stroke: 1.5pt)
  set par(justify: true)
  set text(font: (roman, songti), weight: "bold")
  {
    set text(size: 18pt)
    align(center, grid(columns: (20%, 70%), [题目：], [
      #underline(dissertation-title)
    ]))
  }

  {
    set text(size: 14pt)
    gridx(
      columns: (6.05em, 25%, 30%), row-gutter: 1em, [], [学#h(2em)号：],
      [#student-id], hlinex(start: 2, gutter-restrict: top), [], [姓#h(2em)名：],
      [#name], hlinex(start: 2, gutter-restrict: top), [], [学科专业：],
      [#major], hlinex(start: 2, gutter-restrict: top), [], [培养方式：],
      [#method], hlinex(start: 2, gutter-restrict: top), [], [导#h(2em)师：],
      [#supervisor], hlinex(start: 2, gutter-restrict: top), [], [学#h(2em)院：],
      [#institute], hlinex(start: 2, gutter-restrict: top),
    )
  }

  v(1em)
  align(
    center + bottom, text(size: 14pt, date.display("[year] 年 [month] 月 [day] 日")),
  )
}
