#FROM tensorflow/serving:latest
FROM tensorflow/serving:1.12.3

# DEFAULT MODEL
#RUN mkdir -p /models/default/

RUN mkdir -p /models/half_plus_two

WORKDIR /tensorflow_serving/servables/tensorflow/testdata/saved_model_half_plus_two_cpu/

#ADD ./ /models/default/

ADD ./ /models/half_plus_two

EXPOSE 8051

RUN apt-get update && apt-get install -y curl

CMD curl -d '{"instances": [1.0, 2.0, 5.0]}' -X POST http://localhost:8501/v1/models/half_plus_two:predict


