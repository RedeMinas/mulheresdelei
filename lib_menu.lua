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

function MainMenu:draw(t)
   canvas:attrColor('white')
  -- canvas:drawRect('fill', 0, 0, screen_width, screen_height )
--  canvas:clear()
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
  local padding = 32
  local pos_x = 128
  local pos_y = 600
  local item_h = 100
  local item_w = 100
  local font_size = 12

  
  str = string.format("%02d" , t)
  local icone = canvas:new("media/icon" .. str .. ".png")
  canvas:compose((pos_x+(item_w*(slot-1))+(padding*(slot-1))), pos_y, icone )
  canvas:attrColor("blue")
  --    canvas:drawRect("fill", (pos_x+(item_w*(slot-1))+(padding*(slot-1))), pos_y, item_w, item_h )
  canvas:attrFont("vera", font_size,"bold")


  if ativo then
    canvas:attrColor("pink")
    --    canvas:drawEllipse("frame", pos_x+item_h/2, pos_y+item_w/2, 100, 100)
    canvas:drawRect("frame", pos_x, pos_y, 100, 100)
  end

  canvas:flush()
end
