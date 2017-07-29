# MNIST loader

Simple C++ MNIST data loader

## Sample Code

```cc
#include "mnist_loader.h"
#include <iostream>

int main() {
  mnist_loader train("dataset/train-images-idx3-ubyte",
                     "dataset/train-labels-idx1-ubyte", 100);
  mnist_loader test("dataset/t10k-images-idx3-ubyte",
                    "dataset/t10k-labels-idx1-ubyte", 100);

  int rows  = train.rows();
  int cols  = train.cols();
  int label = train.labels(0);
  std::vector<double> image = train.images(0);

  std::cout << "label: " << label << std::endl;
  std::cout << "image: " << std::endl;
  for (int y=0; y<rows; ++y) {
    for (int x=0; x<cols; ++x) {
      std::cout << ((image[y*cols+x] == 0.0)? ' ' : '*');
    }
    std::cout << std::endl;
  }

  return 0;
}
```

## Result

```
$ make
g++ -std=c++14 -g -Wall -Wextra -Iinclude -c src/mnist_loader.cc -o src/mnist_loader.o
g++ -std=c++14 -g -Wall -Wextra -Iinclude -c test/test_mnist.cc -o test/test_mnist.o
g++ -std=c++14 -g -Wall -Wextra -Iinclude src/mnist_loader.o test/test_mnist.o -o test/test_mnist 
./test/test_mnist
label: 5
image: 
                            
                            
                            
                            
                            
            ************    
        ****************    
       ****************     
       ***********          
        ******* **          
         *****              
           ****             
           ****             
            ******          
             ******         
              ******        
               *****        
                 ****       
              *******       
            ********        
          *********         
        **********          
      **********            
    **********              
    ********                
                            
                            
                            
```

## License

licensed under the MIT License
