# GCCP OCR

A flutter OCR mobile application that stores images in a cloud storage bucket and captures the text using a cloud function

## App Architecture
![WhatsApp Image 2023-01-09 at 12 45 49](https://user-images.githubusercontent.com/57103479/211257134-d869f65d-5835-4368-862b-bb35f2191b3c.jpg)



## App Flow

1. The user is prompted to capture a photo from which they wish to extract the text 
![WhatsApp Image 2023-01-09 at 12 25 52](https://user-images.githubusercontent.com/57103479/211254717-95be8ce8-dc7a-49d7-b853-6a3269192184.jpg)


2. The upload button stores the image in a cloud storage bucket 
![WhatsApp Image 2023-01-09 at 12 25 51](https://user-images.githubusercontent.com/57103479/211254972-f4839cb4-3ff9-4878-91eb-0dc9ec4a77f4.jpg)


3. The stored image is passed through a cloud function that extracts the text from that image
![image](https://user-images.githubusercontent.com/57103479/211249705-b7f4dedb-4df4-467e-8683-50b48626ddae.png)


4. The cloud function store the extracted text in a seperate bucket 
![Screenshot 2023-01-09 114032](https://user-images.githubusercontent.com/57103479/211249920-c3312431-88f2-433c-84d8-33a0ccca7076.png)

