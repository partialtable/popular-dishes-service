const fs = require('fs');
const csvWriter = require('csv-write-stream');
const writer = csvWriter();
const faker = require('faker');
const dishes = require('./dishes.js');

var counter = 1;

function randomDate(start, end) {
  return new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime())).toISOString().slice(0,10);
}

const randomBool = () => {
  const num = Math.floor(Math.random() * 10);
  return num % 2 === 0
    ? true
    : false;
}

const dataGen = () => {
  writer.pipe(fs.createWriteStream('dishReviewTable.csv'));
  for (let i = 0; i < 1500000; i++) {
    const fakeDate = randomDate(new Date(1970, 0, 1), new Date(2020, 0, 1))

    writer.write({
      review_id: counter++,
      dish_id: counter++,
      user_id: (1 + Math.floor(Math.random() * 9999)),
      review: faker.lorem.paragraph(),
      dined_on: fakeDate,
      stars: (Math.random() * 5).toFixed(2),,
      user_status: randomBool().toString()
    })
    console.log(`Seeded ${i} records`);
  }

  writer.end();
  console.log('dishReviewTable.csv generation complete')
}