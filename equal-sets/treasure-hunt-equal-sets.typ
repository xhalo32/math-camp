#import "@preview/cetz:0.2.2"

#show page: it => align(center, it)

#[
  #set text(size: 36pt)
  = 3. Set puzzle
]

Use lines to connect those sets which have *exactly the same* elements. The line intersections indicate the coordinates of the next checkpoint.

#v(2em)
#set text(size: 16pt)

#cetz.canvas({
  import cetz.draw: *
  import calc: *
  // Your drawing code goes here
  import cetz.plot

  let ngon = 10

  let points = range(ngon).map(n => (n, (8 + 7 * cos(n/ngon * 2 * pi), 8 + 7 * sin(n/ngon * 2 * pi))))

  for (i, coord) in points {
    circle(name: "point" + str(i), coord, radius: 0.1, fill: black)
  }

  content("point0", move(dx: 15pt, $NN$))
  content("point1", move(dy: -15pt, $ZZ$))
  content("point2", move(dy: -15pt, ${n in NN | n < 4}$))
  content("point3", move(dy: -15pt, $NN without {0}$))
  content("point4", move(dx: -40pt, $NN without ZZ$))
  content("point5", move(dy: 15pt, ${n in NN | n <= 4}$))
  content("point6", move(dx: -40pt, ${0, 1, 2, 3}$))
  content("point7", move(dx: -40pt, $NN sect ZZ$))
  content("point8", move(dx: 15pt, $ emptyset $))
  content("point9", move(dx: 40pt, ${1, 2, 3, 4}$))

  // line("point0", "point7")
  // line("point4", "point8")
  // line("point2", "point6")

  // Sample lines which are incorrect
  // line("point0", "point3", stroke: red)
  // line("point5", "point9", stroke: red)
  // line("point7", "point1", stroke: red)
  // line("point0", "point4", stroke: red)

  let marker(coords, label) = {
    // circle(coords, radius: 0.1, fill: black)
    let length = 0.15
    line((coords.at(0) - length, coords.at(1) - length), (coords.at(0) + length, coords.at(1) + length), thickness: 0.1)
    line((coords.at(0) + length, coords.at(1) - length), (coords.at(0) - length, coords.at(1) + length), thickness: 0.1)
    content(coords, move(dy: 12pt, label))
  }

  // Correct points
  marker((5.3, 8), $x = 6$)
  marker((8.6, 3.4), $y = 6$)

  // Fake points
  marker((8.6, 16 - 3.4), $y = 0.5$)
  marker((4.5, 6.8), $y = 0.5$)
  marker((10.7, 4.8), $x = 12$)
  marker((8, 4.3), $y = 3.4$)
  marker((12.2, 10), $x = 3.5$)
  marker((7.2, 10.5), $x = 8$)
  marker((9, 8), $x = 9.5$)
  marker((6, 5), $y = 6.5$)
  marker((12.2, 6), $x = 7$)
})

#v(4em)

#set text(size: 12pt)

Hints

- Look up "set-builder notation" using a search engine