# Slacker
A Slack custom intergration that allows you to quickly check posts on  
-Stack Overflow  
-Reddit  
-New York Times  

![alt tag](http://g.recordit.co/POXxfmfd33.gif)

### Reddit
```
/reddit [subreddit]
```

### Stack Overflow
```
/stack [search params]
```

### New York Times
```
/news
```

## How to set it up locally
Create a .env file with the following pairs
```
REDDIT_USERNAME=''
REDDIT_PASSWORD='' 
REDDIT_APP_ID=''
REDDIT_APP_SECRET=''
NEW_YORK_TIMES_KEY=''
```

Run
```
bundle install
```

Run
```
ruby server.rb
```

