FROM ubuntu:19.10
RUN apt-get update && apt-get install -y python python-pip vim \
libssl-dev openssh-client
RUN apt-get clean && rm -rf /var/lib/apt/lists
RUN pip install ansible==2.9.4
RUN pip install boto
RUN mkdir /data
WORKDIR /data
ENTRYPOINT ["/bin/bash"]
