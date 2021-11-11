# NLP-Sentiment Analysis: Distinguish positive, negative statements
**End-to-End implementation of NLP project**

# Project Overview: 
A simple NLP project to classify tweets based on sentiment. Dataset is acquired from Kaggle and the project uses various python libraries such as **pandas, NumPy, nltk** to handle the data, **sklearn** for model building. Created an API using **Flask** and containerized the app using **Docker**

# Brief walkthrough:
  1. Data Preprocessing - Using LabelEncoder() to convert categorical values into 0,1
  2. Data Cleaning 
      a. Remove patterns, usernames, etc.
      b. Remove punctuation, special characters, numbers
  3. Tokenize the tweets: 
        > df.cleaned_tweet.apply(lambda x:x.split())
  4. Perform stemming on the words - convert to lower case, normalizing words
      >from nltk.stem.porter import PorterStemmer
      >
      >stemmer = PorterStemmer()
      >
      >tokenized_tweet = tokenized_tweet.apply(lambda x:[stemmer.stem(i) for i in x])
  5. Join the tokenized data into a single sentence
  6. Feature Engineering
       -  Count Vectorizer - gives count of a particular word in the dataset - int
       - Tfidf Vectorizer - gives probability of occurrence of a word in the dataset - float - Normalised version of data
   7. Perform 10-fold cross_validation on all Classification models to find the best model
   8. Do hyper parameter tuning for the model with best score

# Steps to run docker:
  Docker is a container that is used to package everything that is part of the project like libraries, configurations. So when the project can work properly when it is moved to a different system. Docker helps in environment standardization. So we can just build it once and deploy it everywhere. It makes the application portable. 

**Step 1: Create a Dockerfile**
  >FROM python:3.8-slim-buster
  >
  >RUN pip install --upgrade pip
  >
  >WORKDIR /app
  >
  >COPY . /app
  >
  >RUN pip3 install -r requirements.txt
  >
  >EXPOSE 4000
  >
  >ENTRYPOINT  ["python"]
  >
  >CMD ["app.py"]

**Step 2: Build the Docker image**
  >docker build -t sentiment_api . 

**Step 3: Run the docker**
  >docker run -p 8000:8000 sentiment_api
