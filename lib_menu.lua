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
  -- canvas:attrColor('white')
  -- canvas:drawRect('fill', 0, 0, screen_width, screen_height )
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
  local padding = 48
  local pos_x = 93
  local pos_y = 870
  local item_h = 150
  local item_w = 150
  local font_size = 12
  --canvas:clear( )
  --
  if ativo then
    canvas:attrColor("purple")
    canvas:drawRect("fill", pos_x, pos_y, item_w, item_h )
    canvas:attrFont("vera", font_size, "bold")
    canvas:attrColor(40,18,67,50)
  else
    canvas:attrColor("blue")
    canvas:drawRect("fill", (pos_x+(item_w*(slot-1))+(padding*(slot-1))), pos_y, item_w, item_h )
    canvas:attrFont("vera", font_size,"bold")
    canvas:attrColor(22,241,241,50)
  end
  canvas:drawText((pos_x+(item_w*(slot-1))+(padding*(slot-1))+5), pos_y+45, self.list[t] )
  canvas:flush()
end
