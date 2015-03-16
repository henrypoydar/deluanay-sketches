$(document).ready ->

  width = 1300
  height = 800
  edge_size = 200
  num_points = 1000
  points = []
  svg = d3.select('#svg-area')

  # Colors
  colors = []

  console.time("generate");

  $.ajax
    url: 'data/colors.json'
    async: false
    dataType: 'json'
    success: (res) ->
      _.map res, (o) ->
        # console.log o.munsell_hue
        _.map o.children, (c) ->
          if c.company == 'Liquitex'
            colors.push c.hex
            return
      return


  # Generate points
  _(num_points).times ->
    points.push [Math.floor(Math.random()*(width+(edge_size*2)))-edge_size, Math.floor(Math.random()*(height+(edge_size*2)))-edge_size]

  polygons = Delaunay.triangulate(points)

  # Plot points
  # _.map points, (p) ->
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
      # attr("fill", "hsl(190,100%,#{(Math.random()*10)+30}%)").
      attr("fill", _.shuffle(colors)[0]).
      attr("points", pts)


   console.timeEnd("generate");