FROM debian:wheezy
MAINTAINER Christian Simon <simon@swine.de>

# Install req
RUN apt-get update &&  \
    DEBIAN_FRONTEND=noninteractive apt-get -y install dropbear wget curl rsync vim psmisc procps git && \
    apt-get clean && \
    rm /var/lib/apt/lists/*_*

# Remove keys
RUN rm /etc/dropbear/dropbear_dss_host_key /etc/dropbear/dropbear_rsa_host_key

# add run script
ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD /run.sh

# expose port 
EXPOSE 22
