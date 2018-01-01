FROM jarvice/ubuntu-ibm-mldl-ppc64le

# uprev to force rebuild even if cached
ENV APP_POWERAI_VERSION 6

ADD https://raw.githubusercontent.com/nimbix/notebook-common/master/install-ubuntu.sh /tmp/install-ubuntu.sh
RUN bash /tmp/install-ubuntu.sh && rm -f /tmp/install-ubuntu.sh

COPY NAE/screenshot.png /etc/NAE/screenshot.png
COPY NAE/help.html /etc/NAE/help.html

RUN mkdir /usr/local/dlcvtf
RUN mkdir /usr/local/dlcvtf/notebooks
RUN mkdir /usr/local/dlcvtf/data
RUN mkdir /usr/local/dlcvtf/bin
COPY NAE/copy_files_and_launch /usr/local/dlcvtf/bin
RUN chmod 755 /usr/local/dlcvtf/bin/copy_files_and_launch
ADD https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/hamburg/00_test_install.ipynb /usr/local/dlcvtf/notebooks/00_test_install.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/hamburg/01_linear_regression.ipynb /usr/local/dlcvtf/notebooks/01_linear_regression.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/hamburg/02_logistic_regression_mnist.ipynb /usr/local/dlcvtf/notebooks/02_logistic_regression_mnist.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/hamburg/03_deep_neural_network_mnist.ipynb /usr/local/dlcvtf/notebooks/03_deep_neural_network_mnist.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/hamburg/04_deep_mnist_visualize.ipynb /usr/local/dlcvtf/notebooks/04_deep_mnist_visualize.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/hamburg/05_MNIST_CNN.ipynb /usr/local/dlcvtf/notebooks/05_MNIST_CNN.ipynb
RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/t10k-images-idx3-ubyte.gz -o /usr/local/dlcvtf/data/t10k-images-idx3-ubyte.gz
RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/t10k-labels-idx1-ubyte.gz -o /usr/local/dlcvtf/data/t10k-labels-idx1-ubyte.gz
RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/train-images-idx3-ubyte.gz -o /usr/local/dlcvtf/data/train-images-idx3-ubyte.gz
RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/train-labels-idx1-ubyte.gz -o /usr/local/dlcvtf/data/train-labels-idx1-ubyte.gz
RUN chmod 644 /usr/local/dlcvtf/data/*
RUN chmod 644 /usr/local/dlcvtf/notebooks/*

COPY NAE/AppDef.json /etc/NAE/AppDef.json
RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://api.jarvice.com/jarvice/validate
