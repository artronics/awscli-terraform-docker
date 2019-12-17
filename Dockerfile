FROM hashicorp/terraform:latest AS terraform

FROM alpine:latest

RUN apk add --update \
    bash \
    ca-certificates \
    python \
    python-dev \
    py-pip \
    build-base \
    git \
    && pip install awscli --upgrade --user \
    && apk --purge -v del py-pip \
    && rm -rf /var/cache/apk/* \
    && cp -ra /root/.local/bin/. /usr/bin/

COPY --from=terraform /bin /usr/bin

CMD ["/bin/bash"]
