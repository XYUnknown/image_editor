require_relative 'image_editor'

def run_size(width, height)
  ie = ImageEditor.new('image/test.jpg', width, height)
  ie.crop_img
  name = 'image/my_img_s.jpg'
  ie.save(name)
end

def run_ratio(ratio)
  ie = ImageEditor.new('image/test.jpg', ratio)
  ie.crop_img
  name = 'image/my_img_r.jpg'
  ie.save(name)
end

def run_quality(quality)
  ie = ImageEditor.new('image/test.jpg', 1000, 1000)
  ie.reset_quality(quality)
  name = 'image/my_img_q.jpg'
  ie.save(name)
end

def run_resize(width, height)
  ie = ImageEditor.new('image/test.jpg', width, height)
  ie.resize_img
  name = 'image/my_img_rs.jpg'
  ie.save(name)
end

## run programme
run_size(1000, 1000)
run_ratio(0.9)
run_quality(20)
run_resize(800, 800)