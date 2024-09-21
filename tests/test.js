const request = require('supertest');
const express = require('express');
const path = require('path');

// Mock express app
const app = require('../app'); // Assuming your server code is in a file named `app.js`

describe('Express Server Tests', () => {
  it('should serve the homepage with status 200', async () => {
    const response = await request(app).get('/');
    expect(response.statusCode).toBe(200);
    expect(response.text).toContain('Welcome to Our Professional Service');
  });

  it('should serve static CSS files', async () => {
    const response = await request(app).get('/styles.css');
    expect(response.statusCode).toBe(200);
    expect(response.headers['content-type']).toContain('text/css');
  });

  it('should return 404 for unknown routes', async () => {
    const response = await request(app).get('/unknown');
    expect(response.statusCode).toBe(404);
  });
});
