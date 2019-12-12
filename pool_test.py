import numpy as np
import cv2

#face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
#eye_cascade = cv2.CascadeClassifier('haarcascade_eye.xml')

#this is the cascade we just made. Call what you want
pool_cascade_LBP_12 = cv2.CascadeClassifier('cascade-PoolLBP12.xml')

#cap = cv2.VideoCapture(0)

img = cv2.imread('test14.png')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
#faces = face_cascade.detectMultiScale(gray, 1.3, 5)

# add this
# image, reject levels level weights.
balls = pool_cascade_LBP_12.detectMultiScale(gray, 200, 200)

# add this
for (x,y,w,h) in balls:
    #cv2.rectangle(img,(x,y),(x+w,y+h),(255,255,0),2)
    font = cv2.FONT_HERSHEY_SIMPLEX
    cv2.putText(img,'8-Ball',(x-w,y-h), font, 0.5, (11,255,255), 1, cv2.LINE_AA)

#cv2.imshow('Pool Recognition Test Result',img)
name = "result14-3.png"
cv2.imwrite(name,img)
cv2.waitKey(0)
cv2.destroyAllWindows()
'''k = cv2.waitKey(30) & 0xff
if k == 27:
    break'''

#cap.release()
#cv2.destroyAllWindows()