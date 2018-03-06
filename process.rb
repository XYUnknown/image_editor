require_relative "image_editor"

def run_size
  ie = ImageEditor.new('image/test.jpg', 1000, 1000)
  ie.crop_img
  name = 'image/my_img_s.jpg'
  ie.save(name)
end

def run_ratio
  ie = ImageEditor.new('image/test.jpg', 0.9)
  ie.crop_img
  name = 'image/my_img_r.jpg'
  ie.save(name)
end

## run programme
run_size
run_ratio