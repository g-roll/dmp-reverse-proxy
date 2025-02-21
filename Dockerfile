FROM python:3-alpine
WORKDIR /app
COPY verify.py .
CMD ["python", "verify.py"] 