# Buildroot Mathworks Docker
Docker setup for the buildroot version mantained by MathWorks

This dockerfile builds a Docker image based on Ubuntu 16.04 with all the necessary packages to run buildroot as provided by MathWorks in https://github.com/mathworks/buildroot. The Dockerfile also downloads and installs Linaro 2017.02 for 32 and 64-bit ARM targets.

After creating a container don't forget to clone from here https://github.com/mathworks/buildroot.git and switch to the appropiate tag (e.g. mathworks_zynq_R21.2.0)
