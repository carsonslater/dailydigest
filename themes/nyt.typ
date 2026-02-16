#let horizontalrule = v(0.5em) + line(length: 100%, stroke: 0.5pt) + v(0.5em)

#let template(
  title: "THE DAILY DIGEST",
  subtitle: none,
  authors: (),
  date: none,
  body,
) = {
  // Set the document's metadata.
  set document(title: title, author: authors)

  // Configure the page.
  set page(
    paper: "us-letter",
    margin: (x: 1.5cm, y: 1.5cm),
    header: locate(loc => {
      if loc.page() > 1 {
        set text(font: "Georgia", size: 8pt)
        grid(
          columns: (1fr, 1fr),
          [#title],
          align(right)[#date --- Page #counter(page).display()]
        )
        v(0.2cm)
        line(length: 100%, stroke: 0.5pt)
      }
    })
  )

  // Title section for the first page
  align(center)[
    #v(0.2cm)
    #block(text(font: "Iowan Old Style", weight: "black", size: 48pt, tracking: 1pt)[#title])
    #v(-0.6cm)
    #line(length: 100%, stroke: 0.8pt)
    #v(-0.4cm)
    #grid(
      columns: (1fr, 1fr, 1fr),
      align(left)[#text(font: "Georgia", weight: "bold", size: 10pt)[#date]],
      align(center)[#text(font: "Georgia", style: "italic", size: 10pt)[#subtitle]],
      align(right)[#text(font: "Georgia", weight: "bold", size: 10pt)[ESTABLISHED 2026]]
    )
    #v(-0.4cm)
    #line(length: 100%, stroke: 2.5pt)
    #v(1.0cm)
  ]

  // Body configuration
  set text(font: "Georgia", size: 10.5pt, leading: 0.65em)
  set par(justify: true, first-line-indent: 1.5em)

  // Headlines
  show heading.where(level: 1): it => {
    set text(font: "Times New Roman", weight: "bold", size: 22pt)
    set par(first-line-indent: 0pt)
    block(it.body)
    v(0.3cm)
  }
  
  show heading.where(level: 2): it => {
    set text(font: "Times New Roman", weight: "bold", size: 14pt)
    set par(first-line-indent: 0pt)
    block(it.body)
    v(0.2cm)
  }

  // Handle images to be responsive
  show image: it => {
    block(it, width: 100%)
  }

  // Multi-column for the body
  columns(2, gutter: 20pt)[
    #body
  ]
}

#show: template.with(
  title: [$title$],
  subtitle: [$if(subtitle)$$subtitle$$endif$],
  date: [$if(date)$$date$$endif$],
)

$body$
