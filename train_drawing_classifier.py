#!/usr/bin/env python

import os
import json
import requests
import numpy as np
import turicreate as tc

# THE CATEGORIES WE WANT TO BE ABLE TO DISTINGUISH
categories = [
'apple', 'banana', 'bread', 'broccoli', 'cake', 'carrot', 'coffee cup',
'cookie', 'donut', 'grapes', 'hot dog', 'ice cream', 'lollipop',
'mushroom', 'peanut', 'pear', 'pineapple', 'pizza', 'potato',
'sandwich', 'steak', 'strawberry', 'watermelon'
]

# CONFIGURE AS REQUIRED
this_directory = os.path.dirname(os.path.realpath(__file__))
quickdraw_directory = this_directory + '/quickdraw'
bitmap_directory = quickdraw_directory + '/bitmap'
bitmap_sframe_path = quickdraw_directory + '/bitmaps.sframe'
output_model_filename = this_directory + '/DrawingClassifierModel'
training_samples = 10000

# MAKE SOME FOLDERS TO PUT TRAINING DATA IN
def make_directory(path):
    try:
        os.makedirs(path)
    except OSError:
        if not os.path.isdir(path):
            raise Exception("No such path")

make_directory(quickdraw_directory)
make_directory(bitmap_directory)

# FETCH SOME DATA (BITMAPS)
bitmap_url = (
    'https://storage.googleapis.com/quickdraw_dataset/full/numpy_bitmap'
)

total_categories = len(categories)

for index, category in enumerate(categories):
    bitmap_filename = '/' + category + '.npy'

    with open(bitmap_directory + bitmap_filename, 'wb') as bitmap_file:
        bitmap_response = requests.get(bitmap_url + bitmap_filename)
        bitmap_file.write(bitmap_response.content)

        print('Download %s drawings (category %d/%d)' % (category, index + 1,
        total_categories))

random_state = np.random.RandomState(100)

# FUNCTION TO MAKE SFrames from the images
def get_bitmap_sframe():
    labels, drawings = [], []
    for category in categories:
        data = np.load(
            bitmap_directory + '/' + category + '.npy',
            allow_pickle=True
        )
        random_state.shuffle(data)
        sampled_data = data[:training_samples]
        transformed_data = sampled_data.reshape (
            sampled_data.shape[0], 28, 28, 1
        )

        for pixel_data in transformed_data:
            image = tc.Image(_image_data=np.invert(pixel_data).tobytes(),
                _width=pixel_data.shape[1],
                _height=pixel_data.shape[0],
                _channels=pixel_data.shape[2],
                _format_enum=2,
                _image_data_size=pixel_data.size)
            drawings.append(image)
            labels.append(category)
        print('...%s bitmaps complete' % category)

    print('%d bitmaps with %d labels' % (len(drawings), len(labels)))
    return tc.SFrame({'drawing': drawings, 'label': labels})

#SAVE intermediate bitmap SFrame to file
bitmap_sframe = get_bitmap_sframe()
bitmap_sframe.save(bitmap_sframe_path)
bitmap_sframe.explore()

#Training the drawing DrawingClassifier
bitmap_model = tc.drawing_classifier.create(
    bitmap_sframe, 'label', max_iterations=1000
)

#Export it to CoreML _format
bitmap_model.export_coreml(output_model_filename + '.mlmodel')
#if you want different drawings check http://bit.ly/31evaaq
