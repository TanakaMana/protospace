== README
protospace
====
Overview
TanakaMana / protospace - Tool that can post - introduce the original application to simple.

# Database

## users  

**association**  
- has_many prototypes  
- has_many comments  

|column  |type   |
|:---|:---|
|id  |integer  |
|name  |string |
|image|text|
|email|string|
|password|string|
|member|string|
|profile|text|
|work|string|

## prototypes  

**association**  
- has_many prototype_thumbnails  
- has_many comments  
- has_many likes  
- belongs_to user  


|column  |type  |
|:-------|:-------|
|id|integer|
|user_id|references|
|title|string|
|catchcopy|string|
|concept|text|

## prototype_thumbnails  

**association**  
- belongs_to prototype  


|column  |type  |
|:-------|:-------|
|id|integer|
|prototype_id|references|
|image|text|
|state|integer|

## comments  

**association**  
- belongs_to user  
- belongs_to prototype  


|column  |type  |
|:-------|:-------|
|id|integer|
|user_id|references|
|prototype_id|references|
|content|text|

## likes  

**association**  
- belongs_to user  
- belongs_to prototype  

|column  |type  |
|:-------|:-------|
|id|integer|
|user_id|references|
|prototype_id|references|