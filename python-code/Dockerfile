# Using basic python image form docker hub
FROM python:3.8.2
# Copy all the code to app folder
COPY . /app/
# Use app folder as working directory from now on
WORKDIR /app
# Install the python libraries that this API needs
RUN pip install -r requirements.txt
# Expose Flask port
EXPOSE 5000
# Labels
LABEL maintainer="grupo-2" \
    description="Flask application" \
    version="0.1"
# To enter to the container console
ENTRYPOINT [ "/bin/bash" ]
# To run the DB migrations and run the Flask server 
CMD ["-x", "run.sh"]
# Arguments for built-time 
ARG USER \
    PASSWORD \
    DB_HOST \
    DB_NAME 
# Assign environment variables to ARGS
ENV USER=$USER \
    PASSWORD=$PASSWORD \
    DB_NAME=$DB_NAME \
    DB_HOST=$DB_HOST