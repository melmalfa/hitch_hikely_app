How do I filter searches of the content?
Tags
State/country drop down
How to edit
How to delete


author: GET /mumbles?filter=true&author=kristin.eugenio@ga.co
date: GET /mumbles?filter=true&date=2015-12-24
both: GET /mumbles?filter=true&author=eugenius&date=2015-12-2





Tagging

As a user of Mumbler, I would like to be able to see a list of all the used tags, and then go to a list of mumbles with those tags.

This is a BIG one!

First of all, our data structure makes it difficult to do this simply. We should change it! Since we want a list of tags, that means we should treat tags as a new resource. The correct route to access these would be GET /tags.

We will be creating tags when we create mumbles, so we should add to our mumble creation logic something that creates a list of tags in our database. Since we don't want to have more than one entry for any given tag, it would make sense to use a Redis set.

Finally, we should add another filter for our mumble index like above:

GET /mumbles?filter=true&tag=blessed
From a user experience / design perspective, it would make sense to be able to link to the tag index from any page, and also to filter tags directly by clicking on the tags in our mumbles. This is another complex task!
