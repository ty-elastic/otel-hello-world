from python:3

WORKDIR /

COPY --from=otel/opentelemetry-collector /otelcol .
ADD otel-collector-config.yaml .

ADD example.py .

RUN python3 -m pip install opentelemetry-api
RUN python3 -m pip install opentelemetry-sdk
RUN python3 -m pip install opentelemetry-exporter-otlp

ADD start.sh .
RUN chmod a+x start.sh
CMD ["/bin/sh", "start.sh"]