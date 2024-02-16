# 예측에 필요한 라이브러리
import tensorflow as tf
from PIL import Image
import numpy as np
import matplotlib.pyplot as plt
from tensorflow.keras.preprocessing import image
from tensorflow.keras.applications.imagenet_utils import decode_predictions
import requests
from io import BytesIO
from tensorflow.keras.applications import InceptionV3

async def prediction_model():
    label = {
    'Actinic keratosis': 'Actinic keratosis: 광선 각화증',
    'Atopic Dermatitis': 'Atopic Dermatitis: 아토피성 피부염',
    'Benign keratosis': 'Benign keratosis: 양성 각화증',
    'Dermatofibroma': 'Dermatofibroma: 피부섬유종',
    'Melanocytic nevus': 'Melanocytic nevus: 멜라닌 세포 모반',
    'Melanoma': 'Melanoma: 흑색종',
    'Squamous cell carcinoma': 'Squamous cell carcinoma: 편평 세포 암종',
    'Tinea Ringworm Candidiasis': 'Tinea Ringworm Candidiasis: 백선 백선 칸디다증',
    'Vascular lesion': 'Vascular lesion: 혈관 병변'
    }
    
    response = requests.get("https://ioncosmetic.com/wp-content/uploads/2022/12/%EC%95%84%ED%86%A0%ED%94%BC-%ED%94%BC%EB%B6%80%EC%97%BC-%EC%9B%90%EC%9D%B8-%EC%A6%9D%EC%83%81-%EC%B9%98%EB%A3%8C-%EA%B4%80%EB%A6%AC.jpg")
    img = Image.open(BytesIO(response.content))

    # InceptionV3 모델 로드
    model = InceptionV3(weights='imagenet', include_top=True)
    
    # resize
    target_size = 299  # InceptionV3의 입력 이미지 크기는 (299, 299)입니다.
    img = img.resize((target_size, target_size)) 

    # numpy array로 변경
    np_img = image.img_to_array(img)

    # 4차원으로 변경 
    img_batch = np.expand_dims(np_img, axis=0)

    # feature normalization
    pre_processed = tf.keras.applications.inception_v3.preprocess_input(img_batch)
    
    # 예측
    y_preds = model.predict(pre_processed)
    
    # 예측 결과 디코딩
    decoded_predictions = decode_predictions(y_preds, top=1)[0]
    
    # 예측 결과 반환
    result = {"predicted_label": decoded_predictions[0][1], "prediction_score": str(decoded_predictions[0][2])}
    
    return result
