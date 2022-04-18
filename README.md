# Buildroot Mathworks Docker
Docker setup for the buildroot version mantained by MathWorks

This dockerfile builds a Docker image based on Ubuntu 16.04 with all the necessary packages to run buildroot as provided by MathWorks in https://github.com/mathworks/buildroot. The Dockerfile also downloads and installs Linaro 2017.02 for 32 and 64-bit ARM targets.

Build the container from the Dockerfile by running:
```sudo docker build -t <image_tag> - < <path_to_dockerfile>```

For example ```sudo docker build -t br1604 - < ./Dockerfile```

Then create and start a container and execute bash on it by running
```sudo docker run -it --name <container_name> <image_tag> bash```

For example
```sudo docker run -it --name br br1604 bash```


After creating a container don't forget to clone from here https://github.com/mathworks/buildroot.git and switch to the appropiate tag (e.g. mathworks_zynq_R21.2.0)
