'use strict';
const { promises: { readFile } } = require('fs')

class Handler {
  constructor({ rekoSvc }) {
    this.rekoSvc = rekoSvc
  }
  async detectImageLabels(buffer) {
    const result = await this.rekoSvc.detectLabels({
      Image: {
        Bytes: buffer
      }
    }).promise()

    console.log({ result })
  }

  async main(event) {
    try {
      const imgBuffer = await readFile('./images/tiger.jpg');
      this.detectImageLabels(imgBuffer);

      return {
        statusCode: 200,
        body: 'Hello!'
      }
    } catch (error) {
      console.log('Error: ', error.stack)
      return {
        statusCode: 500,
        body: 'Internal server error!'
      }
    }
  }
};

// factory
const aws = require('aws-sdk');
const reko = new aws.Rekognition();

const handler = new Handler({
  rekoSvc: reko
});

module.exports.main = handler.main.bind(handler);
