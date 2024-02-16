# server_fastapi_jellyfish_DenseNet.py
import uvicorn   # pip install uvicorn 
from fastapi import FastAPI   # pip install fastapi 
from fastapi.middleware.cors import CORSMiddleware # 추가된부분 cors 문제 해결을 위한

# 예측 모듈 가져오기
import InceptionV3_prediction_model

# Create the FastAPI application
app = FastAPI()

# cors 이슈
origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# A simple example of a GET request
@app.get("/")
async def read_root():
    print("url was requested")
    return "피부문제를 확인해보자."

@app.get('/sample')
async def sample_prediction():
    result = await InceptionV3_prediction_model.prediction_model()
    print("prediction was requested and done")
    return result


# Run the server
if __name__ == "__main__":
    uvicorn.run("server_fastapi_skin_InceptionV3:app",
                reload=True,   # 코드 변경시 서버를 자동으로 다시로드합니다.
                host="127.0.0.1",   # 로컬호스트에서 실행합니다.
                port=5000,   # 5000번 포트에서 실행합니다.
                log_level="info"   # 로그 레벨을 info로 설정합니다.
                )