local test = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas congue tortor quis lectus mattis, porta scelerisque magna vestibulum. Praesent enim erat, luctus sit amet ligula et, vulputate rutrum turpis. Aliquam at quam quis risus interdum blandit. Phasellus volutpat dolor id urna viverra tincidunt. Etiam lorem felis, mattis id ligula ac, mollis dictum nibh. Curabitur condimentum sollicitudin auctor. Morbi vitae erat felis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Nullam scelerisque, justo quis accumsan fringilla, libero dui ornare lectus, vitae volutpat magna odio ac magna. In id congue eros, rhoncus sagittis nibh. Sed efficitur, erat a fringilla facilisis, neque eros iaculis felis, tristique laoreet velit odio eget libero. Donec quis risus sit amet tellus efficitur suscipit. Cras blandit id ligula et rutrum. Maecenas et ante odio. Vestibulum sed accumsan lacus, non mollis est. Duis in eleifend ligula. Nullam sit amet sapien in ligula pretium condimentum nec sit amet tellus. Donec auctor, justo ac facilisis dapibus, ex nisl venenatis lacus, et aliquet nunc turpis facilisis magna. Proin ornare eleifend aliquam. In ullamcorper volutpat urna sed vulputate. Vestibulum a neque ultrices, finibus purus eu, condimentum lorem. "
local test2 = "Etiam dapibus est id magna fermentum, quis ultrices mi placerat. Pellentesque malesuada orci id molestie condimentum. Mauris commodo nisi nec justo lobortis, a vehicula tortor fringilla. Nullam non eleifend odio. Phasellus laoreet tempor magna, eget ornare enim. Nunc quis eros sed libero scelerisque dictum ac sit amet erat. Donec varius turpis interdum neque sodales, aliquam efficitur sem sodales. Aliquam vel nibh a neque auctor dignissim eu in felis. Pellentesque laoreet, nisl nec consequat tristique, justo velit semper urna, in aliquam dolor lacus id massa. Pellentesque tortor odio, volutpat at porttitor id, malesuada eu lorem. Vestibulum mollis malesuada purus ultrices convallis. Fusce sed massa dolor. Duis tempor rhoncus fringilla. Sed elementum pharetra fermentum. Donec odio tortor, consectetur a mauris vel, condimentum efficitur felis. Phasellus imperdiet purus et imperdiet vestibulum. Cras eu lectus nec dolor posuere ullamcorper vel non nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur aliquet laoreet. Ut porta tincidunt metus."

--- Text display
function Text:new (o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Text:shift(x,v)
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

function Text:textDraw(text,size,pos_x,pos_y)
  canvas:attrFont("Alex Brush", 14, "normal")
  for i=1,(string.len(text)/size)+1 do
    if i==1 then
      result=string.sub(text,i,size)
      canvas:drawText(box*2, box*2.5 , result)
    else
      result=string.sub(text,((i-1)*size)+1,(i*size))
      if string.sub(result,1,1) == " " then
        result = string.sub(result,2,size)
      end
      canvas:drawText(box*2,box*2.5+(i-1)*30, result)
    end
    --  print(result)
  end

end

function Text:draw(t)
  --local fundo = canvas:new ("fundo.png")

  local font_size = 20
  local icon_size = 100

  if (self.first == true) then
    canvas:attrColor(0,0,0,0)
    canvas:clear(pos_x,pos_y,background_w,background_h )
  end

  if (t >= 0) then

    self.first=true

    --Draw Group Background
    canvas:attrColor(153,151,204,200)
    canvas:drawRect("fill", box, box, box*30, box*13.5 )

    canvas:attrColor("red")
    canvas:drawRect("frame", box*2, box*2, box*24, box*12 )


    -- Draw Group Icon
    local str = string.format("%02d" , t)
    local icone = canvas:new("media/icon" .. str .. ".png")
    canvas:compose(((box*30.5)-icon_size), (box*5)-icon_size, icone )

    -- Draw Group Title
    canvas:attrColor(255,255,255,255)
    canvas:attrFont("GFS Artemisia", font_size,"normal")
    local textSizeWidth, textSizeHeight = canvas:measureText (self.list[t])
    --print( canvas:measureText (self.list[t]))
    canvas:drawText((box*30.5-textSizeWidth), box*2-textSizeHeight, self.list[t])

    -- Draw Group Text using textDraw() function
    canvas:attrFont("Alex Brush", 10, "normal")
    canvas:attrColor(255,255,255,200)
    self:textDraw(test,100,box*2,box*2)
    canvas:flush()
  end
end
