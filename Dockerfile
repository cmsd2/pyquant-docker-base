# syntax=docker/dockerfile:1

# Source OS Build
FROM ubuntu

# Install required software
#
# TZDATA
# Python3
# SciPy; NumPy; Pandas; PyFinance; TensorFlow;
# PyBrain; PyMC3; PyQuant; PyTorch; PyAlgoTrade;
# QuantLib; PySwarms

# Update system
RUN apt update

# Install lsb-release
RUN apt install -y --no-install-recommends lsb-release

# Install tzdata
# Need a custom config for Pacific/Auckland TZ
RUN apt -y install tzdata

# Install python3
# Investigate if existing Python installed and 
# consider an authscript to remove it completely
RUN apt -y install python3

# Install pip3
# Reminder: Pip can run as `pip` or `pip3`
RUN apt -y install python3-pip

# Verify Pip3 version
RUN pip --version

# Install deps
RUN pip install scipy \
  numpy \
  pandas \
  pyfinance \
  tensorflow \
  pybrain \
  pymc3 \
  pyquant \
  torch \
  pyalgotrade \
  quantlib \
  pyswarms

# Run application
CMD ["/bin/bash"]
