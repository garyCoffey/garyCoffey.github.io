---
layout: post
title: "Code Platoon Alumni 50/50 Raffle"
categories: projects
---
#### Code Platoon Alumni 50/50 Raffle App

This was a really cool collaborative project. For this project, I led the tech effort to create an app to run a 50/50 raffle. The idea was to have a digital version of a 50/50 raffle with profits going to our non-profit organization.

In case you are not familiar with a 50/50 raffle, lets go over how it works. Basically people buy raffle tickets for a set period of time. Once that time is over, a random ticket is chosen. The person that purchased that ticket receives half of all the money that was contributed to the raffle, and the other half goes to the organizer of the raffle.

Now let's talk more about how we made this work...

#### App Architecture

![Lucid chart architecture of App](https://app.lucidchart.com/publicSegments/view/02cbf9d1-8230-45d9-b95d-a062bfedade5/image.png)

#### Hosting

This app is hosted on AWS. You can go [here](https://master.d2t3u4srvnanyn.amplifyapp.com/) for the production app.

#### Technologies

The technologies we used for this app were all within the AWS ecosystem. We decided to go with AWS so the app would be scalable and easy to adapt to change in the future. As the developers, we were also all interested in learning practically about AWS services.

- React for our frontend
- Stripe/Paypal for handling credit card transactions
- AWS Amplify for hosting, as well as adding the different AWS services to our app
- AWS API Gateway for our Stripe payment service
- AWS Lambdas for a variety of functions. THe main functions implemented with Lambdas are the runRaffle function and the createRaffle function
- GraphQL/DynamoDB for handling our data
- GitHub projects for managing our workflow and distribution
- LucidChart for designing our architecture
