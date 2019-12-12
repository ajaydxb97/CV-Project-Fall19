import numpy as np
import cv2


#this is the cascade we just made. Call what you want
yoyo_cascade_Haar_17 = cv2.CascadeClassifier('cascade-YoyoHaar17.xml')

#cap = cv2.VideoCapture(0)

img = cv2.imread('test22.png')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

yoyos = yoyo_cascade_Haar_17.detectMultiScale(gray, 3, 3)

print(len(yoyos))
# add this
for (x,y,w,h) in yoyos:
    #cv2.rectangle(img,(x,y),(x+w,y+h),(255,255,0),2)
    font = cv2.FONT_HERSHEY_SIMPLEX
    cv2.putText(img,'Yo-yo',(x-w,y-h), font, 0.5, (11,255,255), 2, cv2.LINE_AA)


name = "result22.png"
cv2.imwrite(name,img)
cv2.waitKey(0)
cv2.destroyAllWindows()