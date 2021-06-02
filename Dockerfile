FROM python:3-alpine
RUN apk add --update --no-cache strongswan curl
RUN pip install requests
RUN rm /etc/ipsec.conf && ln -s /server-secrets/ipsec.conf /etc/ipsec.conf
RUN rm /etc/ipsec.secrets && ln -s /server-secrets/ipsec.secrets /etc/ipsec.secrets
ADD helpers /helpers
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
