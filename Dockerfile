FROM python:3.7

RUN pip install virtualenv
ENV VIRTUAL_ENV=/venv
RUN virtualenv venv -p python3
ENV PATH="VIRTUAL_ENV/bin:$PATH"

WORKDIR /app
ADD . /app

# Install dependencies
RUN cd env && pip install -r requirements.txt

# Expose port 
EXPOSE 5000

# Run the application:
ENTRYPOINT [ "python" ]
CMD [ "deploy/app.py" ]