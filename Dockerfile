FROM jarvice/ubuntu-ibm-mldl-ppc64le

# uprev to force rebuild even if cached
ENV APP_POWERAI_VERSION 6

ADD https://raw.githubusercontent.com/nimbix/notebook-common/master/install-ubuntu.sh /tmp/install-ubuntu.sh
RUN bash /tmp/install-ubuntu.sh && rm -f /tmp/install-ubuntu.sh

COPY NAE/screenshot.png /etc/NAE/screenshot.png
COPY NAE/help.html /etc/NAE/help.html

ADD https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/hamburg/00_test_install.ipynb /data/test.ipynb
#RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/t10k-images-idx3-ubyte.gz -o /data/t10k-images-idx3-ubyte.gz
#RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/t10k-labels-idx1-ubyte.gz -o /data/t10k-labels-idx1-ubyte.gz
#RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/train-images-idx3-ubyte.gz -o /data/train-images-idx3-ubyte.gz
#RUN curl https://s3-us-west-2.amazonaws.com/percptv-hamburg-us-west-2/data/train-labels-idx1-ubyte.gz -o /data/train-labels-idx1-ubyte.gz

COPY NAE/AppDef.json /etc/NAE/AppDef.json
RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://api.jarvice.com/jarvice/validate
