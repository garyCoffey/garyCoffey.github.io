---
layout: post
title: "Code Platoon Alumni 50/50 Raffle"
categories: projects
description: Core feature was a 50/50 raffle idea. Now a dead project due to insurance/gambling laws.
img: /images/alumni-association.png
alt: landing page of alumni association
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


This app was written pretty cool. It has a lambda that runs on a cron job to run the raffle. That core piece can't really be seen now since it won't have any open raffles. The killer of this project was that it turned out a 50/50 raffle was going to be an issue for insurance/legal/gambling law reasons so we never got cleared to go to prod with it. Fortunately though, this project opened the door for the alumni social app discussed in another post. We also took what we learned from this project to a cook county vaccine site, so I would not consider this a failed experience. Below is the code thought that would have ran weekly to pick a raffle winner:

```javascript
/* Amplify Params - DO NOT EDIT
	API_GRAPHQL_GRAPHQLAPIENDPOINTOUTPUT
	API_GRAPHQL_GRAPHQLAPIIDOUTPUT
	API_GRAPHQL_GRAPHQLAPIKEYOUTPUT
	API_GRAPHQL_LOTTERYPOOLTABLE_ARN
	API_GRAPHQL_LOTTERYPOOLTABLE_NAME
	API_GRAPHQL_PARTICIPANTTABLE_ARN
	API_GRAPHQL_PARTICIPANTTABLE_NAME
	API_GRAPHQL_TICKETTABLE_ARN
	API_GRAPHQL_TICKETTABLE_NAME
	API_GRAPHQL_TRANSACTIONTABLE_ARN
	API_GRAPHQL_TRANSACTIONTABLE_NAME
	API_GRAPHQL_WINNERTABLE_ARN
	API_GRAPHQL_WINNERTABLE_NAME
	ENV
	REGION
Amplify Params - DO NOT EDIT */

const axios = require('axios');
const graphql = require('graphql');
const { print } = graphql;
const query = require('./query');
const rand = require('random-seed').create();

// uncomment below for local testing for env variables
require('dotenv').config();

const callGraphQL = async (query, input) => {
	const graphqlData = await axios({
		url: process.env.API_GRAPHQL_GRAPHQLAPIENDPOINTOUTPUT,
		method: 'post',
		headers: {
			'x-api-key': process.env.API_GRAPHQL_GRAPHQLAPIKEYOUTPUT
		},
		data: {
			query: print(query),
			variables: input
		}
	});
	const body = {
		graphqlData: graphqlData.data.data,
		errors: graphqlData.data.errors
	};
	return body;
}

const checkForError = (body) => {
	if (body.errors) {
		throw body.errors;
	}
}

exports.handler = async (event) => {
	try {
		let response;
		const currentLotteryPoolBody = await callGraphQL(query.lotteryPoolByStatus, null);
		checkForError(currentLotteryPoolBody);

		if (currentLotteryPoolBody.graphqlData.lotteryPoolByStatus.items.length === 0) {
			response = {
				statusCode: 400,
				body: JSON.stringify('No lotteryPool with OPEN status')
			}
		} else {
			const lotteryPoolId = currentLotteryPoolBody.graphqlData.lotteryPoolByStatus.items[0].id;
			const tickets = currentLotteryPoolBody.graphqlData.lotteryPoolByStatus.items[0].tickets.items;
			let transactions = await callGraphQL(query.transactionsByLotteryPoolByAmount, { lotteryPoolID: lotteryPoolId });
			checkForError(transactions);
			transactions = transactions.graphqlData.transactionsByLotteryPoolByAmount.items;
			let finalPotAmount = 0;
			if (transactions.length > 0) {
				transactions.forEach((transaction) => {
					finalPotAmount += parseInt(transaction.amount);
				});
			}
			
			const updateLotteryPoolInput =  {
				id: lotteryPoolId,
				finalPotAmount: finalPotAmount,
				status: 'CLOSED'
			};
			const updateLotteryPoolBody = await callGraphQL(query.updateLotteryPool, { input: updateLotteryPoolInput });
			checkForError(updateLotteryPoolBody);
			
			let createWinnerBody;
			if (tickets.length > 0) {
				let ticketPool = [];
				tickets.forEach((ticket) => {
					ticketPool.push(...Array(ticket.weight).fill(ticket.id));
				});
				const winningTicket = ticketPool[rand(ticketPool.length)];
				console.log('winningTicketID: ', winningTicket);
				const createWinnerInput =  {
					lotteryPoolID: lotteryPoolId,
					ticketID: winningTicket,
					amount: (finalPotAmount / 2).toString()
				};
				createWinnerBody = await callGraphQL(query.createWinner, { input: createWinnerInput });
				checkForError(createWinnerBody);
			}

			response = {
				statusCode: 200,
				body: JSON.stringify({
					updateLotteryPoolBody: updateLotteryPoolBody.graphqlData,
					createWinnerBody: createWinnerBody ? createWinnerBody.graphqlData : 'No winner created'
				}),
			};
		}
		console.log(response.body);
		return response;

	} catch (err) {
		console.log('error posting to appsync: ', err);
		return {
			statusCode: 500,
			body: JSON.stringify(err)
		}
	}
}
```
