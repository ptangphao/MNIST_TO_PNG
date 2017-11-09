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
  end

  private

  def extract_data_and_labels
  end

  def create_white_png
    return ChunkyPNG::Image.new(28,28, WHITE)
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