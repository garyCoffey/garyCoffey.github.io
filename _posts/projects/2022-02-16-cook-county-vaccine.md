---
layout: post
title: "Cook County Vaccine"
description: A site used by cook county to help prioritze people for receiving the vaccine when in short supply
categories: projects
img: /images/cook-county-vaccine/landing.png
alt: landing page for Cook COunty Vaccine website
---

#### Cook County Vaccine Site

You can [visit the site](https://vaccine.cookcountyil.gov/).

We built the core of this site in ~2 weeks and soon after that it was handling ~1 million requests per day. This site was built when the Covid vaccine was in short supply and people were placed in priority groups in order to receive the vaccine. I have revisted work on this site periodically to help with new features such as a digital health card, but after the inital push, regular maintenance has been handled by the main contractor. My Wife, a friend from Code Platoon, and I though built out the original core features that are still used today.
 
##### Technologies

This site uses a lot of AWS services including: Amplify, DynamoDB, Lambda, and S3 in additona to React.

<div style="width: 640px; height: 480px; margin: 10px; position: relative;"><iframe allowfullscreen frameborder="0" style="width:640px; height:480px" src="https://lucid.app/documents/embeddedchart/0842e8c8-dccb-40d4-badd-580f0292ff91" id=".udUrqasIDrT"></iframe></div>

One of the cool things about this site is the fact that we were able to build in a way to handle a massive traffic load for when it first laucnhed. You can see from the Cloudwatch metrics below that we were handling 15M requests in a day at one point. It felt really cool to have built something that was so needed by the community at the time and for it to be as successful as it was. I won't share much about the actual code since it is still in use, but the parts I worked on were cypress staging tests for the site, the original backend schemas, priority logic for getting the vaccine, andI helped with an external csv tool for migrating some data. 

Metrics:

![Metrics](/images/cook-county-vaccine/metrics.png)

Docs using GH wiki:

![Docs](/images/cook-county-vaccine/docs.png)