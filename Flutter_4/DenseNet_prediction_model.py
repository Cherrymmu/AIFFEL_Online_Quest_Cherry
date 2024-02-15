# DenseNet121_prediction_model.py

# 예측에 필요한 라이브러리
import tensorflow as tf
from PIL import Image
import numpy as np
import matplotlib.pyplot as plt
from tensorflow.keras.preprocessing import image
from tensorflow.keras.applications.imagenet_utils import decode_predictions
import requests
from io import BytesIO

async def prediction_model():
    label = {0 :'Moon_jellyfish',
        1 : 'mauve_stinger_jellyfish',
        2: 'lions_mane_jellyfish',
        3: 'compass_jellyfish',
        4: 'blue_jellyfish',
        5: 'barrel_jellyfish'}
    
    response = requests.get("https://kienthuckhoahoc.org/images/kt/16/0/ly5.jpg")
    img = Image.open(BytesIO(response.content))

    model = tf.keras.models.load_model('./model-best.h5')
    
    # resize
    target_size = 224
    img = img.resize((target_size, target_size)) 

    #numpy array로 변경
    np_img = image.img_to_array(img)

    #4차원으로 변경 
    img_batch = np.expand_dims(np_img, axis=0)
    #feature normalization
    pre_processed = img_batch/255
    
    # 예측
    y_preds = model.predict(pre_processed)
    np.set_printoptions(suppress=True, precision=5) #소수 5자리까지 
    # 1위 예측 반환
    result = {"predicted_label" : str(label[np.argmax(y_preds)]), "prediction_score" : str(y_preds[0][np.argmax(y_preds)])}
    return result
