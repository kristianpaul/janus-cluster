server {
  server_name janus.webcall.ninjapbx.com;

  ssl_certificate /etc/letsencrypt/live/webcall.ninjapbx.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/webcall.ninjapbx.com/privkey.pem;
  # Ensure this line points to your dhparams file
  ssl_dhparam /etc/nginx/ssl/dhparams.pem;

  # These shouldn't need to be changed
  listen 443;
  add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";
  ssl on;
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  ssl_ciphers "EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH:!aNULL:!eNULL:!EXPORT:!DES:!MD5:!PSK:!RC4";
  ssl_prefer_server_ciphers on;
  ssl_session_cache shared:SSL:10m;

  proxy_buffering off;
{{range services}} {{$name := .Name}} {{$service := service .Name}}


  {{range $service}}location /{{$name}}janus_{{.Port}} {
   proxy_pass http://{{.Address}}:80/janus;
  } 

  {{else}}# something missing {{end}}
  {{end}}

  location /stub_status {
    stub_status;
  }

}
