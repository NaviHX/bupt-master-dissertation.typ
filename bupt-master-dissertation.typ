#import "@preview/tablex:0.0.7": gridx, tablex, hlinex, colspanx
#import "@preview/i-figured:0.2.3"
#import "chinese-cover.typ": chinese-cover
#import "english-cover.typ": english-cover

#let defense-committee(
  roman: "Times New Roman", songti: "Noto Serif CJK SC", heiti: "Noto Sans CJK SC",
  members, defend-date,
) = {
  set text(font: (roman, songti), size: 12pt)
  set page(paper: "a4", margin: (x: 3.17cm, y: 2.54cm))
  show heading: it => align(center, text(font: heiti, size: 16pt, weight: "bold", it))
  heading(outlined: false, numbering: none)[答辩委员会]
  let name-list = members.flatten()

  align(
    center, tablex(
      columns: (15%, 15%, 15%, 50%), header-rows: 1, align: center + horizon, [职务],
      [姓#h(1em)名], [职#h(1em)称], [工#h(1em)作#h(1em)单#h(1em)位], ..name-list,
      [答辩日期], colspanx(3)[#defend-date],
    ),
  )
}

#let declaration(
  roman: "Times New Roman", songti: "Noto Serif CJK SC", heiti: "Noto Sans CJK SC",
) = [
  #set text(font: (roman, songti), size: 12pt)
  #set par(leading: 1em, justify: true, first-line-indent: 2em)
  #show par: set block(below: 1em)
  #set page(paper: "a4", margin: (x: 3.17cm, y: 2.54cm))
  #set text(size: 12pt)
  #set page(header: none)
  #align(center, text(weight: "bold", size: 16pt, font: heiti)[独创性声明])
  本人声明所呈交的论文是本人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢中所罗列的内容以外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得北京邮电大学或其他教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示了谢意。

  申请学位论文与资料若有不实之处，本人承担一切相关责任。

  本人签名：#box(line(length: 9em)) #h(2em) 日期：#box(line(length: 9em))

  #v(3em)

  #align(center, text(weight: "bold", size: 16pt, font: heiti)[关于论文授权使用的说明])
  本人完全了解并同意北京邮电大学有关保留、使用学位论文的规定，即：北京邮电大学拥有以下关于学位论文的无偿使用权，具体包括：学校有权保留并向国家有关部门或机构送交学位论文，有权允许学位论文被查阅和借阅；学校可以公布学位论文的全部或部分内容，有权允许采用影印、缩印或其他复制手段保存、汇编学位论文，将学位论文的全部或部分内容编入有关数据库进行检索。（保密的学位论文在解密后遵守此规定）

  本人签名：#box(line(length: 9em)) #h(2em) 日期：#box(line(length: 9em))

  导师签名：#box(line(length: 9em)) #h(2em) 日期：#box(line(length: 9em))
]

#let bupt-table-figure(chinese-caption, english-caption, t) = {
  figure(
    caption: chinese-caption, supplement: [表], kind: "表", figure(caption: english-caption, supplement: [Table], t),
  )
}

#let bupt-image-figure(chinese-caption, english-caption, img) = {
  figure(
    caption: english-caption, supplement: [Figure], figure(caption: chinese-caption, supplement: [图], kind: "图", img),
  )
}

#let bupt-template(
  roman: "Times New Roman", songti: "Noto Serif CJK SC", heiti: "Noto Sans CJK SC",
  even-page-header: [北京邮电大学硕士学位论文], chinese-abstract, chinese-keywords, english-abstract,
  english-keywords, symbols, bib, appendix,
  acknowledgment, achievement, content,
) = {
  // Preamble
  set text(font: (roman, songti), size: 12pt)
  set par(leading: 1em, justify: true, first-line-indent: 2em)
  show par: set block(below: 1em)
  set math.equation(supplement: "公式", numbering: (..numbers) => {
    locate(loc => {
      let chapter = counter(heading.where(level: 1)).at(loc).at(0)
      numbering("(1-1)", chapter, ..numbers)
    })
  })
  set cite(style: "gb-7714-2015-numeric")

  set page(paper: "a4", margin: (x: 3.17cm, y: 2.54cm))
  set page(
    header-ascent: 41.6%, header: locate(
      loc => {
        let pn = loc.page()
        set text(font: (roman, songti), size: 9pt)
        if calc.even(pn) {
          align(center)[
            #even-page-header
            #line(length: 100%)
          ]
        } else {
          let chapter-before = query(selector(heading.where(level: 1)).before(loc), loc)
          let chapter-after = query(selector(heading.where(level: 1)).after(loc), loc)
          let chapter = if chapter-after.len() > 0 and chapter-after.first().location().page() == pn {
            chapter-after.first().body
          } else if chapter-before.len() > 0 {
            chapter-before.last().body
          } else [
            even-page-header
          ]
          align(center)[
            #chapter
            #line(length: 100%)
          ]
        }
      },
    ),
  )

  show heading.where(level: 1): it => {
    align(center, text(size: 16pt, it))
  }
  show heading.where(level: 2): it => {
    text(size: 14pt, it)
  }
  show heading: it => {
    set text(font: (roman, heiti))
    text(size: 12pt, it)
    par()[#text(size: 5pt)[#h(0em)]]
  }
  show heading: i-figured.reset-counters
  set heading(numbering: (..numbers) => {
    if numbers.pos().len() == 1 {
      numbering("第一章", ..numbers.pos().slice(0, 1))
    } else {
      numbers.pos().map(str).join(".")
    }
  })

  set figure.caption(separator: " ")
  show figure.caption: set text(size: 10.5pt)
  show figure: i-figured.show-figure.with(numbering: "1-1")
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: "表"): set figure.caption(position: top)
  show figure.where(kind: image): set figure.caption(position: bottom)
  show figure.where(kind: "图"): set figure.caption(position: bottom)

  set page(numbering: "I")
  counter(page).update(1)
  show heading.where(level: 1): it => {
    pagebreak()
    it
  }

  // Abstract
  [
    #set text(size: 14pt)
    #set heading(numbering: none)
    #show heading: set text(15pt)

    = 摘要
    #v(1em)

    #chinese-abstract

    #text(font: heiti, weight: "bold")[关键词：]
    #chinese-keywords.join([；])

    = ABSTRACT
    #v(2em)

    #english-abstract

    #text(font: roman, weight: "bold")[KEY WORDS:]
    #english-keywords.join("; ")
  ]

  // ToC
  heading(numbering: none, outlined: false)[目录]
  {
    set par(first-line-indent: 0em)
    set outline(title: none)
    outline(title: none, indent: 2em)
  }

  // Symbols
  heading(numbering: none, outlined: false)[符号说明]

  let symbols = symbols.flatten()
  let symbol-table-content = (hlinex(), [符号], [代表意义], [单位], ..symbols, hlinex())
  align(
    center, gridx(
      columns: (30%, 30%, 30%), align: center + horizon, header-rows: 1, ..symbol-table-content,
    ),
  )

  // Content
  set page(numbering: "1")
  counter(page).update(1)
  content

  set heading(numbering: none)

  // References
  if bib != none {
    set text(size: 10.5pt)
    bibliography(bib, title: [参考文献], full: true, style: "gb-7714-2015-numeric")
  }

  // Appendix
  if appendix != none [
    = 附 #h(1em) 录

    #appendix
  ]

  // Achknowledgment
  if acknowledgment != none [
    = 致 #h(1em) 谢

    #acknowledgment
  ]

  // Achievement
  if achievement != none [
    #show par: set block(below: 2em)
    = 攻读学位期间取得的“创新成果”目录

    #achievement
  ]
}
