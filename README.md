# Blog Notification App (Flutter + Firebase)

A simple **Flutter blog app** with **Firebase Cloud Messaging (FCM)** for push notifications.  
Users get notified when new blog posts are available.  

---

## **Features**

- Display blog posts (list-based UI)
- Push notifications via Firebase
- Works on **Android** (iOS support optional)
- Handles notifications in **foreground, background, and terminated states**


---

## **Setup Instructions**

### 1️⃣ Clone the project

```bash
git clone https://github.com/rojinvgeo/Blog_Notification_App.git
```
``` bash
cd blog_notification_app
```
### 2️⃣ Install dependencies
```bash
flutter pub get
```

### 3️⃣ Run App
```bash
flutter run
```

### Step 1: Get the FCM Token from your app
Run your Flutter app on a real Android device.
Make sure your code prints the FCM token:
Copy the token from your terminal/logs.
The token is unique to your device.

### Step 2: Go to Firebase Console
Open your Firebase project: https://console.firebase.google.com/.
Navigate to Cloud Messaging → Send your first message.

### Step 3: Compose the notification
Title: Example: New Blog Post
Body: Example: Check out our latest blog post now!

### Step 4: Target your device
In Target, choose “Single device”.
Paste the FCM token you copied from your app.

### Step 5: Send the notification
Click Send Test Message.
