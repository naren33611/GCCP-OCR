# GCCP OCR

A flutter OCR mobile application that stores images in a cloud storage bucket and captures the text using a cloud function

## Cloud Services Flow
![flow](https://user-images.githubusercontent.com/57103479/211250751-ec1ac142-fe57-4dc6-a5ec-1c3f717c5ee2.jpg)

## App Flow

1. The user is prompted to capture a photo from which they wish to extract the text 
![WhatsApp Image 2023-01-09 at 11 15 02](https://user-images.githubusercontent.com/57103479/211249219-88238474-5a82-45fb-ade4-7d1a07d6319b.jpg)

2. The upload button stores the image in a cloud storage bucket 
![WhatsApp Image 2023-01-09 at 11 15 03](https://user-images.githubusercontent.com/57103479/211249232-465c7b9b-b393-45f2-9f75-e6c4dc19678a.jpg)

3. The stored image is passed through a cloud function that extracts the text from that image
![image](https://user-images.githubusercontent.com/57103479/211249705-b7f4dedb-4df4-467e-8683-50b48626ddae.png)


4. The cloud function store the extracted text in a seperate bucket 
![Screenshot 2023-01-09 114032](https://user-images.githubusercontent.com/57103479/211249920-c3312431-88f2-433c-84d8-33a0ccca7076.png)

