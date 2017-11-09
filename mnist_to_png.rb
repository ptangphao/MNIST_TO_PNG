require 'zlib'
require 'chunky_png'

# initialize using training set

# get_data_and labels
  # load data
  # create 2 arrays
  # unpack data
  # return an array with 1. image data and 2. value data


# grab data from get_data_and_labels

# method that creates an image from the image format
# utilize that method

class MnistPNGGenerator
  WHITE = ChunkyPNG::Color.from_hex('#FFFFFF')

  def initialize
    # initialize the class using the training dataset
    @images_file, @labels_file = 'train-images-idx3-ubyte.gz', 'train-labels-idx1-ubyte.gz'
  end

  def generate_images(num)
    # generate images for the first num items in the training set
    (0...num).each{|n| generate_image(n)}
  end

  private
  
  def normalize val, fromLow, fromHigh, toLow, toHigh
      (val - fromLow) * (toHigh - toLow) / (fromHigh - fromLow).to_f
  end

  def extract_data_and_labels
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

    # collate image and label data
    @data = images.map.with_index do |image, i|
      target = [0]*10
      target[labels[i]] = 1
      [image, target]
    end

    x_data, y_data = [], []
    
    @data.slice(0, 100).each do |row|
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
    # determines the label value based on an input array
    input.index(1)
  end

  def generate_image(index)
    # creates a 28 x 28 pixel png with a white background
    default_png = create_white_png
    # extract 
    extracted_data = self.extract_data_and_labels
    pixel_references = (0..27).to_a.product((0..27).to_a)
    pixel_references.each do |pixels|
      if 
    end

  end
end