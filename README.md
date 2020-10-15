# PartialTable

Back End System design of a full stack popular dishes recommendation service

## Related Projects
  - https://github.com/partialtable/photos-carousel-service
  - https://github.com/partialtable/bookings-service
  - https://github.com/partialtable/reviews-service

## Table of Contents

1. [CRUD/API Usage](#Usage)
1. [Requirements](#requirements)
1. [Development](#development)

## CRUD/API Usage

### Server API

### Get all the popular dishes of a restaurant
 * GET `/api/restaurants/:restaurantId/dishes/ `

**Path Parameters:**

 * `id` restaurant id

**Success Status Code:** `200`

**Return:** JSON
```json
[
   {
     "dish_id": 9,
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
```

### Add a popular dish
 * POST `/api/restaurants/:restaurantId/dishes`

**Path Parameters:**
  * `id` restaurant id

**Success Status Code**: `201`

**Request Body**: Expects JSON with the following keys.
```json
{
  "restaurant_id": 1,
  "dish_name": "pizza",
  "ingredients": "mashed potatoes, broccolini, mint jelly",
  "picture": "https://dishestkout.s3-us-west-1.amazonaws.com/13.jpeg",
}
```

### Update a popular dish info
 * PATCH `/api/restaurants/:restaurantId/dishes/:dishId`

**Path Parameters:**
  * `id` restaurant id
  * `dishId` dish id

**Success Status Code**: `204`
**Request Body**: Expects JSON with the following keys (include only keys to be updated)
```json
{
  "restaurant_id": 1,
  "dish_name": "Jacket potato",
  "ingredients": "roasted potatoes, broccolini, bacon, mushrooms"
}
```

### Delete a popular dish
 * DELETE `/api/restaurants/:restaurantId/dishes/:dishId`

**Path Parameters**:
  * `id` restaurant id
  * `dishid` dish id

**Success Status Code**: `204`

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

