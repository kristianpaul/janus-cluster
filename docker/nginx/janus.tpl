server {
  listen 80 default_server;
{{range services}} {{$name := .Name}} {{$service := service .Name}}


  {{range $service}}location /{{$name}}janus_{{.Port}} {
   proxy_pass http://{{.Address}}:80/janus;
  } 

  {{else}}# something missing {{end}}
  {{end}}


  location / {
    root /usr/share/nginx/html/;
    index index.html;
  }

  location /stub_status {
    stub_status;
  }

}
