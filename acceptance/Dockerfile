FROM ubuntu:trusty
RUN apt-get update && \
         apt-get install -yq curl
ADD acceptance_test.sh .
CMD ["bash", "acceptance_test.sh"]

