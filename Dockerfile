FROM centos

MAINTAINER Abraham Bribiesca

RUN curl -o /etc/yum.repos.d/squid.repo https://raw.githubusercontent.com/AbrahamBribi/proxy-squid/master/squid.repo
RUN yum update -y
RUN yum -y install squid net-tools
RUN yum clean all
RUN curl -o /etc/squid/squid.conf https://raw.githubusercontent.com/AbrahamBribi/proxy-squid/master/squid.conf
RUN curl -o /root/startup.sh https://raw.githubusercontent.com/AbrahamBribi/proxy-squid/master/startup.sh
RUN touch /etc/squid/forbidden.lst
RUN chmod +x /root/startup.sh
CMD /root/startup.sh
CMD ip=$(ifconfig |head -2|grep inet|cut -d" " -f10)
CMD clear
CMD echo -e "\n\n************************************";echo "* Your container IP is: $ip *"
CMD echo "* Port: 3128                       *"; echo -e "************************************\n\n\n"
CMD echo "Press any key to continue"
CMD read -n1
CMD squid;clear
CMD tail -f /var/log/squid/access.log
