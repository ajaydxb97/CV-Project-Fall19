import numpy as np
import cv2


#this is the cascade we just made. Call what you want
pool_cascade_Haar_17 = cv2.CascadeClassifier('haarCascade_17.xml')

#cap = cv2.VideoCapture(0)

img = cv2.imread('test24.png')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

balls = pool_cascade_Haar_17.detectMultiScale(gray, 25, 25)

# add this
print(len(balls))
for (x,y,w,h) in balls:
    #cv2.rectangle(img,(x,y),(x+w,y+h),(255,255,0),2)
    font = cv2.FONT_HERSHEY_SIMPLEX
    cv2.putText(img,'8-Ball',(x-w,y-h), font, 0.5, (11,255,255), 2, cv2.LINE_AA)

#cv2.imshow('Pool Recognition Test Result',img)
name = "result24.png"
cv2.imwrite(name,img)
cv2.waitKey(0)
cv2.destroyAllWindows()
