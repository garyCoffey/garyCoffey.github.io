---
layout: post
title: "Code Platoon Alumni App"
categories: projects
description: A site where ALumni of Code Platoon can look for jobs.
img: /images/alumni-app/landing.png
alt: landing page of alumni app
---

#### Technologies

This site uses a lot of AWS services including: Cognito, Amplify, DynamoDB, Lambda, and S3 in additona to React. THe MVP of the site is to have 3 separate cognito groups: Admin, Alumni, and employers. Depending on the group a user is in, they have access to different pages and tools.
As an admin, you can see an admin tab where you can upload a csv of Alumni data. That upload goes to S3, which triggers a lambda to create a cognito user, add them to the Alumni group, call linkeIn to get data and use it in addition to csv data to create their Alumni profile.

As an Alumni, you can log in and edit some of the profile (not fields retireved by linkedIn as they would be overwritten). You can set your profile to public (private by default), and indicate if you are open to work. 

The employer group functions are still being thought about. THe core plan though is to give them the ability to create jobs and build filters to connect employers to alumni as well as vice versa.

Some of the feautres I have built in this site is the initial alumniProfile schema/page as well as a cron job lambda to update the linkedIn fields of the alumniProfile. I do plan to help build out more functionality in the future and will write a follow up project at that time. Since this project belongs to Code Platoon, I will  unfortunatley not be able to share the code, but here is the [landing page](https://main.dvs6rmc805qp3.amplifyapp.com/). Also the site will only really be open to admin/employers/alumni so there isn't much access beyond the landing page. This is a really neat project though, and I will share some screenshots below.

Docs are using mkdocs: 

![Docs Page](/images/alumni-app/docs.png)

Admin Page: 

![Admin Page](/images/alumni-app/admin.png)

Alumni Page: 

![Alumni Page](/images/alumni-app/alumni.png)

Profile Page: 

![Profile Page](/images/alumni-app/profile.png)
