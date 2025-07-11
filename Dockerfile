FROM python:3.10-slim

# 1. 작업 디렉토리 설정
WORKDIR /app

# 2. requirements 먼저 복사 (캐시 효율)
COPY requirements.txt .

# 3. 의존성 설치
RUN pip install --no-cache-dir -r requirements.txt

# 4. 나머지 코드 복사
COPY . .

# 5. PYTHONPATH 명시 (import 에러 방지)
ENV PYTHONPATH=/app

# 6. 포트 노출
EXPOSE 8086

# 7. 명확한 uvicorn 실행 (경로 지정)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8086"]
