# proxy-squid
Docker container based on CentOS

 * based on Centos 7 see https://github.com/CentOS
 * squid package installed

## start container

```
docker run -d -p 3128:3128 abrahamb/proxy-squid
```

and then use from localhost:

```
export http_proxy=htpt://127.0.0.1:3128
curl http://example.com/
```
