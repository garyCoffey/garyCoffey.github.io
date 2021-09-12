---
layout: post
title: 'Building Your Portfolio on Github Pages'
description: 'We will be walking through how to develop your own portfolio website using the Jekyll framework.'
github_name: 'portfolio_example'
categories: blogs
---
### Language

This site was built using [Jekyll](https://jekyllrb.com/).

### Description

In this tutorial, I will walk you through how to build a work portfolio website. With this site, you will be able to post all of your personal/group projects in an interesting format for prospective employers. I am targeting this portfolio towards beginners. I will show you how to showcase some of the smaller algorithms that you have completed and are proud of.

I realize that coming fresh out of a bootcamp or being self taught, you may not have a wide variety of solo projects and that's okay. I am sure you will grow your collection in the future. For now, lets get something on the board to show employers.

### File Structure

Once you are complete, you will have a file structure similar to the below. Feel free to customize it in a way that is right for you!

```tree
.
├── 404.html
├── Gemfile
├── Gemfile.lock
├── _config.yml
├── _includes
│   ├── external_scripts.html
│   └── navbar.html
├── _layouts
│   ├── default.html
│   ├── page.html
│   ├── post.html
│   └── posts.html
├── _posts
│   └── projects
│       └── 2020-06-01-some-title.md
├── _site
│   ├── 404.html
│   ├── about
│   │   └── index.html
│   ├── assets
│   │   ├── css
│   │   │   └── style.css
│   │   └── images
│   │       ├── bkg.png
│   │       ├── blacktocat.png
│   │       └── bullet.png
│   ├── feed.xml
│   ├── index.html
│   ├── posts
│   │   └── projects
│   │       └── some-title.html
│   └── projects
│       └── index.html
├── assets
│   └── css
│       └── style.scss
├── pages
   ├── about.md
   ├── home.md
   └── projects.md

```

Let's get started. You will need to get your repo setup following the steps [here](https://pages.github.com/). After cloning your GitHub page repo, cd into it (it should be empty) and run the following commands:

```bash
gem install jekyll;
jekyll new ./;
bundle exec jekyll serve;
```

At this point, you should have the boilerplate site up and running. You should be able to get visit `localhost:4000` and see something running.

All Done!

![SpongeBob rubbing his hands like job complete.](https://media.giphy.com/media/26u4lOMA8JKSnL9Uk/giphy.gif)

Just Kidding....

We have the site up and going but we still have a lot of customization to do.

Let's start out by setting our app up for hosting on GitHub Pages. To do this lets go over to the *Gemfile* in our directory. There are already some instructions in here so let's follow them:

```gemfile
# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
# gem "github-pages", group: :jekyll_plugins
# If you have any plugins, put them here!
```

In my case, `bundle update github-pages` didn't quite work. I followed the other instructions and then did the following:

```shell
gem install github-pages;
bundle install;
bundle update;
```

Now let's change our theme.
> **Quick note**
Each theme has a built in [layout](https://jekyllrb.com/docs/layouts/) for a set number of types of pages. The out of the box theme is minima and it comes with layouts for home, page, and post. You can checkout the code for minima [here](https://github.com/DirtyF/jekyll-theme-minima).

You might be wondering to yourself, what is a [layout](https://jekyllrb.com/docs/layouts/)? A [layout](https://jekyllrb.com/docs/layouts/) is a way of standardizing your site. Say that you want every post to have the title at the top of every post page. One way of doing this is manually place the title on every post page. But what if you forget? What if you make some H3's and some H2's? Even if you are able to keep the standardization, it would be a lot of work.

That's the purpose for a [layout](https://jekyllrb.com/docs/layouts/). Instead of doing the work manually on every post page, define a post [layout](https://jekyllrb.com/docs/layouts/) and place this code there. Now every new post that you list as [layout](https://jekyllrb.com/docs/layouts/) type post will display the title as it is coded in the post [layout](https://jekyllrb.com/docs/layouts/). Pretty cool right?

![Cartman from South Park saying "That's pretty cool"](https://media.giphy.com/media/26tP7cDNJUZQy7w3u/giphy.gif)

Ok now for our part, we are going to be using a very basic them called hacker. It is basic in the sense that it does not have any predefined layouts. We will have to build those.

> **Quick Note**
 You are welcome to use other themes than Hacker for your page. This tutorial will be using that theme but I'm sure you can still make another one work. Before you get too far with one however, you better make sure it is [supported by Github pages](https://pages.github.com/themes/) (assuming that is where you are hosting at). An easy way to explore other themes is to go to to [rubygems.org](https://rubygems.org) and [search for jekyll-themes](https://rubygems.org/search?utf8=%E2%9C%93&query=jekyll-theme).

Okay now that all of that is out of the way lets get our theme updated. Let's open back up our *Gemfile*.

![Pic of Gemfile](/images/gemfile.png)

Okay this will be pretty easy. All we have to do is copy the gem name/version from the [gem page](https://rubygems.org/gems/jekyll-theme-hacker).

![Pic hacker theme gem copy button](/images/hacker_theme_copy.png)

Now let's replace minima in our *Gemfile* with that copy.

And then lets open up the *_config.yml* file in our directory. There should also be a section in here that defines the theme. Let's update that as well.

![Pic of config theme](/images/config_theme.png)

It would be great to see what everything looks like, but you might find things to be temporarily broken. The issue goes back to layouts. The Minima theme defined a layout for *home*, *page*, and *post*. That matters because those layouts are referred to in a few places. You can see it at the top of the *index.markdown* file for example. Our new theme does not have those layouts..... So we will have to build some ourselves.

Let's add a new folder named *_layouts* at the root. I have linked the [Jekyll docs for layouts](https://jekyllrb.com/docs/layouts/) a few times above. If you haven't done so yet, please take a minute to browse through them.

Glad to have you back. Ok now let's add a file in the new *_layouts* folder named *default.html*. Inside of that folder, lets paste in the following html code:

```html
  <html lang="{{ site.lang | default: "en-US" }}">
    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">

      <link rel="stylesheet" href="{{ "/assets/css/style.css?v=" | append: site.github.build_revision | relative_url }}">
      <!--[if lt IE 9]>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
      <![endif]-->
    </head>
    <body>
      <div class="wrapper"></div>
        <section>
          {'{ content }'}
        </section>
      </div>
    </body>
  </html>
```

> Quick note: Anywhere you see {'{}'} just know that it should not have the quotes when you use it in your code. I was having some issue with Jekyll kicking into evaluation mode so remember to remove the '' in your code.

The code above doesn't have a lot of special things going on just yet. I would like to point out the use of {`{content}`}. That is actually a key Jekyll word that is used to display your actual content. You can read about other keywords available in the [Jekyll docs for variables](https://jekyllrb.com/docs/variables/). We can look at the  *default.html* as a wrapper since it will encase every other bit of your code. Whatever we put in this file later will appear on every page of your site. This will be a useful place for a *navbar* as well as your *contact* info in the footer. We will get to that later though.

Ok now lets go ahead and add another *layout*. in the *_layouts* folder, add a new file named *page.html*. We will use this *layout* for each page of your site. In the *page.html* copy and paste the following:

```html
---
layout: default
---
<h2>{{page.title}}</h2>

{'{ content }'}

```

Okay there is a little bit going on here so lets see what's happening.

- The first bit, is something called Front Matter. You can take a deep dive in the [Jekyll docs for Front Matter here](https://jekyllrb.com/docs/front-matter/) if you like. Basically, Front matter is used to first inherit from other *layouts* as done here. But it can also be used to place variables that you want to use in your file.

- The next part starts out as a standard html h2 tag. But then we have `{page.title}`. In MarkDown/html files in Jekyll, anything between {`{}`} is evaluated as code. Whatever that code evaluates to is what is actually displayed on a page. In this example, we are using the global Jekyll variable of `page` which stands in for whatever current page you are on. We then call `.title` which will reach into the Front Matter of your page and look to display the value for the variable of `title`.

- The last thing we have here is {`{ content }`} which we have previously discussed during the setup of the *default.html layout*.

Ok now we are getting really close to being able to fire our app back up.

Next, let's add a new folder at the root directory named *pages*. We will use this folder to keep all of our sites pages organized. Inside the new *pages* folder let's add a new file named `home.md`. Inside of that file copy and paste the following:

```md
---
layout: page
title: 'Home'
permalink: '/'
---

## Hello World!
```

Again, let's talk about what is going on here.

- The first part is once again Front Matter. You can see that we are using the *page layout* here (which is already inheriting from *default*).

- We then have a variable in the Front Matter named *title*. If you remember when we setup the *page.html* layout we had an h2 which reached into the page and displayed the title with `{{page.title}}`. This is where that layout code will look for a title to be at.

- The last section in the Front Matter is a *permalink*. This is another thing you can read about in the [Jekyll docs for variables](https://jekyllrb.com/docs/variables/). Basically, defining a permalink will help you control what URL is display on when a use is on this page. In this case, we are setting this as the landing page for our site.

- The last item here is real simple. It is text that will be displayed on the screen. This file is a markdown file which is like a cooler version of html. You can still write in raw html, but you can also use regular text and different shorthands. Please visit the [Markdown Cheat Sheet here](https://www.markdownguide.org/cheat-sheet/) to take a deep dive!

> Fun fact: Most of what you are reading now is being rendered from a markdown file!

Last thing before firing up our app. Lets do a little cleanup and delete the `index.markdown` page since our new `home.md` page takes its place.

Ok Finally!

![Beetle Juice saying "Its Showtime!"](https://media.giphy.com/media/13HdQUsXSa6QYU/giphy.gif)

Run the following command:

```shell
bundle exec jekyll serve
```

And lets see how it looks!

![Pic of current home page](/images/initial_home.png)

Nothing too special yet, but it is a start. Also notice how the title we defined in the `home.md` Front Matter is being displayed as an h2 due to how we setup the *layout*. Pretty cool so far!

Ok before we start adding more pages, let's go ahead and add a navbar to be able to get around our site without having to manually type in urls.

Start by adding a new folder at the root level named *_includes*. The *_includes* folder is another example of Jekyll magic that will allow us to keep our code neatly divided instead of having to shove too many things into one html file. You can read more about the *_includes* folder in the [Jekyll docs for includes](https://jekyllrb.com/docs/includes/).

Inside of our new *_includes* folder, add a file name *navbar.html*. Inside of that file, copy and paste the following code:

```html
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: rgb(57, 58, 59);">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <ul class="navbar-nav mt-2 mt-lg-0">
      <li class="nav-item">
        <a class="nav-link" href="/">
          Home
        </a>
      </li>
      {'% for page in include.pages %'}
        {'% if page.title != nil and page.title != 'Home' and page.title != 'About' %'}
          <li class="nav-item">
            <a class="nav-link" href="{'{ page.url }'}">
              {'{ page.title }'}
            </a>
          </li>
        {'% endif %'}
      {'% endfor%'}
      <li class="nav-item">
        <a class="nav-link" href="/about">
          About
        </a>
      </li>
    </ul>
  </div>
</nav>
```

> Quick Note. Once again here I had to hack around the evaluation of code. notice the quotes between { and %. In your code remove those!

 We will have to add this into our *default.html* layout in order to have it show up on our page. We will place it there because we want the navbar to be available everywhere on our site. The navbar above also relies on some Bootstrap so we will need to do some additional setup for it to work.

- In *default.html* above the *{'content'}* line copy and paste `{'% include navbar.html pages=site.pages %'}` (without the quote marks).

- While we are in the *default.html* layout, let's also add the bootstrap stylesheet. Right after the last `<meta>` tag, copy and paste the following:

 ```html
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
 ```

 > Quick Note. Order matters here. If you place this after your theme styling, your theme styling will be overwritten by bootstrap. That why we want this link to be right after the last meta tag. So it is easy for use to overwrite any unwanted styling that may come from this.

- Now lets create another file in the *_includes* folder named *external_scripts.html*. In that file copy and paste the following:

```html
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
```

- Next, let's make sure our site is using that new file back in the *default.html* layout. Inside of there, right above the `</body>` tag, paste `{'% include external_scripts.html %'}` without the quotes.

Okay it works! Mostly... If you restart your server now, you might notice that we are getting some styling from our theme that doesn't look right for our navbar. We will have to go in and remove that real quick. So let's add a new folder named *assets* at the root level. Inside of that folder add another folder named *css*. Inside of that folder, add a file named *style.scss*. Inside of that file, copy and paste the following without the quotes:

```scss
---
---
@import "{`{ site.theme }`}";

.navbar ul li  {
  list-style-image: none;
}
```

Okay now we are done setting up our navbar and our site has improved a little bit.

We completed a lot of tasks though so we should probably talk a little about what we did. For example, you might be wondering about this piece of code we used `{'% include navbar.html pages=site.pages %'}`. This is similar to the include statement we used previously, but in this one we have `pages=site.pages`. What this is doing is passing down a variable into the *navbar.html* page. Without this variable, we wouldn't have the necessary data needed to build our navbar.

You can see that variables use here `for page in include.pages`. This is [Liquid syntax](https://shopify.github.io/liquid/) for iterating over an array. In Jekyll, we are free to use the Liquid syntax in our html files be just encasing the code in `{'%%'}` (without the quotes). This is a very powerful feature which will make things easier for us. By passing in the pages array, we will never have to visit the navbar code again. Now, any new file with Front Matter declaring the layout to be a page, it will automatically be added to the navbar.

You can also see in our navbar code that we filter out the *Home* page and the *About* page from being auto-generated to the navbar. This is because typically these pages appear first and last on the navbar respectively and the auto-generated pages will be in alphabetical order.

Okay I think that explains most of the new items in the instructions (especially if you took some time to look over the [Liquid documentation](https://shopify.github.io/liquid/)). So let's continue with our sites development.

Ok next let's setup our *posts.html* layout. This will be the document that defines how all of your posts pages will look. You can think of a posts page like an index page.

- First, add a new file to the *_layouts* folder named *posts.html*.

- Inside of the *posts.html file, copy an paste the following (without the quotes blocking code evaluation):

```html
---
layout: page
---

<h4>Description</h4>
{'{ page.description }'}
{'{content}'}
<hr/>

{'% assign category = page.dir | replace: '/', '' %'}
<ul>
  {'% for post in site.categories[category] %'}
    <li>
      <a href="{'{ post.url }'}">
        {'{ post.title }'}
      </a>
    </li>
  {'% endfor%'}
</ul>

```

Instead of trying to describe what's going on in the above html, I would encourage you to later add `{'%page%'}` somewhere in the above. do the same with `{'%site.categories'%}`. I think by doing that and referring to the [Liquid documentation](https://shopify.github.io/liquid/) you will have a good chance of piecing it together 😃.

- Next let's add a new page in the *pages* folder named *projects.md*.

- Inside of the *projects.md* page, paste the following code:

```md
---
layout: posts
title: 'Projects'
permalink: '/projects/'
description: Add the description that describes the categories of posts that will appear on this page!
---
```

So what is going on in the above? What we are doing is just setting the Front Matter. Some of these variables are referred to in the *posts.html* layout file such as *title* and *description*. The *permalink* variable allows us to control the URL of the page. Now when we click the *Projects* tab of the navbar, the URL will be `site_url/projects` which will look a little cleaner.

While we are on the subject of URL displays, let's go on over the *_config.yml* file in the root directory and add some code real quick. Somewhere in the file, add the folloing:

```yml
defaults:
  -
    scope:
      type: "posts"
    values:
      permalink: /:collection/:categories/:title
```

The code above will help set the default URL for everything that goes into the *_posts* folder. Without this code, Jekyll will set the URL as the full date, then the title. That doesn't look too great so we will use the above to override that. I would encourage you to later delete the above temporarily, just to see what it would have looked like.

Let's now add a new project post, so we can see how it will display on our posts page.

- In the *_posts* folder located at the root directory, add a new subfolder named *projects*.

- In the *projects* folder add a new file named *yyyy-mm-dd-some-title.md*.

- In that new file add the following:

```md
---
layout: post
title: "project title"
github_name: "repo_name"
categories: projects
---

A new page!!!!!
```

Okay now if we restart our server and go back to our *Projects* tab, we should see something come up!

>Quick Note. The title of your file must have the date in the above format to show up. If the date is not present, Jekyll will ignore it. You can also make a *_drafts* folder, place files without a date, and run `bundle exec jekyll serve --drafts` to see a dev look at the post you are working on. Read more about that [here in the Jekyll Docs](https://jekyllrb.com/docs/posts/#drafts).

Okay cool. So now we have what could be equated to an index type of page and we have something showing up, but we still need to define the format for the show type of page. The default format as you can see by clicking on the new page isn't the greatest.

- In the *_layouts* folder, add a new file named *posts.html*.

- Inside the new *post.html* file, copy and paste the following code (removing all of the quote marks):

```html
---
layout: default
---
<div class='header'>
  <h2>{'{ page.title }'}</h2>
  {'% if page.description %'}
    <p class='description'>{'{ page.description }'}</p>
  {'% endif %'}
  <p>{'{ page.date | date: '%B %d, %Y' }'}<p>
</div>
<hr/>

<div>
  {'% if page.github_name %'}
    <h4>Code on Github</h4>
    <a href="{'{ site.data.social-media['github'].href }'}{'{ site.data.social-media['github'].id }'}/{'{page.github_name}'}" title="{'{ site.data.social-media['github'].title }'}">Link to code</i></a>
  {'% endif %'}
  {'{content}'}
</div>
```

Okay now if we go back to the new project file we added before we should see that the styling has changed to match the above code. Also, if you open that file back up and paste a valid repo name of your own, you should be able to click on that link and go to that repo.

One last cleanup item, right now we have an *About* page that is hanging out in the root directory. For consistency, let's drag and drop that into the *pages* folder.

![Danny Devito from Always Sunny saying 'I think our work is done!'](https://media.giphy.com/media/bg1MQ6IUVoVOM/giphy.gif)

There is a lot of things you can do to improve your new portfolio site. You can change any of the styling you are not happy with. You can add new categories of *_posts*. I would encourage you to take what we just completed and really make it your own. Add/change things to something you like. But also, focus on adding content. Spend some time creating some cool projects to add to your site. Eventually, you will want to have about 3-6 really good projects on display here.

If you had any issues getting to this point, please follow the link at the top to a GitHub repo that has this code ready to be forked. Also, feel free to look around this site for inspiration about ways to spice up the site we just created.

Thanks for following the tutorial and I hope it helps!
