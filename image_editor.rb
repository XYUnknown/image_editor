require 'mini_magick'

# ratio - target ratio
# width - target width
# height - target height
# img - the original image specified by user

class ImageEditor
  def initialize(*args)
    case args.size
    when 2
      init_ratio(*args)
    when 3
      init_size(*args)
    else
      raise ArgumentError.new("Invalid number of arguments.")
    end
  end

  def init_ratio(img, ratio)
    @img = MiniMagick::Image.open(img) # new - modify original img, open will not.
    @ratio = ratio
    if @img.width / @img.height > ratio
      @width = (@img.height * ratio).to_i
      @height = @img.height
    else
      @width = @img.width
      @height = (@img.width / ratio).to_i
    end
  end

  def init_size(img, width, height)
    @img = MiniMagick::Image.open(img)
    @width = width
    @height = height
    @ratio = (width.to_f / height.to_f).round(2)
  end

  def reset_height(height)
    @height = height
  end

  def reset_width(width)
    @width = width
  end

  def crop_img
    w = (@img.width - @width)/2
    h = (@img.height - @height)/2
    format = w.to_i.to_s + 'x' + h.to_i.to_s
    @img.shave format
  end

  # auto maintain original ratio
  def resize_img
    w = @width.to_s
    h = @height.to_s
    format = w + 'x' + h
    @img.resize format
  end

  # for JPEG range form 0 to 100, default 75
  def reset_quality(n)
    @img.quality n
  end

  def save(name)
    @img.write(name)
  end
end