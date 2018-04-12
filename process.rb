require_relative 'image_editor'
IMG = "images/"
EXT = ".jpg"
SUCCESS_MSG = "Done!"
def run
  puts("Please enter your image name (please ensure it is under path images/):")
  img = IMG + gets.strip! + EXT
  begin
    test_open_img(img)
  rescue Exception
    puts("Ooops... wrong image path!")
    exit(status=1)
  end
  puts("Please enter your new image name:")
  name = IMG+ gets.strip! + EXT
  puts("Please enter your operation:")
  puts("crop, compress, resize")
  op = gets.downcase.strip!
  case op
    when "crop"
      puts("Do you want to crop by ratio or size, i.e., width and length? (r/s)")
      val = gets.downcase.strip!
      case val
        when "r"
          puts("Please enter target ratio:")
          r = gets.to_f
          begin
            run_ratio(img, r, name)
            puts(SUCCESS_MSG)
          rescue Exception
            puts("Ooops... invalid input")
          end
        when "s"
          puts("Please enter target width:")
          w = gets.to_i
          puts("Please enter target height:")
          h = gets.to_i
          begin
            run_size(img, w, h, name)
            puts(SUCCESS_MSG)
          rescue Exception
            puts("Ooops... invalid input")
          end
        else
          puts("wrong arguments!")
      end
    when "compress"
      puts("Please enter target quality (an integer range from 0-100)")
      q = gets.to_i
      begin
        run_quality(img, q, name)
        puts(SUCCESS_MSG)
      rescue Exception
        puts("Ooops... invalid input")
      end
    when "resize"
      puts("Notice that original ratio will be maintained.")
      puts("Please enter target width:")
      w = gets.to_i
      puts("Please enter target height:")
      h = gets.to_i
      begin
        run_resize(img, w, h, name)
        puts(SUCCESS_MSG)
      rescue Exception
        puts("Ooops... invalid input")
      end
    else
      puts("wrong operation!")
  end

end

def run_size(img, width, height, name)
  # img = 'image/test.jpg'
  ie = ImageEditor.new(img, width, height)
  ie.crop_img
  # name = 'image/my_img_s.jpg'
  ie.save(name)
end

def run_ratio(img, ratio, name)
  # img = 'image/test.jpg'
  ie = ImageEditor.new(img, ratio)
  ie.crop_img
  # name = 'image/my_img_r.jpg'
  ie.save(name)
end

def run_quality(img, quality, name)
  # img = 'image/test.jpg'
  ie = ImageEditor.new(img, 1000, 1000)
  ie.reset_quality(quality)
  # name = 'image/my_img_q.jpg'
  ie.save(name)
end

def run_resize(img, width, height, name)
  # img = 'image/test.jpg'
  ie = ImageEditor.new(img, width, height)
  ie.resize_img
  # name = 'image/my_img_rs.jpg'
  ie.save(name)
end

def test_open_img(img)
  MiniMagick::Image.open(img)
end

## run programme
run
