require 'zlib'
require 'chunky_png'

class MnistPNGGenerator
  WHITE = ChunkyPNG::Color.from_hex('#FFFFFF')

  def initialize
    @images_file, @labels_file = 'train-images-idx3-ubyte.gz', 'train-labels-idx1-ubyte.gz'
  end

  def generate_images(num)
    @raw_data = extract_data_and_labels(num)
    (0...num).each{|n| generate_image(n)}
    puts "First #{num} images have been created. See your directory."
  end

  private
  
  def normalize(val, fromLow, fromHigh, toLow, toHigh)
      (val - fromLow) * (toHigh - toLow) / (fromHigh - fromLow).to_f
  end

  def extract_data_and_labels(num)
    n_rows = n_cols = nil
    images = []
    labels = []

    Zlib::GzipReader.open(@images_file) do |f|
      magic, n_images = f.read(8).unpack('N2')
      raise 'This is not MNIST image file' if magic != 2051
      n_rows, n_cols = f.read(8).unpack('N2')
      n_images.times do
        images << f.read(n_rows * n_cols)
      end
    end

    Zlib::GzipReader.open(@labels_file) do |f|
      magic, n_labels = f.read(8).unpack('N2')
      raise 'This is not MNIST label file' if magic != 2049
      labels = f.read(n_labels).unpack('C*')
    end

    @data = images.map.with_index do |image, i|
      target = [0]*10
      target[labels[i]] = 1
      [image, target]
    end

    x_data, y_data = [], []
    
    @data.slice(0, num).each do |row|
      image = row[0].unpack('C*')
      image = image.map {|v| normalize(v, 0, 256, 0, 1)}
      x_data << image
      y_data << row[1]
    end

    [x_data, y_data]
  end

  def create_white_png
    return ChunkyPNG::Image.new(28,28, WHITE)
  end

  def mnist_value(input)
    input.index(1)
  end

  def generate_image(idx)
    default_png = create_white_png
    raw_image = @raw_data[0][idx].map{|t| ((1-t) * 255).to_i}.each_slice(28).to_a
    pixel_references = (0..27).to_a.product((0..27).to_a)
    pixel_references.each do |pixels|
        default_png[pixels.last,pixels.first] = ChunkyPNG::Color.grayscale(raw_image[pixels.first][pixels.last])
    end
    val = mnist_value(@raw_data[1][idx])
    default_png.save("#{idx}-#{val}.png", :interlace => true)
  end
end