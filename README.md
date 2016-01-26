# pay4later/docker-comodo

A docker container to run the linux comodo antivirus client's cmdscan utility.

## Building the image

```sh
docker build -t pay4later/docker-comodo .
```

## Running the image

```sh
docker run -v $PWD:/mnt pay4later/comodo -s /mnt/eicar.com.txt
```