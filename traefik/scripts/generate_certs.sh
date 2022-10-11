# To install the needed certbot plugin: /opt/homebrew/Cellar/certbot/1.31.0/libexec/bin/pip3 install certbot-dns-route53

# See https://gerrit.instructure.com/plugins/gitiles/quiz_lti/+/refs/heads/master/doc/local_ssl.md

# TODO: this script is not complete :) Copy the certificate and key files into /certificates and rename them to local-inseng.crt and local-inseng.key
rapture wrap inseng-power certbot certonly --dns-route53 --keep-until-expiring --expand --non-interactive -d "local.inseng.net" --config-dir /tmp --work-dir /tmp --logs-dir /tmp --agree-tos --email "$(whoami)@instructure.com"