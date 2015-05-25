FROM yshean/nvidia-caffe

MAINTAINER Yong Shean Chong yshean@gmail.com

# Clone the DIGITS repo	
RUN cd /opt && git clone https://github.com/NVIDIA/DIGITS.git digits

# Install dependencies
RUN apt-get update && \
	cd /opt/digits && \ 
	for req in $(cat requirements.txt); do pip install $req; done && \
	apt-get install fonts-liberation graphviz libcdt5 libcgraph6 libgd3 libgvc6 libgvpr2 libpathplan4 libxaw7 libxpm4 graphviz && \
	for req in $(cat requirements_test.txt); do pip install $req; done

RUN pip uninstall pyparsing && \
    pip install -Iv https://pypi.python.org/packages/source/p/pyparsing/pyparsing-1.5.7.tar.gz#md5=9be0fcdcc595199c646ab317c1d9a709 && \
    pip install pydot

EXPOSE 5000 8080