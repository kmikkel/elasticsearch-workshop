FROM python:2.7

ENV http_proxy http://www-proxy.statoil.no:80/
ENV https_proxy http://www-proxy.statoil.no:80/

RUN apt-get update && apt-get -y install netcat

# We use /code as working directory
WORKDIR /code

# Adding requirements.txt first before anything else. If there has not been any
# changes to requirements.txt since last build, Docker will use the cached
# version instead of running pip install again.
ADD ./requirements.txt /code/requirements.txt
RUN pip install --requirement requirements.txt

# Finally, add the rest of the code
ADD . /code

# The port where our API application is listening.
EXPOSE 80

# We set our own entrypoint, allowing us to verify database availability before
# the application is started.
ENTRYPOINT ["./docker-entrypoint.sh"]

# Start the API by default if no other command is given when running the
# container
CMD ["api"]
