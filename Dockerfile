# Base image
FROM python:3.7.2-slim

# Set environment
ENV DOCKER_HOME="/usr/app/src" \
    DOCKER_GROUP="user" \
    DOCKER_USER="user" \
    DOCKER_UID=5000

ENV DOCKER_CONFIGS="${DOCKER_HOME}/configs" \
    DOCKER_DATA="${DOCKER_HOME}/data" \
    DOCKER_LOGS="${DOCKER_HOME}/logs" \
    DOCKER_ENVS="${DOCKER_HOME}/envs"

# Create code directory
WORKDIR ${DOCKER_HOME}

# Copy and install requirements
COPY ./requirements.txt ./requirements.txt
RUN pip install --upgrade pip \
    && pip install -r ./requirements.txt

# Copy the rest of the code over
COPY . .

RUN mkdir -p \
        ${DOCKER_HOME} \
        ${DOCKER_CONFIGS} \
        ${DOCKER_DATA} \
        ${DOCKER_LOGS} \
        ${DOCKER_ENVS} \

# TODO : Somehow this causes Permission Denied while attempting to save the log. [Permission Denied 13]
# Create user and group
#RUN groupadd -g ${DOCKER_UID} ${DOCKER_GROUP} \
#    && useradd -u ${DOCKER_UID} -g ${DOCKER_GROUP} ${DOCKER_USER} \
#    && mkdir -p \
#        ${DOCKER_HOME} \
#        ${DOCKER_CONFIGS} \
#        ${DOCKER_DATA} \
#        ${DOCKER_LOGS} \
#        ${DOCKER_ENVS} \
#    && chown -R ${DOCKER_USER}:${DOCKER_GROUP} ${DOCKER_HOME}

#USER ${DOCKER_USER}
