FROM ubuntu:19.10
RUN apt-get update 
RUN apt-get -y upgrade
RUN apt-get install -y python python-pip vim libssl-dev openssh-client nano && apt-get clean
RUN rm -rf /var/lib/apt/lists
RUN pip install ansible==2.9.4
RUN pip install boto boto3
RUN mkdir /data
WORKDIR /data
ENTRYPOINT ["/bin/bash"]
EXPOSE 22/tcp
LABEL "Name"="ansible"
LABEL "version"="1.0"
LABEL "description"="This is an ansible docker images."