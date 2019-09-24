# nginx-reverse-proxy
nginx rever proxy

## Build
`docker build . --tag=wp-proxy`

## Run 
`docker run --rm  -e UPSTREAM=3.93.34.72 -p 8080:80 wp-proxy`
