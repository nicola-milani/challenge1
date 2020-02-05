FROM ubuntu:19.10
RUN apt-get update && apt-get install -y python python-pip vim \
libssl-dev openssh-client
RUN apt-get clean && rm -rf /var/lib/apt/lists
RUN pip install ansible==2.9.4
ENTRYPOINT ["/bin/bash"]
