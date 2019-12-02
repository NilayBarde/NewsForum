## Meta:
#### Who was on your team?
 - Nilay Barde
 - Hao Yuan
 - Chen Gu
 - Jiahao Song 

#### What’s the URL of your deployed app?
* newsbee.bardenilay.com
* newsbee.chen1221.com


#### What’s the URL of your github repository with the code for your deployed app?
* https://github.com/NilayBarde/NewsForum

#### Is your app deployed and working?
* Yes.

#### For each team member, what work did that person do on the project?
* **Nilay**:  
- Initial Concept & Setup
- User Login & Register
- Live updates for new comments
- SPA implementation with Redux and React-Router
- Bootstrap Addition
- Various Fixes

* **Hao**:
- Topics creation and deletion
- Postgres Database Setup to store user information 
- Connecting topics to one or more pieces of news
- Live updates for new topics
- Various Fixes

* **Chen**:
- API Key Management
- Rendering API Request Results
- News Image Display
- Optimize news-content filter
- Various Fixes

* **Jiahao**:
- API Request with HTTPoison
- CSS style for News display
- Ensure server to server API access
- Naming & Presentation Setup
- Various Fixes

## App:

#### What does your project 2 app do?
* NewsBee is a web application for individuals to read news along with peer commentators. All users have associated passwords and can log in and out of our app. Users can create topics for their interested news and share opinions with other users by posting comments. The news list is retrieved from the News API using HTTPoison to perform purely server to server API requests. From this list, the users can browse live top and breaking headlines for the USA, specific category in a country, single source, or multiple sources. In the future version, they can also choose to view top-news in different countries and apply different filters. All users, comments, and topics are stored in a PostgreSQL database. All edits to the comments and topics are live and happen in real-time.  Besides, users do not have to leave the page while viewing the list of topics and comments. It does not create a new API request with each page load. New API requests are created only when a user chooses to refresh the page and search for new articles.
 One of the most significant challenges that we encountered during the creation of our app was determining how certain variables were going to be accessed by certain actions. For example, originally our design had set the "comments" as a field of "topic", rather than as an independent schema. Sometimes, we needed to completely change our framework design from the ground-up because SPA and non-SPA designs were used simultaneously and caused a lot of inconsistency while merging. We solved it at last.

#### How do users interact with your application? What can they accomplish by doing so?
* Users can click on the "register" button on the navigation bar for a new account. Once they've registered or they already have an account, they can log in from the index page. After users successfully login, they can browse news and click on the news title to go to the source page. They can also open up a topic on news by clicking "create this topic" button and leave their thoughts. Other users could join this topic and leave comments.

#### For each project requirement above, how does your app meet that requirement?
* Our app is deployed to newsbee.chen1221.com && newsbee.bardenilay.com
Our application has user accounts, and support local password authentication (implemented securely).
Users' emails and passwords are stored in a Postgres database, along with some other non-trivial persistent state.
Our application uses an external API that requires authentication, in this case, we use an API key.
API access is server <-> server.

#### What’s the complex part of your app? How did you design that component and why?
* The complex part is to build our app as a Single Page Application. We use Redux and React-Router because Redux is a predictable state container for JavaScript apps. It helps us write applications that behave consistently, run in different environments (client, server, and native), and are easy to test. It works fine with React-Router which does routing job. We give attributions to Professor's homework 7 notes and guides because they helped us a lot. The news API request creation and rendering was also a complex part of our app. At first, our browser Javascript code makes requests directly to the remote API, not to the server. We spent hours to fix this issue and rewrite the whole API-fetch process in elixir code in server and make sure the access is server <-> server.

#### What additional features did you implement?
* Use Phoenix Channels to push realtime updates to users, triggered either by live data from the external API or actions by other users.
Build our app almost entirely as a Single Page Application with Redux and React-Router.

#### What interesting stuff does your app include beyond the project requirements?
* Our news-data retrieved from API could lead users to the source websites where the news is published.

#### What was the most significant challenge you encountered and how did you solve it?
* The integration part was the most significant challenge because we were unsure about how to implement SPA from the beginning so that both SPA and non-SPA design are implemented. It causes some level of inconsistency while merging our branches. We eventually choose to translate most of the non-SPA designs to SPA.
