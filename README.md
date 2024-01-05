= BUPT-Master-Dissertation.typ

== How to use

```typst
// main.typ

#import "bupt-master-dissertation.typ": template

#show: rest => bupt-template(
  // 中文摘要
  [
    ...
  ], ([关键词1], [关键词2], [关键词3], [关键词4], [关键词5]),
  // 英文摘要
  [
    ...
  ], ([Keyword1], [Keyword2], [Keyword3], [Keyword4], [Keyword5]),
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
