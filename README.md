# BUPT-Master-Dissertation.typ

## How to use

```typst
// main.typ

#import "bupt-master-dissertation.typ": bupt-template

#show: rest => bupt-template(
  // 中文摘要 (abstraction, ..keywords)
  ([
    ...
  ], [关键词1], [关键词2], [关键词3], [关键词4], [关键词5]),
  // 英文摘要 (abstraction, ..keywords)
  ([
    ...
  ], [Keyword1], [Keyword2], [Keyword3], [Keyword4], [Keyword5]),
  // 符号说明
  (([$A$], [截面积], [$m^2$]), ([$F$], [力], [$N$]), ([$e$], [电子电荷], [$V$]),),
  // 参考文献
  "ref.bib",
  // 附录
  none,
  // 致谢
  [
    ...
  ],
  // 创新成果
  none,
  // 正文
  rest,
)

= 绪论

...
```

详细请见 Reference 与 `sample.typ`

## Reference

### `bupt-template`

```typst
#let bupt-template(
  roman: "Times New Roman", songti: "Noto Serif CJK SC", heiti: "Noto Sans CJK SC",
  even-page-header: [北京邮电大学硕士学位论文], chinese-abstract, chinese-keywords, english-abstract,
  english-keywords, symbols, bib, appendix,
  acknowledgment, achievement, content,
) = { ... }
```

### `defense-committee`

生成答辩委员会表。在 `bupt-template` 之前使用。

```typst
#let defense-committee(
  roman: "Times New Roman", songti: "Noto Serif CJK SC", heiti: "Noto Sans CJK SC",
  members, defend-date,
) = { ... }
```

每一个委员由 `(职务, 姓名, 职称, 工作单位)` 描述

### `declaration`

生成独创性声明与授权声明。在 `bupt-template` 之前使用。

```typst
#let declaration(
  roman: "Times New Roman", songti: "Noto Serif CJK SC", heiti: "Noto Sans CJK SC",
) = [ ... ]

```

### Cover

```typst
#let chinese-cover(
  roman: "Times New Roman", songti: "Noto Serif CJK SC", heiti: "Noto CJKSans SC",
  secret: [公开],
  title: [硕/博士学位论文（学术学位）],
  method: [全日制],
  dissertation-title,
  student-id,
  name,
  major,
  supervisor,
  institute,
  date, // datetime type
) = { ... }
```

```typst
#let english-cover(
  roman: "Times New Roman", songti: "Noto Serif CJK SC", heiti: "Noto CJKSans SC",
  secret: [公开],
  title: [Master/Doctoral Disstertation],
  dissertation-title,
  student-id,
  name,
  major,
  supervisor,
  institute,
  date,
) = { ... }
```
