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
  def initialize
    # initialize the class using the training dataset
    @images_file, @labels_file = 'train-images-idx3-ubyte.gz', 'train-labels-idx1-ubyte.gz'
  end

  def generate_image(num)
    # generate images for the first num items in the training set
  end
end