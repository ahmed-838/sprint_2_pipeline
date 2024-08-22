const puppeteer = require('puppeteer');

describe('Basic UI Tests', () => {
  let browser;
  let page;

  beforeAll(async () => {
    browser = await puppeteer.launch();
    page = await browser.newPage();
    await page.goto('http://localhost:8080');  // تأكد إن السيرفر شغال على البورت ده
  });

  afterAll(async () => {
    await browser.close();
  });

  it('should display the correct page title', async () => {
    const title = await page.title();
    expect(title).toBe('GAZA FOR EVER');
  });

  it('should have a hero section with correct text', async () => {
    const heroText = await page.$eval('.hero-content h1', el => el.textContent);
    expect(heroText).toBe('Welcome to Our Professional Service');
  });

  it('should have three service cards', async () => {
    const cards = await page.$$eval('.card', cards => cards.length);
    expect(cards).toBe(3);
  });
});
