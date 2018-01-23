FROM jarvice/ubuntu-ibm-mldl-ppc64le

# uprev to force rebuild even if cached
ENV APP_POWERAI_VERSION 6

ADD https://raw.githubusercontent.com/nimbix/notebook-common/master/install-ubuntu.sh /tmp/install-ubuntu.sh
RUN bash /tmp/install-ubuntu.sh && rm -f /tmp/install-ubuntu.sh

COPY NAE/screenshot.png /etc/NAE/screenshot.png
COPY NAE/help.html /etc/NAE/help.html

ENV	DLCVTF /usr/local/dlcvtf

RUN mkdir ${DLCVTF}
RUN mkdir ${DLCVTF}/oneDay
RUN mkdir ${DLCVTF}/oneDay/notebooks
RUN mkdir ${DLCVTF}/oneDay/data
RUN mkdir ${DLCVTF}/threeDay
RUN mkdir ${DLCVTF}/threeDay/notebooks
RUN mkdir ${DLCVTF}/threeDay/data
RUN mkdir ${DLCVTF}/bin
COPY NAE/copy_files_and_launch ${DLCVTF}/bin
RUN chmod 755 ${DLCVTF}/bin/copy_files_and_launch

ADD https://s3-us-west-2.amazonaws.com/percptv/oneDay/00_test_install.ipynb \
	${DLCVTF}/oneDay/notebooks/00_test_install.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/oneDay/01_linear_regression.ipynb \
	${DLCVTF}/oneDay/notebooks/01_linear_regression.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/oneDay/02_logistic_regression_mnist.ipynb \
	${DLCVTF}/oneDay/notebooks/02_logistic_regression_mnist.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/oneDay/03_deep_neural_network_mnist.ipynb \
	${DLCVTF}/oneDay/notebooks/03_deep_neural_network_mnist.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/oneDay/04_MNIST_Slim_CNN.ipynb \
	${DLCVTF}/oneDay/notebooks/04_MNIST_Slim_CNN.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/oneDay/05_MNIST_Slim_CNN_visualize.ipynb \
	${DLCVTF}/oneDay/notebooks/05_MNIST_Slim_CNN_visualize.ipynb

RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/t10k-images-idx3-ubyte.gz \
	-o ${DLCVTF}/oneDay/data/t10k-images-idx3-ubyte.gz
RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/t10k-labels-idx1-ubyte.gz \
	-o ${DLCVTF}/oneDay/data/t10k-labels-idx1-ubyte.gz
RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/train-images-idx3-ubyte.gz \
	-o ${DLCVTF}/oneDay/data/train-images-idx3-ubyte.gz
RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/train-labels-idx1-ubyte.gz \
	-o ${DLCVTF}/oneDay/data/train-labels-idx1-ubyte.gz
RUN chmod 644 ${DLCVTF}/oneDay/data/*
RUN chmod 644 ${DLCVTF}/oneDay/notebooks/*

ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/00_test_install.ipynb \
	${DLCVTF}/threeDay/notebooks/00_test_install.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/01_linear_regression.ipynb \
	${DLCVTF}/threeDay/notebooks/01_linear_regression.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/02_perceptron.ipynb \
	${DLCVTF}/threeDay/notebooks/02_perceptron.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/03_multi_class.ipynb \
	${DLCVTF}/threeDay/notebooks/03_multi_class.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/04_deep_network.ipynb \
	${DLCVTF}/threeDay/notebooks/04_deep_network.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/05_tensorflow_linear_regression.ipynb \
	${DLCVTF}/threeDay/notebooks/05_tensorflow_linear_regression.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/06_tensorflow_logistic_regression.ipynb \
	${DLCVTF}/threeDay/notebooks/06_tensorflow_logistic_regression.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/07_tensorflow_deep_network.ipynb \
	${DLCVTF}/threeDay/notebooks/07_tensorflow_deep_network.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/08_MNIST_Slim_CNN.ipynb \
	${DLCVTF}/threeDay/notebooks/08_MNIST_Slim_CNN.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/09_MNIST_Slim_CNN_visualize.ipynb \
	${DLCVTF}/threeDay/notebooks/09_MNIST_Slim_CNN_visualize.ipynb
ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/10_Inception_retraining.ipynb \
	${DLCVTF}/threeDay/notebooks/10_Inception_retraining.ipynb
#ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex01.py ${DLCVTF}/threeDay/notebooks/ex01.py
#ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex02.py ${DLCVTF}/threeDay/notebooks/ex02.py
#ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex03.py ${DLCVTF}/threeDay/notebooks/ex03.py
#ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex04.py ${DLCVTF}/threeDay/notebooks/ex04.py
#ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex05.py ${DLCVTF}/threeDay/notebooks/ex05.py
#ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex06.py ${DLCVTF}/threeDay/notebooks/ex06.py
#ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex07.py ${DLCVTF}/threeDay/notebooks/ex07.py
#ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex08.py ${DLCVTF}/threeDay/notebooks/ex08.py
#ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex09.py ${DLCVTF}/threeDay/notebooks/ex09.py
#ADD https://s3-us-west-2.amazonaws.com/percptv/threeDay/ex10.py ${DLCVTF}/threeDay/notebooks/ex10.py
#RUN chmod 644 ${DLCVTF}/threeDay/data/*
#RUN chmod 644 ${DLCVTF}/threeDay/notebooks/*
#RUN chmod 755 ${DLCVTF}/threeDay/notebooks/*.py

COPY NAE/AppDef.json /etc/NAE/AppDef.json
RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://api.jarvice.com/jarvice/validate
