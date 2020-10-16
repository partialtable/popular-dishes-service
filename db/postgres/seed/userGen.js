const fs = require('fs');
const csvWriter = require('csv-write-stream');
const writer = csvWriter();
const faker = require('faker');
const dishes = require('./dishes.js');

var counter = 1;

function randomDate(start, end) {
  return new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime())).toISOString().slice(0,10);
}

var counter = 1;

const dataGen = () => {
  writer.pipe(fs.createWriteStream('userTable.csv'));
  for (let i = 0; i < 1500000; i++) {
    writer.write({
      user_id: counter++,
      name: faker.internet.userName()
      avatar_url:,
      first_name: faker.name.firstName(),
      last_name: faker.name.lastName(),
      phone: faker.phone.phoneNumber(),
      email: faker.internet.email()
    })
    console.log(`Seeded ${i} records`);
  }

  writer.end();
  console.log('userTable.csv generation complete')
}