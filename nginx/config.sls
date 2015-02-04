# nginx.config
#
# Manages the main nginx server configuration file.

{% from 'nginx/map.jinja' import nginx, sls_block with context %}

nginx_config:
  file.managed:
    {{ sls_block(nginx.server.opts) }}
    - name: {{ nginx.lookup.conf_file }}
    - source: salt://nginx/files/nginx.conf
    - template: jinja
    - context:
        config: {{ nginx.server.config|json() }}
