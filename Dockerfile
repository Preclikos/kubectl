FROM debian:bullseye-slim

ARG KUBE_VERSION="v1.25.2"

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 
RUN apt update
RUN apt install -y curl ca-certificates openssl
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/$KUBE_VERSION/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl
RUN rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]
CMD ["cluster-info"]
