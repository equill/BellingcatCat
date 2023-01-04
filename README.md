# BellingcatCat


## What

An application built on [Restagraph](https://github.com/equill/restagraph), to explore what it can bring to OSINT.

There are already a couple of OSINT tools with very well-polished GUIs. However, they have a few shortcomings that the Restagraph platform can address.


## Installation

It's designed as a Docker application, for ease of deployment.

Note that deployment and configuration start getting painful as you add authentication, because I designed the engine to scale up to handle lots of sites. The cost is that an authenticated one-off site is not straightforward to deploy.


## Additional Information

```
This section includes any additional information that you want to mention about the tool, including:
- Potential next steps for the tool (i.e. what you would implement if you had more time)
- Any limitations of the current implementation of the tool
- Motivation for design/architecture decisions
```

It's important to be aware that almost all the work for this product is actually done on [Restagraph](https://github.com/equill/restagraph), which is the engine. The GUI is [webcat-gui](https://github.com/equill/webcat-gui) (until I come up with a better one), so again any work on it happens in that repository. You'll only see relatively small changes in this one, as I modify the schema, and update the versions of `Restagraph`, `webcat-gui` and the other applications on which this is built. So if you don't see much happening here, it doesn't mean work isn't being done for it.


### Limitations

- The GUI
    - If it looks like it was made by a guy with a long career in IT infrastructure and no graphic-design background, there's a reason for that.
    - If somebody wants to provide a better GUI, I would be delighted to have the help.
- Access controls
    - This is what I'm working most heavily on at the moment.
    - Options available right now are fully open (anybody can do anything), write-authenticated (only logged-in users can add, change or delete things), or authenticated-only (login or bust).
        - The authenticated part is a work-in-progress. Do *not* trust it until I've tested it and confirmed it looks secure, and then preferably after you've done your own testing.
    - More finely-grained controls are on the roadmap; it's mainly a question of priorities.


### What's behind the design decisions

Restagraph actually fell out of my work on [Syscat](https://www.sysc.at/), the System Catalogue, whose purpose is to keep track of everything in an IT infrastructure environment. It's strongly influenced by years of experience as a system administrator and network engineer, and providing technical support for internet-facing infrastructure in billion-dollar environments. Also from learning from the missteps of other software teams. It's described in more detail in both the Syscat and Restagraph projects, but the important parts here are:

- Graph database
    - Because a relational database just can't provide the flexibility, without grinding to a halt.
- API-first design
    - Automated tooling is incredibly valuable. If you can do it via the GUI, you should always be able to do it via the API.
    - I have too much experience with products where the API was bolted on as an afterthought. Building tools on top of that is a horrible experience.
    - It frees people to build the GUI they want or need, rather than being stuck with what the vendor provides.
- Consistent, predictable API
    - Again, it just makes life easier when you know where things will be, and how to interact with them.
- User-extensibility
    - The vendor is never able to anticipate everything you need to describe, and sometimes one customer's needs conflict with another's. If you can add the things you need, you can fill those gaps (and then tell the vendor, so they can decide whether to include it in the product).
    - It's designed specifically so your own additions are a first-class part of how the product works. Again, not bolted onto the side and requiring hacky workarounds.
