# PartialTable

Back End System design of a full stack Popular dishes recommendation service

## Related Projects
  - https://github.com/partialtable/photos-carousel-service
  - https://github.com/partialtable/bookings-service
  - https://github.com/partialtable/popular-dishes-service
  - https://github.com/partialtable/reviews-service

## Table of Contents

1. [Usage](#Usage)
1. [Requirements](#requirements)
1. [Development](#development)

## Usage

### Server API

#### Get restaurant's popular dishes info
- GET
```sh
/api/restaurants/:restaurantId/dishes/
```
##### Path Parameters:
```sh
- id : restaurant id
```
##### Success Status Code: 200
##### Return: JSON
```sh
{
  "dishes": [
   {
     "id": 9,
     "dish_name": "Chicken Pot Pie",
     "ingredients": "mashed potatoes, broccolini, mint jelly",
     "picture": "https://dishestkout.s3-us-west-1.amazonaws.com/13.jpeg",
     "reviews": [
       {
         "review_id": 5,
         "dish_id": 9,
         "user_id": 49,
         "user_avatar": "url_address",
         "stars": 5,
         "dined_on": "November 17, 2019",
         "review": "Love the ambiance, service, lighting, food (of course, fried chicken was superb) and Dimitri manages to always greet his guests as if they were family, which is so rare in this town",
         "user_status": 0
       }
     ]
   },
   {...}
  ]
}
```
#### Add a review's of popular dish
- POST
```sh
/api/restaurants/:restaurantId/dishes/:dishId/reviews
```
##### Success Status Code: 201
##### Request Body: Expects JSON with the following keys.
```sh
{
  user_id: 8,
  review_id: 6,
  username: "OpenTableDiner",
  stars: 4,
  dined_on: "November 19, 2020",
  review: "Love the ambiance, service, lighting, food (of course, fried chicken was superb) and Dimitri manages to always greet his guests as if they were family, which is so rare in this town"
}
```

#### Update a review's of popular dish
- PATCH
```sh
/api/restaurants/:restaurantId/dishes/:dishId/reviews/:reviewId
```
##### Path Parameters:
```sh
- id : reviews id
```
##### Success Status Code: 204
##### Request Body: Expects JSON with the following keys (include only keys to be updated)
```sh
{
  user_id: 8,
  review_id: 6,
  username: "OpenTableDiner",
  stars: 5,
  review: "Like this restaurant."
}
```

#### Delete a review's of popular dish
- DELETE
```sh
/api/restaurants/:restaurantId/dishes/:dishId/reviews/:reviewId
```
##### Path Parameters:
```sh
- id : reviews id
```
##### Success Status Code: 204

### Data modeling
![Data modelling](/data_model.png)
<!-- Format: ![Alt Text](url) -->

## Requirements

An `nvmrc` file is included if using [nvm](https://github.com/creationix/nvm).

- Node 6.13.0
- etc

## Development

### Installing Dependencies

From within the root directory:

```sh
npm install -g webpack
npm install
```

