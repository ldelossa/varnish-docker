# varnish-docker

Needed a very quick way to get varnish up and running on and test locally. This installs from source to avoid any systemd/sysv issues. 

I don't do any environment variable enjection in the default.vcl as I felt it was limiting from the examples I saw. Instead I suggest you edit the file and re-build. The docker engine will keep a cache of the build and will simply update the default.vcl portion, it's a very quick workflow

```
git clone https://github.com/ldelossa/varnish-docker.git
cd /varnish-docker/
#edit default.vcl during this period of time
docker build -t ldelossa/varnish .
```
Now if you need to make changes, just go repeat the following steps and let the docker engine cache take care of it. 
