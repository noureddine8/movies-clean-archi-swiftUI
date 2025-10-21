# 🎬 OMDb API Integration Guide

This project uses the **OMDb API** (Open Movie Database) to fetch movie data.  
Follow the steps below to set up your API key and configure it in the project.

---

## 🔑 Step 1: Get Your OMDb API Key

1. Go to [https://www.omdbapi.com/apikey.aspx](https://www.omdbapi.com/apikey.aspx)
2. Choose a plan
3. Enter your email and request an API key
4. Once received, copy your API key

---

## 🧾 Step 2: Create `Secrets.swift`

In your Xcode project:

1. Go to the **project root folder**/movie-search-clean-archi-swiftUI
2. Create a new Swift file named **`Secrets.swift`**
3. Add the following code:

```swift
enum Secrets {
    static let omdbAPIKey = "YOUR_API_KEY"
}
