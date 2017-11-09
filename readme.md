MNIST to PNG Script in Ruby
===

This script generates PNG format images from the MNIST dataset with the associated value included in the filename. This script utilizes the zlib gem 

MNIST data from: <http://yann.lecun.com/exdb/mnist/>

### Dependencies
```
zlib
chunky_png
```

### Details

The MNIST data set is a data set used for machine learning that includes drawn images displaying numbers ranging from 0 to 9. Each image includes a corresponding value which represents the value of the written image. The MNIST training set included in this repository includes 60,000 images and corresponding values. 

The script utilizes the zlib gem to read the provided .gz files obtained from <http://yann.lecun.com/exdb/mnist/>. From there, images are generated using the (chunky_png)[http://chunkypng.com/] gem. The image files are named using the following format: "#{index number} - #{correct value}.png"

### Sample Images

