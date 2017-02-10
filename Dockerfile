FROM centos

MAINTAINER Abraham Bribiesca

RUN yum update -y
RUN yum -y install squid net-tools
CMD ip=$(ifconfig |head -2|grep inet|cut -d" " -f10)
CMD clear
CMD echo -e "\n\n************************************";echo "* Your container IP is: $ip *"
CMD echo "* Port: 3128                       *"; echo -e "************************************\n\n\n"
CMD echo "Press any key to continue"
CMD read -n1
CMD squid;clear
CMD tail -f /var/log/squid/access.log
