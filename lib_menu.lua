--- Main Menu
function MainMenu:new (o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function MainMenu:shift(x,v)
  -- not as num?
  if v == nil then v = 0 end
  if x + v < 1 then
    return x + v +self.limit
  elseif  x + v > self.limit  then
    return x + v - self.limit
  else
    return x+v
  end
end

function MainMenu:settings()
  self.debug=not self.debug
  local pos_x = screen_width-(screen_width/6)
  local pos_y = 0
  if (self.debug==true) then
    canvas:attrColor("red")
    --canvas:clear(screen_width-(screen_width/4),sc)
    canvas:drawRect("fill",screen_width-(screen_width/6),0,200,200)
    canvas:attrColor("white")
    canvas:attrFont("Vera", 12,"normal")
    canvas:drawText(pos_x,pos_y, screen_width .. "x" .. screen_height .. "\n" .. self.pos)
  else
    canvas:attrColor(0,0,0,0)
    canvas:clear(pos_x,pos_y,200,200)
  end
  canvas:flush()
end

function MainMenu:draw(t)
  canvas:attrColor(0,0,0,0)
  canvas:clear(128,600, 1280, 720 )
   for i=1,t  do
    if i==1 then
      self:draw_item(self:shift(self.pos-1,i),i,true)
    else
      self:draw_item(self:shift(self.pos-1+i),i)
    end
  end
  canvas:flush()
end

function MainMenu:draw_item(t, slot, ativo)

  --setup parameters
  local padding = screen_width/32
  local pos_x = screen_width/32
  local pos_y = screen_height/18
  local item_h = 100
  local item_w = 100

  local font_size = 12

  local icone = canvas:new("media/icon" .. string.format("%02d" , t) .. ".png")
  canvas:compose((pos_x+(item_w*(slot-1))+(padding*(slot-1))), pos_y*17.5-item_h, icone )
  canvas:attrColor("blue")
  canvas:attrFont("Vera", font_size,"bold")

  if ativo then
    canvas:attrColor(255,255,255,120)
    --    canvas:drawEllipse("frame", pos_x+item_h/2, pos_y+item_w/2, 100, 100)
    canvas:drawRect("frame", pos_x, pos_y*17.5-item_h, 100, 100)
  end

  canvas:flush()
end
