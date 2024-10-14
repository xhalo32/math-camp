// This is a Typst document which creates a customizable treasure hunt map. See README.md for instructions on how to compile using Typst etc.

// Import the CeTZ drawing utilities
#import "@preview/cetz:0.2.2"

// Import a library for manipulating bitmaps
#import "@preview/grayness:0.1.0": *

// Set up custom colors. See also <https://typst.app/docs/reference/visualize/color/>
#let darkgreen = green.darken(50%)
#let lavender = purple.lighten(50%)
#let brown = orange.darken(50%)
#let violet = purple.darken(25%)

// A small circle filled with `color` and a black outline
#let circle(color) = {box(
  cetz.canvas({
    import cetz.draw: *

    circle((0, 0), radius: 0.2, fill: color)
  })
)
}

// Headings use Fira Sans font
#show heading: set text(font: "Fira Sans")

// Use `image.png` as the background image of the page. Notice that the image is moved up by 8.2em to match the grid. Adjust if needed.
#let data = read("image.png", encoding: none)
#page(margin: 1.5cm, background: move(dy: -8.2em, crop-image(data, 1080, 1080, width: 82%, height: 58%)))[

// Font size (also affects the map grid)
#set text(size: 16pt)

#align(center)[
= Math Camp Adventure Map
]

// The grid and points. Moved left 2pt to match the image. Adjust if needed.
#move(dx: -2pt, align(center, cetz.canvas({
  import cetz.draw: *

  // Gride size
  let size = 17
  
  grid((0, 0), (size, size))

  // Tickmarks
  for i in range(size + 1) {
    content((i, -0.5), box(fill: white, inset: 1pt, [#i]))
    content((-0.5, i), box(fill: white, inset: 1pt, [#i]))
  }

  // Axis labels
  content((0.3, size + 0.5), $y$)
  content((size + 0.5, 0.3), $x$)

  // Axis arrows
  set-style(mark: (end: "straight"))
  line((0, size), (0, size+0.5))
  line((size, 0), (size+0.5, 0))

  // Real points
  circle((5.5, 3), radius: 0.2, fill: lavender)
  circle((8, 6.5), radius: 0.2, fill: orange)
  circle((9.5, 8.1), radius: 0.2, fill: blue)
  circle((6, 6), radius: 0.2, fill: red)
  circle((5, 8), radius: 0.2, fill: yellow)
  circle((9.5, 6.5), radius: 0.2, fill: brown)
  circle((7.5, 9.2), radius: 0.2, fill: violet)
  
  // Fake points
  circle((11.5, 6.5), radius: 0.2, fill: green)
  circle((12, 3.4), radius: 0.2, fill: aqua)
  circle((7, 0.5), radius: 0.2, fill: white)
  circle((3.5, 3.7), radius: 0.2, fill: darkgreen)
})))

#align(center)[

// Grid with groups of (title, checkpoints). Enable stroke to debug how the grid works.
// Reference: <https://typst.app/docs/reference/layout/grid/>
#grid(columns: (auto,auto,auto), gutter: 2em, /* stroke: 1pt+gray */)[
=== First floor

#circle(yellow) $sigma$ #h(0.5em)
#circle(violet) $nabla$ #h(0.5em)
#circle(orange) $Gamma$

][

=== Second floor

#circle(red) $A$ #h(0.5em)
#circle(blue) $M$

][
=== Outdoors

#circle(brown) $C$ #h(0.5em)
#circle(green) $epsilon$ #h(0.5em)
#circle(darkgreen) $pi$ #h(0.5em)
#circle(lavender) $xi$ #h(0.5em)
#circle(aqua) $theta.alt$ #h(0.5em)
#circle(white) $eta$
]
]

#align(center)[
=== Mark the checkpoints you have visited

// Checkpoint boxes from 1 to 8
#table(columns: (1.5em,)*4,
  stroke: 0pt,
  ..range(1, 8).map(n => (align(right)[#n.],table.cell(stroke: 1pt)[])).flatten()
)
]
]

// Next page

#set text(size: 16pt)

== Checkpoints

+ #circle(lavender) $(5.5, 3)$ (outdoors) Aleksis: food-themed system of equations
+ #circle(orange) $(8, 6.5)$ (1st floor) David's exercise
+ #circle(blue) $(9.5, 8.1)$ (2nd floor) Niklas: Equal sets
+ #circle(red) $(6, 6)$ (2nd floor) Akseli: circumference exercise
+ #circle(yellow) $(5, 8)$ (1st floor) Akseli: sum exercise
+ #circle(brown) $(9.5, 6.5)$ (outdoors) Emilia's exercise
+ #circle(violet) $(7.5, 9.2)$ (1st floor) Emilia's other exercise

Fake points: #circle(green) $epsilon$, #circle(darkgreen) $pi$, #circle(white) $eta$, #circle(aqua) $theta.alt$