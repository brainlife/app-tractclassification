FROM brainlife/mcr:neurodebian1604-r2017a

MAINTAINER Lindsey Kitchell <kitchell@indiana.edu>

#RUN yum update 
RUN apt-get update

ADD /compiledmatlab /app

#we want all output to go here (config.json should also go here)
WORKDIR /output

ENTRYPOINT ["/app/main"] 
