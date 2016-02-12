FROM centos:7.1.1503
MAINTAINER ldelossa "ldelossa.ld@gmail.com"

RUN yum install -y epel-release && yum makecache fast
RUN yum install -y git autoconf automake jemalloc-devel \
		   libedit-devel libtool ncurses-devel  \
		   pcre-devel pkgconfig python-docutils \
                   python-sphinx make cc gcc
RUN cd /opt/; git clone https://github.com/varnish/Varnish-Cache.git;
RUN cd /opt/Varnish-Cache/; sh autogen.sh; sh configure; make; make install;
RUN mkdir -p /usr/local/etc/varnish

ADD default.vcl /usr/local/etc/varnish/default.vcl

ENTRYPOINT varnishd -F -f /usr/local/etc/varnish/default.vcl
