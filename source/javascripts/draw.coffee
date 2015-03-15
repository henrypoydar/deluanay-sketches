$(document).ready ->

  width = 1300
  height = 800
  num_points = 1000
  points = []
  svg = d3.select('#svg-area')

  # Generate points
  _(num_points).times ->
    points.push [Math.floor(Math.random()*width), Math.floor(Math.random()*height)]

  polygons = Delaunay.triangulate(points)

  # Plot points
  _.map points, (p) ->
    # svg.append("circle").
    #   attr("cx", p[0]).
    #   attr("cy", p[1]).
    #   attr("r", 3).
    #   attr("fill")

  i = polygons.length
  while i
    --i
    pt1x = points[polygons[i]][0]
    pt1y = points[polygons[i]][1]
    --i
    pt2x = points[polygons[i]][0]
    pt2y = points[polygons[i]][1]
    --i
    pt3x = points[polygons[i]][0]
    pt3y = points[polygons[i]][1]
    pts = "#{pt1x},#{pt1y} #{pt2x},#{pt2y} #{pt3x},#{pt3y}"
    svg.append("polygon").
      attr("fill", "hsl(180,100%,#{Math.random()*50}%)").
      attr("points", pts)

