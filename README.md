##Docker image **simonswine/dropbear**

Minimal docker image with SSH daemon dropbear.

* Creates host keys if non existing 
* Could be used for restricted root ssh access 

###Example usage

#### Container only no volumes

```
# Fetch image
docker fetch simonswine/dropbear

# Start a container and map to host port 22001 
docker run -d -p 22001:22 simonswine/dropbear
1f4d54c419e3ece40ed4a2f9c0f46702d20c8940413f87d96e6065e51a430fbb

# Add a public key
docker exec -t -i 1f4d54 /bin/bash
root@1f4d54c419e3:/# mkdir -p /root/.ssh && echo "ssh-rsa [...]" > /root/.ssh/authorized_keys
```

#### Persistent volumes 
```
# Fetch image
docker fetch simonswine/dropbear

# Start a container and map to host port 22001 
docker run -d -p 22001:22 \
   -v /_container1/dropbear:/etc/dropbear \
   -v /_container1/ssh:/root/.ssh \
   simonswine/dropbear

# Add a public key
echo "ssh-rsa [...]" > /root/.ssh/authorized_keys
```
### Example with capistrano
* https://www.simon.im/netz/2014/11/secure-capistrano-deployment-with-root-rights

