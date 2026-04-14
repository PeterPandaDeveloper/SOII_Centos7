# Basado en CentOS 7 según el sílabo [cite: 41]
FROM centos:7

# Reparación de repositorios (Método Vault)
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org/centos/$releasever|baseurl=http://vault.centos.org/7.9.2009|g' /etc/yum.repos.d/CentOS-*

# Instalación de Apache (Taller 1) [cite: 353, 358]
RUN yum -y install httpd httpd-tools && \
    yum clean all

# Puerto 80 para el servidor web [cite: 370]
EXPOSE 80

# Iniciar Apache en primer plano [cite: 362]
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]