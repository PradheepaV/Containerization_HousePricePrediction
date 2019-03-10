FROM python:2.7-onbuild
ADD ./house_price_predictor.py /
ADD house_price_predictor_api.py /
ADD reg_model.pkl /
ADD __init__.py /
EXPOSE 5200
CMD [ "python", "house_price_predictor_api.py" ]