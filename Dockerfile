FROM jarvice/ubuntu-ibm-mldl-ppc64le

# uprev to force rebuild even if cached
ENV APP_POWERAI_VERSION 6

ADD https://raw.githubusercontent.com/nimbix/notebook-common/master/install-ubuntu.sh /tmp/install-ubuntu.sh
RUN bash /tmp/install-ubuntu.sh && rm -f /tmp/install-ubuntu.sh

COPY NAE/screenshot.png /etc/NAE/screenshot.png
COPY NAE/help.html /etc/NAE/help.html

ENV	DLCVTF /usr/local/dlcvtf

RUN mkdir $DLCVTF
RUN mkdir $DLCVTF/1day
RUN mkdir $DLCVTF/1day/notebooks
RUN mkdir $DLCVTF/1day/data
RUN mkdir $DLCVTF/3day
RUN mkdir $DLCVTF/3day/notebooks
RUN mkdir $DLCVTF/3day/data
RUN mkdir $DLCVTF/bin
COPY NAE/copy_files_and_launch $DLCVTF/bin
RUN chmod 755 $DLCVTF/bin/copy_files_and_launch

ADD https://s3-us-west-2.amazonaws.com/percptv/oneDay/00_test_install.ipynb \
	$DLCVTF/1day/notebooks/00_test_install.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/oneDay/01_linear_regression.ipynb \
	$DLCVTF/1day/notebooks/01_linear_regression.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/oneDay/02_logistic_regression_mnist.ipynb \
	$DLCVTF/1day/notebooks/02_logistic_regression_mnist.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/oneDay/03_deep_neural_network_mnist.ipynb \
	$DLCVTF/1day/notebooks/03_deep_neural_network_mnist.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/oneDay/04_MNIST_Slim_CNN.ipynb \
	$DLCVTF/1day/notebooks/04_MNIST_Slim_CNN.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/oneDay/05_MNIST_Slim_CNN_visualize.ipynb \
	$DLCVTF/1day/notebooks/05_MNIST_Slim_CNN_visualize.ipynb

RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/t10k-images-idx3-ubyte.gz \
	-o $DLCVTF/1day/data/t10k-images-idx3-ubyte.gz
RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/t10k-labels-idx1-ubyte.gz \
	-o $DLCVTF/1day/data/t10k-labels-idx1-ubyte.gz
RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/train-images-idx3-ubyte.gz \
	-o $DLCVTF/1day/data/train-images-idx3-ubyte.gz
RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/train-labels-idx1-ubyte.gz \
	-o $DLCVTF/1day/data/train-labels-idx1-ubyte.gz
RUN chmod 644 $DLCVTF/1day/data/*
RUN chmod 644 $DLCVTF/1day/notebooks/*

ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/00_test_install.ipynb \
	$DLCVTF/3day/notebooks/00_test_install.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/01_linear_regression.ipynb \
	$DLCVTF/3day/notebooks/01_linear_regression.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/02_perceptron.ipynb \
	$DLCVTF/3day/notebooks/02_perceptron.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/03_multi_class.ipynb \
	$DLCVTF/3day/notebooks/03_multi_class.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/04_deep_network.ipynb \
	$DLCVTF/3day/notebooks/04_deep_network.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/05_tensorflow_linear_regression.ipynb \
	$DLCVTF/3day/notebooks/05_tensorflow_linear_regression.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/06_tensorflow_logistic_regression.ipynb \
	$DLCVTF/3day/notebooks/06_tensorflow_logistic_regression.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/07_tensorflow_deep_network.ipynb \
	$DLCVTF/3day/notebooks/07_tensorflow_deep_network.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/08_MNIST_Slim_CNN.ipynb \
	$DLCVTF/3day/notebooks/08_MNIST_Slim_CNN.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/09_MNIST_Slim_CNN_visualize.ipynb \
	$DLCVTF/3day/notebooks/09_MNIST_Slim_CNN_visualize.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/10_Inception_retraining.ipynb \
	$DLCVTF/3day/notebooks/10_Inception_retraining.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex01.py $DLCVTF/3day/notebooks/ex01.py
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex02.py $DLCVTF/3day/notebooks/ex02.py
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex03.py $DLCVTF/3day/notebooks/ex03.py
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex04.py $DLCVTF/3day/notebooks/ex04.py
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex05.py $DLCVTF/3day/notebooks/ex05.py
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex06.py $DLCVTF/3day/notebooks/ex06.py
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex07.py $DLCVTF/3day/notebooks/ex07.py
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex08.py $DLCVTF/3day/notebooks/ex08.py
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex09.py $DLCVTF/3day/notebooks/ex09.py
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex10.py $DLCVTF/3day/notebooks/ex10.py
RUN chmod 644 $DLCVTF/3day/data/*
RUN chmod 644 $DLCVTF/3day/notebooks/*
RUN chmod 755 $DLCVTF/3day/notebooks/*.py

COPY NAE/AppDef.json /etc/NAE/AppDef.json
RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://api.jarvice.com/jarvice/validate
