### Ngx-Admin Angular 14 application from akveo.com

This is modified and more lightweight version of original application to practice UI Automation with Playwright.

The original repo is here: https://github.com/akveo/ngx-admin

For the Bondar Academy practice app, the answer is a "Two-Part" Docker strategy. To properly practice, you actually use two different types of containers: one to host the app and one to run the tests.

1. The App Container (The "SUT" - System Under Test)
The practice app itself is a lightweight version of ngx-admin. While you can run it directly on your machine with npm start, in a professional CI/CD pipeline, you would wrap it in a Docker container.
Why? Because you want the app to be in a "clean room" environment.
The Goal: This container stays running on port 4200 (the default for Angular apps like this) while you test it.

2. The Test Container (The "Runner")
Instead of running npx playwright test on your Windows command prompt, you run it inside an official Microsoft Playwright Docker image (e.g., mcr.microsoft.com/playwright:v1.40.1-focal).
Why? This container comes pre-loaded with all the Linux dependencies, browsers (Chromium, Firefox, Webkit), and drivers needed to run tests perfectly.  
The Goal: It "wakes up," fires its tests at the App Container, saves a report, and then disappears.
How to set this up (The "Docker-Compose" Way)
In a real job, you wouldn't start these separately. You would use a file called docker-compose.yml to launch both at once.