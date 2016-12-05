function easter()

  local r = math.random(0,255)
  local g = math.random(0,255)
  local b = math.random(0,255)
  local a = math.random(0,255)

  local x   = math.random(0,1920)
  local y   = math.random(0,1080)
  local w   = math.random(0,500)
  local h   = math.random(0,300)

  canvas:attrColor(r,g,b,a)
  canvas:drawRect("fill", x, y, w, h )
--  canvas:drawEllipse("fill",x,y,w,h)
  canvas:flush()

end
