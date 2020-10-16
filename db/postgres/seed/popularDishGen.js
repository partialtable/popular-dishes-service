const fs = require('fs');
const csvWriter = require('csv-write-stream');
const writer = csvWriter();
const faker = require('faker');
const dishes = require('./dishes.js');

var counter = 1;

const dataGen = () => {

  writer.pipe(fs.createWriteStream('popularDishTable.csv'));
  for (let i = 0; i < 1500000; i++) {
    const randromNumFor50Food = Math.floor(Math.random() * 50);
    writer.write({
      dish_name: dishes.dishNames[randromNumFor50Food],
      ingredients dishes.dishIngr[randromNumFor50Food],
      picture: `https://dishestkout.s3-us-west-1.amazonaws.com/${randromNumFor50Food + 1}.jpeg`
    })
    console.log(`Seeded ${i} records`);
  }

  writer.end();
  console.log('popularDishTable.csv generation complete')
}