FROM condaforge/miniforge3:4.10.3-5
ENV FC_VER v1.4.0
RUN conda info
WORKDIR /
RUN apt-get -qq update && apt-get -qq -y install gcc \
    && apt-get -qq -y autoremove && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log
RUN git clone -b v${FC_VER} --depth 1 https://github.com/FederatedAI/FATE-Cloud.git \
    && cp -r /FATE-Cloud/fate-manager/fate-manager /data/projects/fate \
    && rm -rf /FATE-Cloud
RUN pip install -r /data/projects/fate/fate-manager/requirements.txt && pip cache purge
ENV PYTHONPATH /data/projects/fate/fate-manager
CMD  ["pip", "list"]
