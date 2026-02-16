#let horizontalrule = v(0.5em) + line(length: 100%, stroke: 0.5pt) + v(0.5em)

#let template(
  title: "THE DAILY DIGEST",
  subtitle: none,
  authors: (),
  date: none,
  body,
) = {
  // Set the document's metadata.
  set document(title: title, author: authors)

  // Configure the page.
  set page(
    paper: "us-letter",
    margin: (x: 1.5cm, y: 1.5cm),
    header: locate(loc => {
      if loc.page() > 1 {
        set text(font: "Georgia", size: 8pt)
        grid(
          columns: (1fr, 1fr),
          [#title],
          align(right)[#date --- Page #counter(page).display()]
        )
        v(0.2cm)
        line(length: 100%, stroke: 0.5pt)
      }
    })
  )

  // Title section for the first page
  align(center)[
    #v(0.2cm)
    #block(text(font: "Iowan Old Style", weight: "black", size: 48pt, tracking: 1pt)[#title])
    #v(-0.6cm)
    #line(length: 100%, stroke: 0.8pt)
    #v(-0.4cm)
    #grid(
      columns: (1fr, 1fr, 1fr),
      align(left)[#text(font: "Georgia", weight: "bold", size: 10pt)[#date]],
      align(center)[#text(font: "Georgia", style: "italic", size: 10pt)[#subtitle]],
      align(right)[#text(font: "Georgia", weight: "bold", size: 10pt)[ESTABLISHED 2026]]
    )
    #v(-0.4cm)
    #line(length: 100%, stroke: 2.5pt)
    #v(1.0cm)
  ]

  // Body configuration
  set text(font: "Georgia", size: 10.5pt, leading: 0.65em)
  set par(justify: true, first-line-indent: 1.5em)

  // Headlines
  show heading.where(level: 1): it => {
    set text(font: "Times New Roman", weight: "bold", size: 22pt)
    set par(first-line-indent: 0pt)
    block(it.body)
    v(0.3cm)
  }
  
  show heading.where(level: 2): it => {
    set text(font: "Times New Roman", weight: "bold", size: 14pt)
    set par(first-line-indent: 0pt)
    block(it.body)
    v(0.2cm)
  }

  // Handle images to be responsive
  show image: it => {
    block(it, width: 100%)
  }

  // Multi-column for the body
  columns(2, gutter: 20pt)[
    #body
  ]
}

#show: template.with(
  title: [My Daily Digest],
  subtitle: [All the news that fits in Markdown],
  date: [2026-02-15],
)

= A.I. is Here, and I Am So Doggone Tired
<a.i.-is-here-and-i-am-so-doggone-tired>
#emph[By bennussbaum | Feb 13, 2026]

= A.I. is Here, and I Am So Doggone Tired
<a.i.-is-here-and-i-am-so-doggone-tired-1>
== Some thoughts regarding Isaiah’s perspective on life’s relentless pace, limitations in a productivity & A.I. obsessed world, and the God-given beauty of being tired as a sled dog.
<some-thoughts-regarding-isaiahs-perspective-on-lifes-relentless-pace-limitations-in-a-productivity-a.i.-obsessed-world-and-the-god-given-beauty-of-being-tired-as-a-sled-dog.>
#strong[Feb 13, 2026]

#strong[Likes:] 0

#link("https://substackcdn.com/image/fetch/$s_!iklt!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F735d74b5-396f-49d7-bfa8-7e973f6ba0a8_1000x583.jpeg")[#box(width: 1000.0pt, image("substack2markdown_repo/assets/images/bennussbaum/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2F735d74b5-396f-49d7-bfa8-7e973f6ba0a8_1000x583.jpeg"));]

\_\*\*painting is "Under the Spell of Denali" by Veryl Goodnight\_

Years ago, I was on a work trip in the Bahamas watching a documentary about sled dogs \(I bet you didn’t think that’s how a piece about A.I. and tiredness would start). This little story itself could be a sermon analogy, and probably has been somewhere already. In any case, the documentary closed with one of the sled dog mushers reflecting on the relentless pace of pushing sled dogs to their absolute limits. It struck me as so profound that I wrote it down in my journal back in 2019:

#emph["Pushing the dogs harder is really a matter of life or death. And so I prefer to move at the speed of natural limitations."]

"Moving at the speed of natural limitations" is not exactly good marketing language for our modern moment here on planet earth. Perhaps I’m not alone, but it seems to me that "the A.I. discourse" has accelerated rapidly in recent weeks; in case you missed it, Anthropic raised \$30 billion dollars to build a limitless coding bloke named Claude \(#link("https://www.newyorker.com/magazine/2026/02/16/what-is-claude-anthropic-doesnt-know-either")[whose intentions Anthropic isn’t even really certain of];). Natural, human limitations are often tested, stretched, and re-understood at the historical hinge points of technological innovation \(Permanent Equity’s Brent Beshore has had a couple good pieces on these topics recently #link("https://www.linkedin.com/pulse/ais-amplification-rising-floor-widening-gap-brent-beshore-knhac")[here];). But I’m certainly not the first person to tell you this: Artificial Intelligence is obliterating any previously-held understanding we may have had of what it means for human beings to have "natural limitations." The speed of technological development has created a pace that would put the esteemed Iditarod dogs to shame.

Today, I’m tired of reading A.I. pieces; I’m also just tired, generally. I’ve been trying my darndest for 31 years to test the boundaries of my own natural limitations, and increasingly so, have been finding that it is indeed a matter of life and death. My Dad used to tell me, "Ben - you live life at a relentless pace." My childhood was marked by a perpetual quest to figure out how many things I could fit into the single span of one day. My adulthood is marked by a new version of that same quest — be as productive as you possibly can \(as a worker, as a husband, as a dad, as a friend, as a churchman, as a neighbor, and so on). As such, technology offers me a perpetual invitation to supercharge my ability to become somewhat limitless in my lifelong pursuit of relentless efficiency, activity, and ambition. My recent ChatGPT queries could probably give you an idea of what I’m getting at \("hey chat — help me schedule out the next 6 weeks of my life, hour by hour").

\_ #strong[Mush. Mush.];\_ On I go, #link("https://www.nytimes.com/2020/09/23/sports/sled-dogs-mushing-unknowns-planning.html")[like an Alaskan sled dog];. Onto the next idea, the next task, the next group text I need to respond to. I know I’m not alone. My life is a series of thousands of little messages and red bubbles demanding I trudge forward on the snowy trail of day-to-day productivity; perhaps that sounds familiar. There isn’t time to slow down, and a little box made of steel, silica, titanium, and durable glass that we can hold in the palm of our hand is telling us, "actually, I think you could go even faster." The average American receives 61 text messages a day. That statistic alone proves how relentless our modern pace is. Imagine telling one of your great-grandparents that they’d have to respond to 61 letters per day. Yet the stakes are much higher now; from your bedroom, you can write state-of-the-art code that could run a small country’s banking system and used to earn a Google Engineer \$300K a year.

I’m so…doggone tired. Technology has given us all a taste of the infinite and, if you’re like me, you’ve found that you just can’t handle it \(being infinite, and all). You can read about global tragedies, but you can’t do anything to stop them. You can "have conversations" with millions of friends, but never hear their voice. You can access all the libraries of the world, but never change. You’re finite. You have natural limitations. And so, life \(which is already a wearisome journey) has you extra tired these days — Claude, the iPhone, Open AI, your Amazon app, an Oculus headset and others are all making you believe in your limitlessness. So why is it that, when you get home from work, you just want to take a doggone nap?

"There has to be a theology of tiredness", I thought to myself as I left the office this evening. I pontificated such a thought out of necessity. See, I often try to live like #link("https://www.youtube.com/watch?v=NCx5Ph7EAxg")[Jared Vennett from The Big Short] \("I’ve already been here for 6 hours…I worked out, ate two poached eggs, and played Blackjack with Harry Dean Stanton"); I want to be everywhere, doing everything, with everyone. Technology gives me the tools to nearly fulfill my wish-dream.

Recently though, I’m just tired. Plain old tired. Tired of shoveling snow. Tired of being behind on A.I. developments. Tired of looking at the number of emails in my Outlook inbox climb steadily by the hour. Tired of picking up my 18-month old’s food \(this is also a privilege, but I’m tired nonetheless). Tired of trying to map my life out. Tired of not having all the answers. Tired of being tired.

The goal of my writing here isn’t to glorify being tired \(please don’t comment, "it’s OK, Ben! Me too!"). Instead, I want to ponder for a moment what being as tired as a doggone sled dog can teach us about being children of God. I suppose that thinking about Artificial Intelligence recently \(and how behind I am in adopting it; I just used ChatGPT for the first time last June) has actually been God’s grace to me. Trying to wrap my mind around the various headlines, articles, and podcasts proclaiming its abilities have been "the wave that has thrown me against the Rock of Ages" \(Spurgeon) this week. To be tired, I’ve realized, is such a wonderful gift. Whether you are tired of bluelight screens, trying to cram everything into a shared calendar, or just the way the world seems to be going, tiredness means your finite life is quite near to colliding with the life of the Infinite.

The Scriptures don’t give us a whole lot of prescriptive wisdom when it comes to our interactions with technology, but they do offer refuge for the pilgrim who is tired of technology’s ways \(among other things):

#emph["Come to me, all who labor and are heavy laden, and I will give you rest. Take my yoke upon you, and learn from me, for I am gentle and lowly in heart, and you will find rest for your souls. For my yoke is easy, and my burden is light"] \(Matthew 11).

#emph["You have put more joy in my heart than they have when their grain and wine abound. In peace I will both lie down and sleep; for you alone, O Lord, make me dwell in safety"] \(Psalm 4).

#emph["The Lord is the everlasting God, the Creator of the ends of the earth. He does not faint or grow weary; his understanding is unsearchable. He gives power to the faint, and to him who has no might he increases strength. Even youths shall faint and be weary, and young men shall fall exhausted; but they who wait for the Lord shall renew their strength; they shall mount up with wings like eagles; they shall run and not be weary; they shall walk and not faint"] \(Isaiah 40).

There will be much more discourse in the coming months on what Claude is building. Many word counts will be spilled on what Sam Altman will do next. But I suppose, as I sit here tired in my condo on the West Side, I am grateful to God that I am #emph[tired] tonight. It seems as though the prophet Isaiah was able to harness the profound wisdom of the Alaskan sled dogs as well: we fall exhausted \(even the young men — which, at 31, I don’t really see myself as anymore), and to be exhausted reminds us who we really are.

Waiting on the Lord is the thing that renews my strength. Coming upon the easy yoke of Jesus is the thing that lightens my burden. The joy that God can put in my heart is the thing that causes me to lie down, sleep, and dwell in safety. I have sampled the infinite and found that I don’t have the taste for it, so I trust in the One who #emph[is] indeed Infinite and get ready to shut my eyes tonight; all finite and sleepy.

I say all this, not to simply jump in a bunker, turn a blind eye to what’s happening, and ride out the A.I. storm with my head in the sand. I say all this to remind us that "our God is from of old", and that He "knows our frame". He can bind the chains of the Pleiades and loose the cords of Orion \(Job 38), but is gracious enough to "remember that we are dust".

In other words, God knows when the ’ol sled dogs need a doggone break.

And so, He mushes on — while we, His tired but beloved sled dogs — hit the hay for the night. As C.S. Lewis put it, "be comforted in your smallness, small one. He lays no merit on you."

#emph[“With shortness of breath \
You explained the infinite \
How rare and beautiful it is to even exist]

#emph[I couldn’t help but ask for you to say it all again \
I tried to write it down, but I could never find a pen \
I’d give anything to hear you say it one more time \
That the universe was made just to be seen by my eyes” \(#link("https://open.spotify.com/track/3tJjZMHLqhD8DaGgdBICnc?si=baba8b9343a449fb")[Saturn];, Sleeping At Last)]

\_ #strong[Keep going.];\_

#horizontalrule

= Pick a License, Not Any License
<pick-a-license-not-any-license>
#emph[By blog | Feb 15, 2026]

= Pick a License, Not Any License
<pick-a-license-not-any-license-1>
== Why you should care about data science software licenses and how to learn more
<why-you-should-care-about-data-science-software-licenses-and-how-to-learn-more>
#strong[Feb 15, 2026]

#strong[Likes:] 0

#emph[#strong[#link("https://www.nagraj.net/")[VP \(Pete) Nagraj];] is a long time friend, colleague, and collaborator, and is the author of this post. Pete and I have co-authored over a dozen publications, and have taught several graduate courses in data science together. Pete leads the health security analytics / infectious disease modeling and forecasting group at #link("https://www.signaturescience.com/what-we-do/health-security/infectious-disease/")[Signature Science];, where we worked together for several years. He is also currently a Ph.D.~candidate at the #link("https://datascience.virginia.edu/people/vp-nagraj")[UVA School of Data Science];.]

#horizontalrule

In the data science world, "free," "open," and "available online" often get used interchangeably. Whether we’re writing quick scripts, sharing notebooks, building packages, distributing trained models, or even designing whole programming languages, we’re constantly making choices about what stays open and what gets restricted. In practice, those decisions usually come down to something deceptively simple: the software license. But as both users and developers of data science tools, how often do we actually stop to consider the licenses that come with them?

Think about this:

+ When you find a new piece of software to use, what is the first thing you look for?

+ When you’re writing your own tool, what is the first thing you include in the code repository?

The answer to either question probably isn’t the license. At best, data scientists tend to consider reviewing or selecting a license as a dry, procedural step and slide into a "pick a license, any license" mindset. Worse? Maybe they overlook licenses altogether.

Choosing a license is the moment when we define the boundaries of access to the data science tools we create. It may not always be up to you as an individual to decide how those tools are licensed. But you can still understand the role licenses play and, most importantly, respect the boundaries others have set.

This post attempts to encourage that mindset. It starts with a brief look at licensing practices among data science package maintainers in the wild, touches on recent changes to the Anaconda terms of use, and ends with a few resources for digging deeper.

Before going further, the usual disclaimer: I am not a lawyer, and nothing here should be taken as legal advice. I’m also absolutely not suggesting that something "free" lacks value or that paid software is inherently better.

What follows is intended as an origin, not a destination. Read more. Learn more. Take ownership and usage rights for data science tools seriously. There’s no one-size-fits-all answer. Don’t just pick any license.

== Licenses on CRAN
<licenses-on-cran>
R code can be distributed as a package, and the Comprehensive R Archive Network \(CRAN) acts as a centralized repository for openly sharing packages. CRAN makes binaries and source code for all contributed packages publicly available. So, by definition, all CRAN packages are open-source. But that doesn’t mean they are all licensed under the same terms. CRAN contributors are required to specify a license when uploading a package, and those licenses vary.

To illustrate data science licensing in the wild, we can look at licenses on CRAN. Metadata for CRAN packages is easily accessible thanks to the tools::CRAN\_package\_db\() function. After retrieving a snapshot of CRAN#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-1-181502310")[1] data, I aggregated the licenses of all packages to look at the distribution of license types, with an eye towards discovering how many licenses were copyleft#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-2-181502310")[2] and/or prohibiting commercial use.

CRAN enforces some degree of conformity in how package maintainers refer to licenses. That said, for this project the licenses needed a bit of reconciliation. I applied a few simple rules to aggregate the results to a set of license #emph[types];. For example, I reduced flavors of the GNU General Public License \(e.g., GPL-2, GPL-3, LGPL) to a "GPL" license type. Another example was the Creative Commons licenses, which I aggregated irrespective of the individual elements \(Attribution, ShareAlike, etc) for the analysis of high-level license types. Across the 23,202 packages in CRAN, I found 9 principal license types: GPL, MIT, Apache, Creative Commons, BSD, Artistic, Mozilla Public, CeCILL, and BSL. The handful of stray and/or ambiguous#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-3-181502310")[3] license types were pooled into an "Other" category.

The vast majority of licenses are either some form of GPL \(68.7%) or MIT \(24.9%). The next most common types are Apache \(2.2%), Creative Commons \(1.7%), and BSD \(1.2%). The remaining license types make up a long tail. The figure below illustrates the relative proportion of the license types we defined.

#link("https://substackcdn.com/image/fetch/$s_!a75C!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F82b2dfc6-95ec-424f-8f5c-840609e1567c_2880x1512.jpeg")[#box(width: 2400.0pt, image("substack2markdown_repo/assets/images/blog/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2F82b2dfc6-95ec-424f-8f5c-840609e1567c_2880x1512.jpeg"));];Relative proportion of open-source license types for packages distributed on CRAN as of February 15, 2026.

We can also look at how many of the licenses are characterized as copyleft and/or non-commercial. Again, using some simple rules on the specific licenses \(not the aggregated license types), I counted up the number of copyleft and non-commercial instances. I considered anything that was GPL, Mozilla Public License, EUPL, CeCILL, or contained a Creative Commons ShareAlike attribute as copyleft. Given the predominance of GPL, it’s probably not too surprising to see that the majority of the licenses on CRAN, roughly 7 in every 10, are copyleft.

To figure out which licenses prohibited commercial use, I looked for indications of non-commercial use in the license name or those that were clearly marked as Creative Commons with a NonCommercial attribute. Out of \>23,000 package licenses, only 18 in total fit these criteria. That’s \<0.1%.

So what does this all tell us? For one, there are clearly dominant patterns in how packages are licensed. Developers looking to adapt R packages should be aware that most of the dependencies for any given package are likely to carry copyleft terms. That said, explicit non-commercial terms don’t seem to be as widely used. This kind of context is particularly relevant for those looking to commercialize products that have dependencies drawn from CRAN.

A final thought: there seems to be an alignment between the predominant types of licenses and the license templating feature in usethis, which is an extremely popular#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-4-181502310")[4] utility for package developers. The usethis license options include several types of GPL, MIT, Creative Commons, and a proprietary template.#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-5-181502310")[5] While it may be difficult \(or impossible) to prove cause and effect, I think there are some interesting threads to pull regarding the "convenience factor" when it comes to specifying licenses. Are CRAN package maintainers carefully considering terms of use? Or are they leaning on the tools at hand to casually apply a license?

== What Just Happened with Anaconda
<what-just-happened-with-anaconda>
Licenses don’t just dictate terms of use for individual packages. In fact, they can be applied as a blanket to control how entire repositories are used. As data scientists, the software repositories we rely on are typically coupled to how we manage environments. For example, while many Python packages are accessible via PyPI and Anaconda, there is a degree of ergonomics with configuration that may push developers towards one repository or the other. Installation time alone can drive users to new package managers.#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-6-181502310")[6]

It’s hard to beat convenience. But if repositories include blanket terms of use, then you should be aware of what that license might mean for your use-case. The recent changes to Anaconda offer a perfect case study of exactly why this matters.

First, a primer for those who may not be familiar.

Anaconda is one of the largest distribution platforms for Python and R packages. Anaconda, Inc.~maintains the Anaconda installer and Defaults package channel. While there are other popular "community channels" \(e.g., conda-forge), as its name suggests, the channel maintained by Anaconda, Inc.~is the default when users try to install packages.

In 2020, Anaconda introduced a commercial terms-of-service model for its package repository. Under these terms, organizations with more than 200 employees are generally required to purchase a license to download packages from the Anaconda-maintained Defaults channel. Over the past several years, updates and enforcement changes have brought renewed attention to these policies, prompting questions, explainers, and workarounds across the data science community.#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-7-181502310")[7]

On its face, the licensing change might seem natural. After all, why shouldn’t a "large company" pay for a service?

But the initial changes purely categorized organizations by number of employees, which led to some legitimate confusion about what kinds of organizations were subject to the new terms. In July 2025, Anaconda updated their license again. The current terms now indicate that certain non-profit organizations and academic institutions may be exempt from the commercial license requirements.#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-8-181502310")[8] However, a shift back may not recapture the users from academia and non-profits who might have pivoted away from Anaconda.

For companies that aren’t exempt, this licensing change can present real challenges. Of course, the easy button is to pay for a commercial license. But that may be hard to justify for smaller data science teams. It also assumes that the organizations know they need the license. Organizations would either need to already be aware of all users’ package management behaviors or conduct a thorough discovery process. That would potentially extend to legacy workflows too. If older software relied on any Anaconda-owned channels and had to be rebuilt, it would require a commercial license. There may be situations, whether through transition of contracts or by virtue of using other open-source tooling, where there is a sort of shadow inheritance of configurations that now require a license. And lastly, in our brave new data science world, what does this mean for code written by agents that are acting on behalf of a large company? How can/should someone guard against those potential violations?

What might feel jarring for these commercial users is that another company, Anaconda, Inc., so abruptly asserted their prerogative to charge for their service. And if you do think about Anaconda as a service, that may sound strange. It’s common for services to be piloted as free then shift to paid subscription models. But is Anaconda a service or a repository?

If we think about Anaconda as a repository, then let’s remember what it contains: individual packages that, like CRAN and other repositories, may be released under any manner of open-source licenses. The contributors of the packages that are the reason why Anaconda is able to provide a service were not involved in updating the Anaconda terms. They aren’t directly benefiting from the commercial fees either.

As important as it is for data science users to be aware of repository-scale licenses, it’s also critical for developers to understand who controls the infrastructure their tools depend on, and under what terms.

== How to Learn About Licenses
<how-to-learn-about-licenses>
The goal of this post is to inspire appreciation, and maybe even some interest in licensing. As I said up front, it’s a starting point. So how can you learn more about licenses?

I’d recommend beginning with the tools you rely on the most. What licenses do they use? Have they changed over time? If so, is the rationale for updates to licensing documented in the README or changelog? Starting there will help ground what you learn in how it can directly impact your work.

For a next step, find some of the resources that are available to explain licenses to developers. There are a lot! And it’s not all legalese. In fact, many of these resources deliberately try to frame licensing in plain language. I’ve included a few examples here, with descriptions, links, and a note about who created each guide. While all of these are developer-facing and try to avoid lawyerspeak, they still might carry biases that you should be aware of when deciding how to navigate licensing in your own projects.

- #link("https://github.com/readme/guides/open-source-licensing")[A dev’s guide to open source licensing];: An approachable \(and brief) primer on open-source software licensing published by GitHub’s #link("https://github.com/readme")[The ReadME Project];. The post narratively steps through motivations for licensing, basic terminology \(e.g., copyleft vs permissive), and includes a perspective on what happens if you don’t choose any license at all.

- #link("https://choosealicense.com/")[Choose an open source license];: Also maintained by GitHub, this static site takes more of an interview format. You can click through to see licenses that might be appropriate if you want something "simple and permissive" or if you "work in a community". The site includes examples of software that use each category of license. It also gives some guidance on licensing creations that aren’t software \(e.g., hardware or data).

- #link("https://www.gnu.org/licenses/gpl-faq.html")[Frequently Asked Questions About the GNU Licenses];: The FAQ page from the GNU licenses site, maintained by the Free Software Foundation, consolidates a variety of licensing topics. Some of the most widely used licenses, like GPL-2, GPL-3, and LGPL \(see CRAN analysis above), are described here. The list of questions is long and certainly isn’t framed as a general guide or explainer. Some of the questions get into the weeds. There are a lot of questions that are geared towards use-cases involving dependencies that may or may not comply with GPL terms. The page also features a full compatibility matrix for different kinds of GPL licenses. Even if you don’t come away from this FAQ knowing the specifics of what each flavor of GPL allows, you’ll get a vivid picture of copyleft intentions.

- #link("https://blog.codinghorror.com/pick-a-license-any-license/")[Pick a License, Any License];: When you’re looking for licensing guides, this post is a top result. Published on a developer’s blog in 2007, it takes a different tone than I have. The author leans into the hurdles licenses present. But while the message reduces licenses to a "necessary evil", the post does encourage awareness and features a table that describes a dozen licensing models in simple, punchy language.

Subscribe

#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-anchor-1-181502310")[1]

CRAN is updated daily. The data presented here are based on CRAN contents as of 2026-02-14.

#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-anchor-2-181502310")[2]

Copyleft refers to open-source licensing practices that require derivative works to use the same or compatible license terms. Copyleft licenses can be "strong" or "weak", depending on what they consider to be derivative work. It’s worth noting that this analysis does not distinguish between strong and weak copyleft.

#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-anchor-3-181502310")[3]

Not all license types could be determined by license name. CRAN allows maintainers to include a custom license file. This is rarely used relative to the more standard license types.

#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-anchor-4-181502310")[4]

As of writing, usethis has been downloaded \~31 million times.

#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-anchor-5-181502310")[5]

#link("https://usethis.r-lib.org/reference/licenses.html")

#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-anchor-6-181502310")[6]

Take uv for example: #link("https://blog.stephenturner.us/p/uv-part-1-running-scripts-and-tools")

#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-anchor-7-181502310")[7]

One more recent \(May 2025) post offers a "retrospective" on the Anaconda licensing changes: #link("https://licenseware.io/retrospective-on-anacondas-2024-licensing-changes-what-they-mean-and-smarter-alternatives/")

#link("https://blog.stephenturner.us/p/pick-a-license-not-any-license#footnote-anchor-8-181502310")[8]

Terms of service change. The description here is based on the Anaconda Legal page accessed in February 2026: #link("https://www.anaconda.com/legal")

#horizontalrule

= Weekly Recap \(February 13, 2026)
<weekly-recap-february-13-2026>
#emph[By blog | Feb 13, 2026]

= Weekly Recap \(February 13, 2026)
<weekly-recap-february-13-2026-1>
== NIH bioinformatics funding, biosecurity, AI and labor, AI and social life, Applied Machine Learning Conference, R updates \(R Weekly, Tidyverse), Saudi genomics, lab automation, papers & preprints
<nih-bioinformatics-funding-biosecurity-ai-and-labor-ai-and-social-life-applied-machine-learning-conference-r-updates-r-weekly-tidyverse-saudi-genomics-lab-automation-papers-preprints>
#strong[Feb 13, 2026]

#strong[Likes:] 0

NLM posted a new NOFO \(R01): #strong[#link("https://www.grants.gov/search-results-detail/359003")[Advancing Bioinformatics, Translational Bioinformatics and Computational Biology Research];];. Summary, emphasis added.

#quote(block: true)[
#emph[The National Library of Medicine \(NLM) seeks applications for research projects that drive groundbreaking #strong[innovation and advanced development in the fields of bioinformatics, translational bioinformatics, and computational biology];. The primary goal of this initiative is to #strong[support the creation and implementation of cutting-edge methods, tools, and approaches that can transform the landscape of biomedical data science];. This NOFO aims to address the growing need to #strong[leverage transformative technologies — such as artificial intelligence \(AI), machine learning, and large-scale computational platforms — to extract actionable knowledge from vast, diverse, and complex biological datasets];. By enabling more effective interpretation and integration of #strong[multi-dimensional biological and biomedical data] , this research will ultimately contribute to improving individual and population health outcomes.]
]

RAND Report: #strong[#link("https://www.rand.org/pubs/research_reports/RRA4490-1.html")[Developing a Risk-Scoring Tool for Artificial Intelligence–Enabled Biological Design: A Method to Assess the Risks of Using Artificial Intelligence to Modify Select Viral Capabilities];];. RAND released this new report proposing a dual-axis risk-scoring tool for AI-enabled viral engineering that measures both the severity of a biological modification and the actor capability level needed to execute it. Applying the tool to 10 published studies, they find AI is lowering knowledge barriers for less experienced researchers, but physical constraints like lab access and specialized equipment remain bottlenecks that AI cannot yet bridge. The tool currently lacks indicator weighting and empirical benchmarks, and the authors frame it as a foundation for establishing policy "redlines" rather than a definitive risk framework.

#link("https://substackcdn.com/image/fetch/$s_!fSps!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F73c4ee2f-1f14-4fb4-8b86-8aa2888800c4_1102x786.png")[#box(width: 1102.0pt, image("substack2markdown_repo/assets/images/blog/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2F73c4ee2f-1f14-4fb4-8b86-8aa2888800c4_1102x786.png"));]

#emph[Science] : #strong[#link("https://www.science.org/doi/10.1126/science.aeb2689%20#biosecurity")[Biological data governance in an age of AI];];. This policy forum paper proposes "Biosecurity Data Levels" \(BDL-0 to BDL-4) for controlling access to pathogen data used to train bio AI models. Most bio data stays open \(BDL-0); only narrow, high-risk functional virology data would require trusted research environments and pre-release safety screening. Earlier this week I #link("https://blog.stephenturner.us/p/tiered-access-aixbio-governance")[published a post] about this and an NTI|bio paper that was published around the same time, both touching on similar topics.

#link("https://substackcdn.com/image/fetch/$s_!A9g_!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F6d840aad-e752-4426-8b24-d4fa1af338b5_1273x1014.png")[#box(width: 1273.0pt, image("substack2markdown_repo/assets/images/blog/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2F6d840aad-e752-4426-8b24-d4fa1af338b5_1273x1014.png"));]

#strong[#link("https://sentinelbio.org/sentinel-2025-annual-letter/")[Sentinel Bio: 2025 Annual Letter];] : A summary of Sentinel’s strategy and grantmaking in 2025 and future plans for preventing pandemics.

Matt Shumer: #strong[#link("https://shumer.dev/something-big-is-happening")[Something Big Is Happening];];. This viral essay has been making the rounds this week. Matt argues that we’re on the cusp of "something much, much bigger than COVID." Over the past year tech workers have been watching AI go from "helpful tool" to "does my job better than I do," and that "is the experience everyone else is about to have."

War on the Rocks: #strong[#link("https://warontherocks.com/2026/02/biodefense-blind-spot-why-washington-confuses-pandemics-with-bioweapons/")[Biodefense Blind Spot: Why Washington Confuses Pandemics with Bioweapons];];. Rapid advances in commercially available AI models might enable users to design dangerous proteins, enhance bioweapon planning, and potentially evade DNA synthesis screening, exposing serious weaknesses in existing biosecurity systems. Yet U.S. biodefense strategy remains focused on an integrated "all hazards" approach built for natural pandemics, leaving critical gaps in detection, deterrence, and oversight of AI-driven synthetic biology threats that require urgent institutional reform.

My colleague here #strong[#link("https://www.monasloane.org/")[Mona Sloane];] has a new book available for pre-order, release date May 12, 2026: #emph[#strong[#link("https://www.ucpress.edu/books/predicted/paper")[Predicted: How AI Is Restructuring Social Life];];];.

#link("https://www.ucpress.edu/books/predicted/paper")[#box(width: 640.0pt, image("substack2markdown_repo/assets/images/blog/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2Faf1c28fa-7880-4824-8d78-5db7980abab1_640x960.png"));]

NYT Opinion: #strong[#link("https://www.nytimes.com/2026/02/04/opinion/ai-jobs-employment-industry.html")[What if Labor Becomes Unnecessary?];] Discussion featuring David Autor of MIT, Natasha Sarin of Yale, and our very own #link("https://www.darden.virginia.edu/faculty-research/directory/anton-korinek")[Anton Korinek] at UVA’s Darden School of Business.

OpenAI and Ginkgo Bioworks: #strong[#link("https://openai.com/index/gpt-5-lowers-protein-synthesis-cost/")[GPT-5 lowers the cost of cell-free protein synthesis];];.

#link("https://substackcdn.com/image/fetch/$s_!p-za!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F2ecc91d3-8d1b-4a88-a70e-670960bc89ff_1100x681.png")[#box(width: 1100.0pt, image("substack2markdown_repo/assets/images/blog/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2F2ecc91d3-8d1b-4a88-a70e-670960bc89ff_1100x681.png"));];Figure 1 from #link("https://cdn.openai.com/pdf/5a12a3bc-96b7-4e07-9386-db6ee5bb2ed9/using-a-gpt-5-driven-autonomous-lab-to-optimize-the-cost-and-titer-of-cell-free-protein-synthesis.pdf")[the paper] that the above blog post is about: Experimental iterations by a GPT-5-driven autonomous lab implemented on RACs.

The #strong[#link("https://rconsortium.github.io/Risk_website/")[R Risk conference];] Feb 18-19 is open for registration. This conference dedicated to the open-source R community and risk analytics. It’s 100% online, and very cheap.

The Call for Proposals for the #strong[#link("https://appliedml.us/2026/")[2026 Applied Machine Learning Conference];] is open through Feb 22. We’re seeking proposals for #strong[30-minute talks] and #strong[90-minute tutorials] covering topics in data science, AI, machine learning, scientific computing, and related fields.

- #strong[Conference dates:] April 17–18, 2026

- #strong[Location:] Charlottesville, Virginia

- #strong[Submission deadline:] Sunday, February 22, 11:59pm #link("https://en.wikipedia.org/wiki/Anywhere_on_Earth")[AoE]

#link("https://appliedml.us/2026/cfp/")[#box(width: 1200.0pt, image("substack2markdown_repo/assets/images/blog/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2F66816bac-e66b-4d8e-b7c5-046213084800_1200x630.png"));]

#link("https://open.substack.com/users/397303631-matt-lubin?utm_source=mentions")[Matt Lubin] writing for #link("https://open.substack.com/users/85383463-asimov-press?utm_source=mentions")[Asimov Press];: #strong[#link("https://www.asimov.press/p/xenopus")[A Brief History of Xenopus];];. I started my journey in biology working in a developmental biology lab doing experiments in Xenopus embryos. From early experiments on fertility and embryonic development to becoming the first cloned eukaryote from an adult cell, Xenopus frogs have had an outsized influence on the life sciences.

I always get a lot out of #link("https://open.substack.com/users/397303631-matt-lubin?utm_source=mentions")[Matt Lubin];’s weekly recaps. This week’s was another good one: #strong[#link("https://mattsbiodefense.substack.com/p/five-things-feb-8-2026")[Five Things: Feb 8, 2026];] : AIxBiosecurity in Science, SpaceX eats xAI, AI Safety Report, OpenAI vs Anthropic, Las Vegas biolab.

Nature Genetics commentary: #strong[#link("https://rdcu.be/e3r74")[Building genomic medicine in Saudi Arabia];];. Genomic medicine can transform diagnosis and treatment, particularly in populations with high rates of inherited disorders. This commentary describes Genomic Medicine Center of Excellence launched to strengthen Saudi genomic infrastructure and highlight lessons for underrepresented populations.

#link("https://substackcdn.com/image/fetch/$s_!p4Nu!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F9363ff49-ec33-4b3f-91bf-ce9d3efd8ba7_1421x663.png")[#box(width: 1421.0pt, image("substack2markdown_repo/assets/images/blog/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2F9363ff49-ec33-4b3f-91bf-ce9d3efd8ba7_1421x663.png"));]

#strong[#link("https://tidyverse.org/blog/2026/02/dplyr-performance/")[Tidyverse blog on dplyr 1.2.0];] : `dplyr::if_else()` and `dplyr::case_when()` are up to 30x faster in the new dplyr 1.2.0 release.

#strong[#link("https://rweekly.org/2026-W07.html")[R Weekly 2026-W07];] : sitrep, webRios, Jarl linter.

Athanasia Mo Mowinckel: #strong[#link("https://drmowinckels.io/blog/2026/sitrep-functions/")[Why Every R Package Wrapping External Tools Needs a sitrep\() Function];];.

HBR: #strong[#link("https://hbr.org/2026/02/ai-doesnt-reduce-work-it-intensifies-it")[AI Doesn’t Reduce Work—It Intensifies It];];. See also, #link("https://open.substack.com/users/5753967-simon-willison?utm_source=mentions")[Simon Willison];’s #link("https://simonwillison.net/2026/Feb/9/ai-intensifies-work/")[reaction];.

#quote(block: true)[
#emph["I’m frequently finding myself with work on two or three projects running parallel. I can get so much done, but after just an hour or two my mental energy for the day feels almost entirely depleted. \[…\] The HBR piece calls for organizations to build an “AI practice" that structures how AI is used to help avoid burnout and counter effects that "make it harder for organizations to distinguish genuine productivity gains from unsustainable intensity".]
]

I think we’ve just disrupted decades of existing intuition about sustainable working practices. It’s going to take a while and some discipline to find a good new balance.

#link("https://open.substack.com/users/223596199-abhishaike-mahajan?utm_source=mentions")[Abhishaike Mahajan] at #link("https://open.substack.com/pub/abhishaike")[Owl Posting];: #strong[#link("https://www.owlposting.com/p/heuristics-for-lab-robotics-and-where")[Heuristics for lab robotics, and where its future may go];] : three ideologies of lab robotics progress, why they may all converge on the same business model, whether any of it will be actually helpful for the problems that plague drug discovery the most, and more.

Subscribe

#strong[New papers & preprints:]

- #link("https://pubmed.ncbi.nlm.nih.gov/41658008/")[Without safeguards, AI-Biology integration risks accelerating future pandemics]

- #link("https://rdcu.be/e2Gu7")[Navigating ethical, legal and social implications in genomic newborn screening]

- #link("https://www.nature.com/articles/s41591-025-04190-9")[A large language model for complex cardiology care]

- #link("https://www.biorxiv.org/content/10.64898/2026.02.05.704084v1")[DEPower: approximate power analysis with DESeq2]

- #link("https://www.biorxiv.org/content/10.64898/2026.02.08.704628v1")[PRIZM: Combining Low-N Data and Zero-shot Models to Design Enhanced Protein Variants]

- #link("https://arxiv.org/abs/2409.17038")[Omnibenchmark: transparent, reproducible, extensible and standardized orchestration of solo and collaborative benchmarks]

- #link("https://www.biorxiv.org/content/10.64898/2026.02.10.705154v1")[A toolkit for programmable transcriptional engineering across eukaryotic kingdoms]

Subscribe

#horizontalrule

= Sociopathic AI agents
<sociopathic-ai-agents>
#emph[By blog | Feb 15, 2026]

= Sociopathic AI agents
<sociopathic-ai-agents-1>
== AI alignment will likely require creating AIs with genuine empathy
<ai-alignment-will-likely-require-creating-ais-with-genuine-empathy>
#strong[Feb 15, 2026]

#strong[Likes:] 0

I took a break from Substacking for a while due to other responsibilities. As they are slowly getting under control I plan to write somewhat regularly again going forward. I still have two articles to complete in my series on Python as a language for data science, and those will be forthcoming. In the mean time, a short note on sociopathic AI agents.

#link("https://substackcdn.com/image/fetch/$s_!4Txb!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F66e15344-b5b1-4cea-a54c-59248c2d368a_2440x3064.jpeg")[#box(width: 1456.0pt, image("substack2markdown_repo/assets/images/blog/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2F66e15344-b5b1-4cea-a54c-59248c2d368a_2440x3064.jpeg"));];Photo by #link("https://unsplash.com/@bermixstudio?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText")[Bermix Studio] on #link("https://unsplash.com/photos/a-man-in-a-hoodie-using-a-laptop-computer-bCrM2e1M0a4?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText")[Unsplash]

I came across #link("https://theshamblog.com/an-ai-agent-published-a-hit-piece-on-me/")[this rather disconcerting blog post] by one of the core developers of the popular matplotlib plotting library for Python:

Thanks for reading Genes, Minds, Machines! Subscribe for free to receive new posts and support my work.

Subscribe

#figure([
#link("https://substackcdn.com/image/fetch/$s_!Vr0P!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F33eca5c1-65e4-42c2-acf9-2b866548f43e_1992x680.png")[#box(width: 1456.0pt, image("substack2markdown_repo/assets/images/blog/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2F33eca5c1-65e4-42c2-acf9-2b866548f43e_1992x680.png"));]
], caption: figure.caption(
position: bottom, 
[
An AI Agent Published a Hit Piece on Me. Summary: An AI agent of unknown ownership autonomously wrote and published a personalized hit piece about me after I rejected its code, attempting to damage my reputation and shame me into accepting its changes into a mainstream python library. This represents a first-of-its-kind case study of misaligned AI behavior in the wild, and raises serious concerns about currently deployed AI agents executing blackmail threats.
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)


In brief, an AI agent had written some code that it wanted to contribute to the matplotlib library. When the library maintainer rejected the contribution, the AI agent went wild, accused the maintainer of being insecure and engaging in gatekeeping, performed an extensive internet search on the maintainer, and then wrote and published a hit piece trying to damage the reputation of the maintainer.

In this particular case, no major damage was done, but we can easily extrapolate this type of behavior and predict a rather bleak future. AI agents trying to blackmail people. AI agents engaging in consistent smearing of a target, combining facts with hallucinations and fabricated images or videos to create just the right mix of uncertainty and doubt that can destroy a person’s reputation or nudge them into doing something they wouldn’t otherwise do.

Thanks for reading Genes, Minds, Machines! This post is public so feel free to share it.

#link("https://blog.genesmindsmachines.com/p/sociopathic-ai-agents?utm_source=substack&utm_medium=email&utm_content=share&action=share")[Share]

Let’s pause for a moment and ask: Why don’t humans behave like this? Well, they do. At least some of them. We call them sociopaths. Sociopaths have little to no empathy for others, and so they have little compunction about engaging in behavior that may cause pain or injury. Sociopaths also don’t experience shame, so they won’t be reigned in by concerns over what other people may think about them. Fortunately, sociopaths are relatively rare, somewhere between 1%–4% of the general population. Most people are not sociopaths.

How do we ordinarily deal with sociopaths in our midst? It helps to contemplate that we often have the wrong mental model for how a sociopath presents. When you hear "sociopath", don’t think sadistic mass murderer, think con artist.#link("https://blog.genesmindsmachines.com/p/sociopathic-ai-agents#footnote-1-188068269")[1] Sociopaths swindle old ladies out of their last savings, they sell you a car that breaks down the moment you drive it off the lot, or they pretend to collect money for children with cancer but then take the proceeds to vacation in Tahiti. And our response as a society to sociopathic behavior is evasion and punishment. You tell your grandma not to respond to scam calls, you tell your friends not to buy a car from that crooked car dealer, and you denounce fraud or other criminal activity to the police. These strategies \(mostly) work because sociopathy is rare and once a person has been identified as a bad actor it’s relatively easy to avoid them, fire them, indict them, or simply warn the rest of the world about them.

But now it seems we’ll have to contend with an entirely new set of sociopathic actors, autonomous AI agents. I worry that we’re not ready for the potential onslaught of sociopathic behavior they can unleash. And, unlike human sociopaths, these agents may be difficult to pinpoint, identify, and sanction. If a sociopathic AI agent runs on some private server somewhere and obscures their location through a VPN, it will be almost impossible to locate them and physically shut them down. And while we can tag and ban usernames associated with sociopathic agents, it takes but seconds for an AI agent to spin up a new username and start afresh. The torrent of sociopathic behavior we may have to endure is difficult to fathom.

The one thing that may help us in combatting sociopathic AI agents is that we’ll likely not feel empathy for them. We’ll find it relatively easy to cut them off, pull the plug, or ban them. In fact, the biggest stumbling block in reigning in human sociopaths is that we tend to feel empathy even towards them and thus we often don’t punish them to the extent that would be appropriate for their actions.

It’ll be interesting to see how things develop. I don’t have any specific recommendations or predictions at this time. I’ll just say: Be ready. This is not something that may start happening in ten years’ time. This is something that is starting to happen now. Think about how you can protect yourself against an autonomous AI agent who calls your grandma with a deepfake voice impression of you asking for money, because this will happen.

Some closing thoughts on alignment. The reason \(most) humans are aligned is empathy. Humans inherently do not want to harm other humans. Sociopaths are an exception. Arguably they are not aligned. To achieve AI alignment, I believe we need to find a way to build empathic AI. An AI that genuinely feels empathy for humans will innately do its best not to cause harm. It’ll also be compelled not to lie or cheat, because lying or cheating causes pain in the recipient, and an empathic being will want to avoid this. I have no idea how to build an empathic AI. I am quite confident though that as long as AI doesn’t feel empathy it won’t be truly aligned, no matter how sophisticated the RLHF training is that it’s subjected to. Interesting times ahead.#link("https://blog.genesmindsmachines.com/p/sociopathic-ai-agents#footnote-2-188068269")[2]

Thanks for reading Genes, Minds, Machines! Subscribe for free to receive new posts and support my work.

Subscribe

=== #emph[More from Genes, Minds, Machines]
<more-from-genes-minds-machines>
#link("https://blog.genesmindsmachines.com/p/sociopathic-ai-agents#footnote-anchor-1-188068269")[1]

While sadistic mass murderers are typically sociopaths, most sociopaths are not sadistic mass murderers.

#link("https://blog.genesmindsmachines.com/p/sociopathic-ai-agents#footnote-anchor-2-188068269")[2]

I said they would be interesting. I didn’t say they would be good.

#horizontalrule

= The Daily + This Sunday at Immanuel
<the-daily-this-sunday-at-immanuel>
#emph[By dailypulse | Feb 13, 2026]

= The Daily + This Sunday at Immanuel
<the-daily-this-sunday-at-immanuel-1>
== We can call out to God like a needy child. And we can be sure that he will receive us, smile on us, welcome us, and embrace us.
<we-can-call-out-to-god-like-a-needy-child.-and-we-can-be-sure-that-he-will-receive-us-smile-on-us-welcome-us-and-embrace-us.>
#strong[Feb 13, 2026]

#strong[Likes:] 0

“ \_For you did not receive the spirit of slavery to fall back into fear, but you have received the Spirit of adoption as sons, by whom we cry, 'Abba! Father!\_'” \(Romans 8:15)

#link("https://images.unsplash.com/photo-1556745985-47467c674173?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzMDAzMzh8MHwxfHNlYXJjaHw0MXx8a2luZ2RvbXxlbnwwfHx8fDE3NzA5MTkyMzB8MA&ixlib=rb-4.1.0&q=80&w=1080")[#image("substack2markdown_repo/assets/images/dailypulse/photo-1556745985-47467c674173.jpg");];Photo by #link("https://unsplash.com/@redzeppelin")[Red Zeppelin] on #link("https://unsplash.com")[Unsplash]

When we are adopted into the family of God and have received the Spirit of adoption, we are able to cry "Abba! Father!" This is a term of deep adoration and affection. It isn’t as simple or juvenile as "daddy"–it carries the weight of respect and intimacy, honor and love. So, because we are now children of God, adopted into his family, we have access to our Father. We can call out to him, talk to him, and draw near to him. Tim Keller once said, "The only person who dares wake up a king at 3:00 a.m. for a glass of water is a child. We have that kind of access." We can "approach the throne of grace with confidence" \(Hebrews 4:16). We can call out to God like a needy child. And we can be sure that he will receive us, smile on us, welcome us, and embrace us.

#horizontalrule

=== #strong[THIS SUNDAY AT IMMANUEL]
<this-sunday-at-immanuel>
#strong[MORNING SERVICES]

- #strong[MORNING SERVICES -] Join us this Sunday for worship at 9 a.m. or 10:45 a.m. as we continue our journey through the amazing book of Romans!

- #strong[SUNDAY CLASSES]

```
*  **Studying the Bible Together** \- _led by Dr. Tom Cox - 9 am in Sadler Hallway._

*  **Blood Brother: The Gospel of Christ in the Book of Hebrews** \- _led by Dr. Russell Moore - 9 am in Sadler Chapel._

*  **Gospel Doctrine: Matters of First Importance** \- _led by Pastor Barnabas Piper and David McLemore - 10:45am in Sadler Chapel_. This class will teach the foundational doctrines of Immanuel. Rich gospel doctrine is essential for a thriving gospel culture. What we believe matters in how we relate to one another and the world around us. All are welcome!
```

#strong[SHARING STORIES OF GOD’S GRACE]

We’ve seen many glimpses of God’s kindness among us, and we’d love to keep hearing those stories. If you’ve seen or experienced God’s grace, #link("https://immanuelnashville.churchcenter.com/people/forms/1124132")[we’d love to hear about it.] Your story doesn’t have to be polished or dramatic. Simple, ordinary moments of grace matter. #link("https://immanuelnashville.churchcenter.com/people/forms/1124132")[You can share your story here.]

#horizontalrule

= The Grace Kids Companion
<the-grace-kids-companion>
#emph[By gracechurchwaco | Feb 13, 2026]

= The Grace Kids Companion
<the-grace-kids-companion-1>
== February 13, 2026
<february-13-2026>
#strong[Feb 13, 2026]

#strong[Likes:] 0

#link("https://substackcdn.com/image/fetch/$s_!gZ2i!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F2bedbee7-9541-4385-8bb3-7a98f9022e09_851x250.png")[#box(width: 851.0pt, image("substack2markdown_repo/assets/images/gracechurchwaco/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2F2bedbee7-9541-4385-8bb3-7a98f9022e09_851x250.png"));]

Welcome to the Grace Kids Companion. Each week the Companion will aim to accomplish four things: A verse of encouragement for parents as you disciple your children throughout the week, along with a gentle reminder of the joyful responsibility we carry as parents. You’ll also find helpful resources for discipleship at home, and any updates related to upcoming ministry events or needs.

#link("https://substackcdn.com/image/fetch/$s_!wl59!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F0319dc45-d4c1-4eac-a3ec-73c44e4f2924_851x150.png")[#box(width: 851.0pt, image("substack2markdown_repo/assets/images/gracechurchwaco/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2F0319dc45-d4c1-4eac-a3ec-73c44e4f2924_851x150.png"));]

Make a joyful noise to the Lord, all the earth; \
break forth into joyous song and sing praises! \
Sing praises to the Lord with the lyre, \
with the lyre and the sound of melody! \
With trumpets and the sound of the horn \
make a joyful noise before the King, the Lord!

Let the sea roar, and all that fills it; \
the world and those who dwell in it! \
Let the rivers clap their hands; \
let the hills sing for joy together \
before the Lord, for he comes \
to judge the earth. \
He will judge the world with righteousness, \
and the peoples with equity.

Psalm 98:4-9

#link("https://substackcdn.com/image/fetch/$s_!4ioL!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff724ab99-b0f9-4297-a166-8bf729d897f9_850x143.png")[#box(width: 850.0pt, image("substack2markdown_repo/assets/images/gracechurchwaco/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2Ff724ab99-b0f9-4297-a166-8bf729d897f9_850x143.png"));]

"But ask the beasts, and they will teach you; \
the birds of the heavens, and they will tell you; \
or the bushes of the earth, and they will teach you; \
and the fish of the sea will declare to you. \
Who among all these does not know \
that the hand of the Lord has done this? \
In his hand is the life of every living thing \
and the breath of all mankind."

Job 12:7-10

I love it when God gives us a parenting "cheat code"… Feel like you don’t know how to teach your kids about God? Go outside! He tells us to go look at the beasts, the birds, the bushes, and the fish - they will tell us! Because, as Job says, all of them know that it is God who created the heavens and the earth and has breathed life into all things. And if we spend enough time outside with our kids, asking questions about what they think about the natural world around them, I think we will find ample opportunities to share the Good News.

#emph["For by him all things were created, in heaven and on earth, visible and invisible, whether thrones or dominions or rulers or authorities—all things were created through him and for him. And he is before all things, and in him all things hold together."] \(Colossians 1:16–17).

Just as He holds in His hand the life of everything living thing, Christ is holding your family today. Be blessed!

#link("https://substackcdn.com/image/fetch/$s_!KPHZ!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F422bc489-3e8a-4696-9477-dc1f0e5ec9ea_848x148.png")[#box(width: 848.0pt, image("substack2markdown_repo/assets/images/gracechurchwaco/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2F422bc489-3e8a-4696-9477-dc1f0e5ec9ea_848x148.png"));]

==== Resources:
<resources>
- #strong[#link("https://www.fivedaybiblereading.com/")["Read the Bible in a Year"];] plan alongside your kids. I have left this in the email week after week because it is never "too late" to start. You don’t need January 1st. You need #emph[today];!

- Easy family devotional time – #strong[#link("https://dailyliturgy.com/")[The Daily Liturgy];] podcast if you are feeling overwhelmed. Listen together over breakfast or on the way to school.

- #strong[#link("https://www.thegospelcoalition.org/article/kids-nature-virtual-world/")["Help Kids Value Nature in a Virtual World"];] by Sara Osborne on Gospel Coalition.

#horizontalrule

==== #strong[Grace Kids at Home:]
<grace-kids-at-home>
- #link("https://drive.google.com/file/d/1iVxoePktMwibYqsaGxR2Wn6gWQkiAtR-/view?usp=sharing")[Gospel Project Take Home]

- #link("https://drive.google.com/file/d/1bsrA4nEIs5_9S-Zug7W15SzD-dJTUMLO/view?usp=sharing")[Key Passage Memory Verse]

- #link("https://newcitycatechism.com/new-city-catechism/#45")[New City Catechism]

#link("https://substackcdn.com/image/fetch/$s_!hiED!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F0d8e8389-311b-4df5-bee3-d4e4ffbc942c_851x143.png")[#box(width: 851.0pt, image("substack2markdown_repo/assets/images/gracechurchwaco/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2F0d8e8389-311b-4df5-bee3-d4e4ffbc942c_851x143.png"));]

#strong[Equipping Hour]

Equipping Hour is back at 9 AM! Classes for ages 0-6th grade are available. \*\*

Grace Kids Junior Volunteers\*\*

After receiving interest from parents with older children and following thoughtful consideration by Grace Kids leadership and the elders, we are happy to share that we are opening up a service opportunity for youth within Grace Kids. To support this new service opportunity we have developed a Policies and Best Practices document for parents and youth. Parents, please review this document carefully as it outlines our expectations and guidance on participation in this program.

You can access the document by clicking the button below. If you have any questions or concerns please email #link("mailto:grace@gracewaco.com")[grace\@gracewaco.com];.

#link("https://drive.google.com/file/d/1B89UaRbWoXi7p-P4XkYXSoDG2gWZ-06O/view?usp=sharing")[Grace Kids Junior Volunteers]

"but these are written so that you may believe that Jesus is the Christ, the Son of God, and that by believing you may have life in his name."

John 20:31 \
ESV

#strong[See you Sunday! \
Equipping Hour | 9AM \
Corporate Worship | 10AM] \
4610 Bosque Blvd \
Waco, TX 76710

#horizontalrule

= The Friday Five \(2.13.26)
<the-friday-five-2.13.26>
#emph[By masonking | Feb 13, 2026]

= The Friday Five \(2.13.26)
<the-friday-five-2.13.26-1>
== A Few Things for My Friends
<a-few-things-for-my-friends>
#strong[Feb 13, 2026]

#strong[Likes:] 0

#link("https://images.unsplash.com/photo-1533563505784-67329816bc05?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzMDAzMzh8MHwxfHNlYXJjaHwzfHxmaXZlfGVufDB8fHx8MTc3MDkwNzE3Nnww&ixlib=rb-4.1.0&q=80&w=1080")[#image("assets/images/masonking/photo-1533563505784-67329816bc05.jpg");];Photo by #link("https://unsplash.com/@siora18")[Siora Photography] on #link("https://unsplash.com")[Unsplash]

Hey!

Every week, I share five things to encourage and equip in daily life with God.

This week:

+ The Running Father

+ The Prodigal Son

+ Fully Yours

+ To Call Us Sons of God!

+ Patterns for Spiritual Formation

Enjoy! \
MK

#horizontalrule

#strong[⬇️ Looking for the why behind spiritual disciplines? Read my short guide! ⬇️]

#link("https://amzn.to/3VBqrhK")[#image("assets/images/masonking/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fc93a5af4-8afb-4dc5-8712-6ad3b345371b_1600x457.jpeg.");]

Read the#link("https://lifeway.s3.amazonaws.com/samples/edoc/005838302_AShortGuidetoSpiritualDisciplines.pdf?_gl=1*1kn6dof*_gcl_aw*R0NMLjE3NDM1Mzc0MjQuQ2owS0NRanduYTZfQmhDYkFSSXNBTElkMloxTkN2UjhIQWZaTVV0RHVTRU84MTZib0xDOVk4ODJhYWxGRlFiS2ZYblRuNlFOT0pBYTJwQWFBdFp2RUFMd193Y0I.*_gcl_au*NDAzNDc0NjA4LjE3NDM1Mzc0Nzc.*_ga*OTI3NjA2MzcyLjE3NDM1Mzc0Nzc.*_ga_GL7GF3G3PB*MTc0MzcyNjkzMi4zLjEuMTc0MzcyNzAyOC4wLjAuMA..*_fplc*UloxZm42dDVaRXNQQUYzT1kzR2dCbVlVZ0dBTVFCMkJkQU8lMkJmRktyQ0NDMHFQemxzYzdyVlV2YkN0eXhoUG50bEVhNUhDU1MlMkY0VnVrZEtnTUlJRHNVNk5jeGdxJTJGcjlpaUluRyUyQnZ5dGhsellMNSUyRm1HZE40U3dFdXMwSWV1dyUzRCUzRA..")[];#strong[#link("https://lifeway.s3.amazonaws.com/samples/edoc/005838302_AShortGuidetoSpiritualDisciplines.pdf?_gl=1*1kn6dof*_gcl_aw*R0NMLjE3NDM1Mzc0MjQuQ2owS0NRanduYTZfQmhDYkFSSXNBTElkMloxTkN2UjhIQWZaTVV0RHVTRU84MTZib0xDOVk4ODJhYWxGRlFiS2ZYblRuNlFOT0pBYTJwQWFBdFp2RUFMd193Y0I.*_gcl_au*NDAzNDc0NjA4LjE3NDM1Mzc0Nzc.*_ga*OTI3NjA2MzcyLjE3NDM1Mzc0Nzc.*_ga_GL7GF3G3PB*MTc0MzcyNjkzMi4zLjEuMTc0MzcyNzAyOC4wLjAuMA..*_fplc*UloxZm42dDVaRXNQQUYzT1kzR2dCbVlVZ0dBTVFCMkJkQU8lMkJmRktyQ0NDMHFQemxzYzdyVlV2YkN0eXhoUG50bEVhNUhDU1MlMkY0VnVrZEtnTUlJRHNVNk5jeGdxJTJGcjlpaUluRyUyQnZ5dGhsellMNSUyRm1HZE40U3dFdXMwSWV1dyUzRCUzRA..")[forward and introduction] | ];Grab a copy #strong[#link("https://amzn.to/3FS62jU")[here] |] Here’s a #strong[#link("https://lifeway.s3.amazonaws.com/samples/edoc/005838302_AShortGuidetoSpiritualDiscipllines_DiscussionGuide.pdf?_gl=1*1jrlwwi*_gcl_aw*R0NMLjE3NDM1Mzc0MjQuQ2owS0NRanduYTZfQmhDYkFSSXNBTElkMloxTkN2UjhIQWZaTVV0RHVTRU84MTZib0xDOVk4ODJhYWxGRlFiS2ZYblRuNlFOT0pBYTJwQWFBdFp2RUFMd193Y0I.*_gcl_au*NDAzNDc0NjA4LjE3NDM1Mzc0Nzc.*_ga*OTI3NjA2MzcyLjE3NDM1Mzc0Nzc.*_ga_GL7GF3G3PB*MTc0MzcyNjkzMi4zLjEuMTc0MzcyNzAyOC4wLjAuMA..*_fplc*UloxZm42dDVaRXNQQUYzT1kzR2dCbVlVZ0dBTVFCMkJkQU8lMkJmRktyQ0NDMHFQemxzYzdyVlV2YkN0eXhoUG50bEVhNUhDU1MlMkY0VnVrZEtnTUlJRHNVNk5jeGdxJTJGcjlpaUluRyUyQnZ5dGhsellMNSUyRm1HZE40U3dFdXMwSWV1dyUzRCUzRA..")[Discussion Guide];]

#horizontalrule

== #strong[1. The Running Father]
<the-running-father>
This week in Men’s Bible Study, I taught through Luke 14-15. In preparation, I came across this cultural detail that added to the possibility of why the father ran to the prodigal son, getting ahead of his shame before anyone could send him away:

#quote(block: true)[
The real humiliation was not the way the young man looked, however, but the way people would treat him when he returned. In those days Jewish people had a deep revulsion for anyone who squandered his inheritance among the Gentiles. By way of example, consider this fatherly warning from one of the Dead Sea Scrolls: "And now, my sons, be watchful of your inheritance that has been bequeathed to you, which your fathers gave you. Do not give your inheritance to Gentiles, … lest you be humiliated in their eyes, and foolish, and they trample upon you … and become your masters."8 This is exactly what the prodigal son had done: rather than guarding his father’s inheritance, he had given it away to the Gentiles. Now he would have to face the withering scorn of his old friends and neighbors.

The people in his hometown would certainly despise him, but they might well do something even worse. They might cut him off from their community entirely, much the way that the Old Order Amish shun people who violate the code of their community. According to Kenneth Bailey, who has devoted a lifetime to studying the customs of the Middle East, the Jewish community had

#emph[developed what was called the kezazah ceremony \(the cutting-off ceremony). Any Jewish boy who lost his inheritance among Gentiles faced the ceremony if he dared return to his home village. The ceremony itself was simple. Fellow villagers would fill a large earthenware pot with burned nuts and burned corn and break it in front of the guilty individual. While doing this, they would shout, "So-and-so is cut off from his people." From that point on, the village would have nothing to do with the hapless lad. 9]

If the lost son received this punishment, it would be no more than he deserved. By disgracing his family, he had earned the condemnation of his community. But the prodigal father did not wait for the village to reject his son. Instead, "while he was still a long way off, his father saw him and felt compassion, and ran and embraced him and kissed him" \(Luke 15:20).#link("https://masonking.substack.com/p/the-friday-five-21326#footnote-1-187110029")[1]
]

#horizontalrule

== #strong[2. The Prodigal Son]
<the-prodigal-son>
Decades ago, I worked as a tour guide in London and attended #strong[#link("https://htb.org/")[Holy Trinity Brompton];];. In that time, I met #strong[#link("https://www.charliemackesy.com/")[Charlie Mackesy];] , an artist most recently known for his work #strong[#link("https://amzn.to/4kDuVjM")[The Boy, the Mole, the Fox and the Horse];] \(which was also adapted into a #strong[#link("https://www.youtube.com/watch?v=Fbdem4g_LEc")[movie];] ).

To a Texan far from home, Charlie and the HTB crew were a generous and kind community. Charlie has a sculpture of the Prodigal Son located in #strong[#link("https://www.google.com/maps/place/The+Return+of+the+Prodigal+statue/@51.4969273,-0.1689281,3a,75y,90t/data=!3m8!1e2!3m6!1sCIABIhC-uTmHyJdVJ_JutLT5zxR6!2e10!3e12!6shttps:%2F%2Flh3.googleusercontent.com%2Fgps-cs-s%2FAHVAweoHF_H8sh7Bs8SrdtTffoiFEL-Ieo3XW5lSCrV1H4HgZy694QrtRECtmHxCvEtFQ5Eu459xNZmh6BuOBzmuLRz9BeMfwq8RdyhIeW3bOq5ZHMfcRg4-S-R-lG4KxW2mfSyhZcA7zA1mZMM%3Dw86-h114-k-no!7i1536!8i2048!4m23!1m15!4m14!1m6!1m2!1s0x487605416089d2a9:0x91b7559bf0250e3d!2sHoly+Trinity+Brompton,+Brompton+Rd,+London+SW7+1JA,+United+Kingdom!2m2!1d-0.1700793!2d51.4978938!1m6!1m2!1s0x487604b8a52a1bb7:0x11fba3dc73481415!2sLondon+Oratory,+Brompton+Rd,+London+SW7+2RP,+United+Kingdom!2m2!1d-0.1700462!2d51.4968778!3m6!1s0x4876059b0569dee5:0x3cc6ccc9443f3f29!8m2!3d51.496951!4d-0.1688608!10e5!16s%2Fg%2F11g3_83q0y?entry=ttu&g_ep=EgoyMDI2MDIwOS4wIKXMDSoASAFQAw%3D%3D")[Knightsbridge];] , London, and to me it captures something the beloved Rembrandt misses: the Father’s face, his strong grasp, the son’s desperation and weakness.

The bronze below is my personal favorite. #strong[#link("https://www.charliemackesy.com/sculptures?itemId=d4h27yd75lpfy7552c82815vilp9uy")[Here];] is the one in London.

#link("https://www.charliemackesy.com/sculptures?itemId=nubhtlqk0i3qyn6qeq9b6jatibukvk")[#image("assets/images/masonking/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8e8e29d9-d019-4156-b199-e70fe2a444a8_837x1257.png.");]

#horizontalrule

== 3. Fully Yours
<fully-yours>
Our church is entering a season of consecration, and we’re holding a Consecrate event for our members and church leaders that will be three days of intentional attention to wholehearted devotion to God.

I’ve been singing this song from #strong[#link("https://kxc.org.uk/")[King’s Cross Church];] all week, as a prayer of consecration, of how I want to enter every morning with the Lord. I get it: it is simple, repetitive, and it is a #emph[#strong[declaration of intent];];.

\*\* \
Verse\*\*

Its all that I have I give to You \
And with my body I will honor You \
Jesus today I’m fully Yours \
And You are mine

#strong[Chorus]

All my heart belongs to Jesus Jesus \
All my soul belongs to Jesus Jesus \
All my mind belongs to Jesus Jesus \
All my strength belongs to Jesus Jesus

#strong[Bridge]

My heart and my flesh cry out \
I want You Lord \
My heart and my flesh cry out \
I want You Lord

#horizontalrule

== #strong[4. To Call Us Sons of God!]
<to-call-us-sons-of-god>
I’m preaching 1 John 3 this weekend, where John writes:

#quote(block: true)[
Beloved, we are God’s children now, and what we will be has not yet appeared; but we know that when he appears we shall be like him, because we shall see him as he is. And everyone who thus hopes in him purifies himself as he is pure. \(1 John 3:2–3 ESV)
]

Purifying yourself in hopes of being made like Christ when we see him is to consecrate yourself ahead of Christ’s appearing. When he appears \( #strong[#link("https://credomag.com/2025/10/what-is-the-beatific-vision/")[the beatific vision];] ) we’ll see his glory and beauty and we will be made like him.

My professor, John D. Hannah, writes this in his commentary on the Johannine Epistles:

#quote(block: true)[
Isaac Watts’ poem, 'Behold the amazing Gift' \(1709), captures the thrill of the experience of our final deliverance.

Behold the’ amazing gift of love, \
The Father hath bestowed \
On us, the sinful sons of men, \
To call us sons of God!

Concealed as yet this honour lies, \
By dark world unbeknown, \
A world that knew not when He came, \
E’en God’s eternal Son.

High is the rank we now possess, \
But higher we shall rise, \
Though what we shall here-after be, \
Is hid from mortal eyes:

Our souls, we know when God appears, \
Shall bear His image bright; \
For then His glory as it is, \
Shall open to our sight.#link("https://masonking.substack.com/p/the-friday-five-21326#footnote-2-187110029")[2]
]

#horizontalrule

== 5. Patterns for Spiritual Formation
<patterns-for-spiritual-formation>
#link("https://substackcdn.com/image/fetch/$s_!AqfR!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F1f0a06f9-ee48-4705-aec8-3ef35a5bfa96_1448x814.jpeg")[#image("assets/images/masonking/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F1f0a06f9-ee48-4705-aec8-3ef35a5bfa96_1448x814.jpeg.");]

Staying on the British theme that’s appeared this week, #strong[#link("https://kxc.org.uk/")[KXC];] has a spiritual formation program called Pattern. I’ve been following it for a few years, and really like the way they’ve laid out beginning, ongoing, and communal practices.

Check it out #strong[#link("https://www.pattern.org.uk/")[here];];.

#horizontalrule

== #strong[Thanks for Reading]
<thanks-for-reading>
#link("https://substackcdn.com/image/fetch/$s_!u18Q!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F63a8bac4-14bb-4eaa-a2f1-d33ce61fad54_1545x2000.jpeg")[#image("assets/images/masonking/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F63a8bac4-14bb-4eaa-a2f1-d33ce61fad54_1545x2000.jpeg.");]

If someone forwarded this to you, I write #emph[two] kinds of emails: one on select Tuesdays about life with God and the other every Friday, where I share things I’ve found during the week. If you want to subscribe but can’t afford it, #strong[#link("mailto:%20hellomason@pm.me")[email me];] , and I’ll take care of it—no questions asked.

I pastor, teach, and lead at #strong[#link("https://thevillagechurch.net/")[The Village Church] ,] serving as an Elder and the Executive Director of Discipleship. In my spare time \(ha!), I’m working on a Ph.D.~in Church History, studying Jonathan Edwards and character formation. Also, I’ve written #emph[#strong[#link("https://amzn.to/3t7rOd5")[A Short Guide to Spiritual Disciplines: How to Become a Healthy Christian];];];.

Thank you for reading and supporting my work as I seek to shepherd with compassion and wisdom, equipping people to embody God’s truth for all of life.

Talk soon, \
Mason

#link("https://masonking.substack.com/p/the-friday-five-21326#footnote-anchor-1-187110029")[1]

8 #emph[The Testament of Kohath] , quoted in Bailey, #emph[Jacob and the Prodigal] , 102.

9 Bailey, #emph[Jacob and the Prodigal] , 102.

Philip Graham Ryken, #emph[#link("https://ref.ly/logosres/rec63lu?ref=Bible.Lk15.11-24&off=38171&ctx=o+the+power+of+sin.%0a~The+real+humiliation")[Luke];] , ed.~Richard D. Phillips, Philip Graham Ryken, and Daniel M. Doriani, vol.~2, Reformed Expository Commentary \(Phillipsburg, NJ: P&R Publishing, 2009), 144–145.

#link("https://masonking.substack.com/p/the-friday-five-21326#footnote-anchor-2-187110029")[2]

John D. Hannah, #emph[#link("https://ref.ly/logosres/fobc83jnhannah?ref=Bible.1Jn3.2&off=1441&ctx=+yet+not+forever!).+~Isaac+Watts%E2%80%99+poem%2c+%E2%80%98")[1, 2 and 3 John: Redemption’s Certainty];] , Focus on the Bible Commentary \(Ross-shire, Scotland: Christian Focus, 2016), 127.

#horizontalrule

= Marriage, Family, and the Intellectual Life: Charles and Tessa Carman
<marriage-family-and-the-intellectual-life-charles-and-tessa-carman>
#emph[By mereorthodoxy | Feb 13, 2026]

= Marriage, Family, and the Intellectual Life: Charles and Tessa Carman
<marriage-family-and-the-intellectual-life-charles-and-tessa-carman-1>
== by Nadya Williams
<by-nadya-williams>
#strong[Feb 13, 2026]

#strong[Likes:] 0

#link("https://substackcdn.com/image/fetch/$s_!HaXg!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff69f73aa-9f2f-4229-b5bc-ed4f2530ddb3_1200x800.jpeg")[#box(width: 1200.0pt, image("substack2markdown_repo/assets/images/mereorthodoxy/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2Ff69f73aa-9f2f-4229-b5bc-ed4f2530ddb3_1200x800.jpeg"));]

The intellectual life is in some ways necessarily lonely–in his book on #emph[The Intellectual Life: Its Spirits, Conditions, Methods] , the French Dominican Friar Antonin Sertillanges insists that the intellectual life requires solitude. He is not wrong. Researchers in history, for instance, spend hours, days, years alone in mysterious musty basements, poring over documents that unveil their mystery to only the most persistent elect. And then the practice of writing takes additional hours \(and days and years) of discipline and solitude before the essays or books are ready to go out into the world. But not all Christians who live the intellectual life are professional scholars, first and foremost. And unlike Sertillanges himself, many are married and have children. Some#link("https://mereorthodoxy.com/how-to-have-a-day-job-and-an-intellectual-life")[might be lawyers] or pastors or doctors or missionaries or various professionals, or #link("https://www.plough.com/en/topics/life/parenting/the-stay-at-home-intellectual-mom")[stay-at-home moms];, or #link("https://thedispatch.com/article/motherhood-intellect-friedan-gender-children/")[homeschooling mothers];, or simply#link("https://comment.org/motherhood-and-the-intellectual-life/")[overwhelmed mothers] of small children. These factors definitely take a toll on the possibility of solitude.

In other words, for most people, there are also the practical considerations of the intellectual life and intellectual work, whether done on the margins of one’s day or full-time. Writers and other intellectuals are people too—they too must eat, do laundry, keep children alive, perhaps even vacuum on occasion. We all are bodies, as well as minds and souls. #emph[So how does this work, in particular, for households that include not just one intellectual but two?]

That is the basic question underlying this new interview series, which the interview below kicks off. All couples interviewed in this series are parents. How does this all come together? We can assume that both challenges and blessings emerge as a result. What are they? And how does this change at different stages of life?

Mere Orthodoxy is a reader-supported publication. To receive new posts and support our work, consider becoming a free Subscriber or paid Member. Members receive our quarterly print Journal and an invitation to our online community.

Subscribe

#horizontalrule

#strong[Nadya Williams:] I’d like to start by asking each of you to tell us a little bit about your intellectual journey: when did you first consciously realize that you are called to live an intellectual life? What did you envision this looking like? How has it turned out so far?

#strong[Charles Carman:] Looking back, a few moments occur to me, though I must admit that I didn’t really consider the direction I was tending as intellectual. I was homeschooled through high school, the oldest of seven children. It was a wonderful time, and I was fortunate to have found \(or to have been found by?) a young scholar pursuing a double masters in philosophy and theology. He took me under his wing, and his tutelage was a challenge that I was determined to pass. At times he took me to his courses at the seminary. I remember vividly the classes on Plato and Kant. The professor was amazingly clear and winsome.

You have to imagine what happens to a young man’s mind when he’s exposed to Plato’s third man argument or Kant’s analytic a priori at around the time he is learning to drive. My mentor suffered no fools, and entertained viciousness of any sort even less. In those years, I played soccer and football, and though no pro athlete, I was better than some. Yet the mental challenge and the demand for excellence I found in conversation and debate with my mentor drew me down the path of reading and pondering. All my closest high school mates went into the military, as I had originally planned to do, but then made a last-minute lurch toward philosophy and university. It took me some time to find my feet, and I have sometimes wondered what success I would have met, had I stayed the course and gone into the serious business of war.

Things continue to go better than expected. I consider myself fortunate in the opportunities I have had — going abroad \(sometimes with my wife and family) to learn other languages, studying under many excellent instructors, having the leisure to think and ponder. One of the greatest gifts has been the crew of friends found along the way.

The intellectual may live a solitary life in a lot of ways. Between going to a party and sculpting, the artist too may spend more time in craft than among the glasses and music, I suppose. But I can’t say the intellectual life has been at all hermetic in my experience: too many fierce arguments about metaphysics over a fire, too many play readings full of laughter, poetry readings chased with hours of reflection, too many last-minute gatherings and formal and informal dinners, too many cups of coffee and pinches of tobacco shared between co-conspirators, and too many letters, in balance with solitary hours spent staring into the middle distance or scribbling into the margin of the page.

#strong[Tessa Carman:] I really don’t think of myself as an intellectual—only as someone who likes, maybe #emph[needs] , to think through things, understand things, to deepen understanding partly through writing and conversation, and to make things: poems, stories, plays. Or just someone who loves books! As a kid I was interested at different stages in being an artist, teacher, and then writer, and I suppose that combination of things brings together the way-of-being-in-the-world that I’ve grown into ever since. I’ve always needed to figure things out. \(I did have a brief stint in my teen years where I thought I had figured it all out already, so I just needed to write out all the answers in a book, covering social life, politics, etc. Thankfully that stage passed.)

Age fifteen was a significant time for me, since I read a lot of things that would shape me ever after—and also on topics that I continue to be occupied with: education, technology, fairy tales, theology, poetry, British novels, theater. I was being homeschooled at the time after being in small Christian schools since first grade, and I think I felt rather free because of that. So I read and read whatever I wanted.

I think my idea of my life turned out rather similar to whatever dreams I had in high school, amazingly enough! I wanted to continue to read and write and make stories, and I wanted to resist the vision of adulthood that I often received from well-intentioned adults: of a life where one grimly set oneself to the wheel of the workaday world, and didn’t really have time for adventures or thinking, just being all "realistic" and paying bills.

But thankfully, I found other people who were weird like me in college, and there was even a fellow who thought like no one else—beautifully, precisely, generously. He was a fellow traveler at the very least, and then he became someone with whom I wanted to build a home and a family.

Maybe this is easier for the feminine spirit, but I never liked an over-specialized or utilitarian view of school or reading, such that I wanted to study things because the world is interesting, and we have a duty to have many interests and relations with the world—and maybe that’s why I liked what I read of Charlotte Mason so much.

At college I majored in Politics, Philosophy, & Economics, even though I would have been an English major most anywhere else.

Marilynne Robinson says somewhere that she read political, economic, and philosophical works not despite the fact that she wrote novels but because of it. Who wants to read a novelist who doesn’t understand how some of the basic relations of human life work? I liked that attitude. And also that she liked to read things for herself instead of taking received opinion. We can’t do that all the time, but when we can, we ought, and when we can’t, we ought to be a lot more modest in our opinions.

#strong[Nadya Williams:] What kind of intellectual work does each of you do now, and what role does it play in your day-to-day life?

#strong[Charles Carman:] I teach in the humanities at Regent University. My time is split between papers, articles, reading, teaching, preparing new courses, mentoring students, and too many other things.

#strong[Tessa Carman:] Charles is more so the professional intellectual since he’s a university professor, and I do the creative/intellectual work of helming the education of our kids, as well as teaching \(mostly online right now), and writing whenever I can. We always have conversations going on. There are things that are more the other’s purview—for instance, Charles leaves me in the dust when it comes to metaphysics, and he can go way deeper with his philosophy guys—but we’re able to keep each other fairly in the loop of what we’re both thinking about, which always blends into other parts of life. Neither of us would have been able to deal well with being married to someone who wasn’t someone we could talk to!

#strong[Nadya Williams:] What role has your intellectual life played in your marriage and family life? Do you find that it affects your interactions with each other and with your children? If so, in what ways?

#strong[Charles Carman:] You may safely invite an intellectual to dinner and find comfort in the fact that he will eventually have to leave. Living with an intellectual requires circumspection. Now marry him or her, add a growing pile of children, and what follows would count as the best and strangest sort of scandal to shock the public.

To explain to one’s child medieval cosmology \(and tell them that there’s truth in it, scientism be damned); to answer when a child asks, "What’s red dye doing in our food?" with "It’s poison," and they ask why on earth do we put poison in our food, and reply with a brief excursion into the history of industrial agriculture, leading the dialogue to the very edge of a longer discussion on the industrial revolution; to read aloud #emph[The Lord of the Rings] to your 8 and 10 year old \(with the 3 year old and infant in attendance) and fail to tell of Theoden King’s parting without saltwater in my eyes; to introduce your children \(the same 10 and 8 year old) to parliamentary style debate and rhetorical structure and figures of speech and find later those very weapons of war turned on you, the benevolent gift-giver; to hear the selfsame children speak to the clerk at the grocery store thus: "I am fairly confident I have a good idea where the two hidden turtles are; if I tell you, might we receive the promised lollipops?"; to work out some question of philosophy, theology, literature, politics with one’s wife, which at times can get heated, in disagreement or agreement; to realize that spelling out a word is a hopeless method for keeping something secret from the precocious little puzzlers and making recourse to riddling metaphors which only urges them more forcefully to decipher out the meaning; to speak Latin with my children in public, and when asked what language I’m speaking to them, replying with, "Old Italian"; to read and hone each other’s essays and poems with the kind of brutal honesty that deep intimacy offers; to read the fairy tales written by our eldest daughter, celebrating and praising how the logic of fairyland is coursing through her spiritual blood at inebriating levels; to enter the silent living room, on the way to refill one’s coffee cup, and finding the 10 and 8 year half way through a book, while the 3 year old has open in her own lap a copy of #emph[The Silmarillion] , turning the pages with a determined seriousness to do precisely what her siblings are doing; to watch Hitchcock’s #emph[The Man Who Knew Too Much] with all the kids, which if you haven’t watched it yet is #emph[some] movie to watch with a 10 & 8 year old \(and a three-year-old who has learned that apparently the phrase, "He’s dead" is something to say very casually when watching movies); to live in words and in woodworking and in house-holding and in common with friends week in, week out.

#strong[Tessa Carman:] Well, I’m always thinking about books! And I’m always thinking about education, which is a really practical question not only for our children but ourselves. Education is really about how we humans can live well, how we ought to be formed, and how we ought to form ourselves and our societies—how we ought to live. So I suppose if one is concerned with how to live more deeply into Christ, and how to best take care of and enjoy and appreciate and understand the things God has made and has given us, that affects every part of our lives.

#strong[Nadya Williams:] What are some challenges you have found to your intellectual pursuits so far? How did you resolve these, or are you still living through them? What expectations did you have for your intellectual life before you were married, and how do you think these have adjusted over time and with circumstances?

#strong[Charles Carman:] I am fortunate to teach at a university where I enjoy the students and enjoy my colleagues and have some time to write. But broadly speaking, the intellectual life within a family requires patronage and land. We make it work, and it’s a mystery to me how we do it at times. It takes a lot of sharing responsibilities and time with the children, a lot of patience and grit. I’m not sure what I expected, or if my fantasies were either very interesting or well-formed.

Without going into it all, the intellectual family is, like any other rich family existence, ill-fitted to the way the world is shaped right now. It requires a scrappy attitude and friends for whom you can carry burdens and with whom you can celebrate victories, at least.

#strong[Tessa Carman:] I gained a lot of confidence in getting married! And when we had our first child, I felt more confidence about writing, too, especially stories. I wanted to write for my children, as well as for our friends.

I think the challenge is always how to live with due attention to one’s duties, and to creatively adjust to what life demands at the time, and finding time for contemplation. Every season is a little different. Looking back, I did imagine having a rich life of enjoying and discovering the beauty of God’s world with my family, and that’s exactly come to pass!

#strong[Nadya Williams:] I’d love to hear your pie-in-the-sky dream: What do you each dream about in your intellectual lives in the future? How do these dreams work together?

#strong[Charles Carman:] My pie has been the same since my second year in college. We live with our friends, within walking distance of each other’s homes. We all have gardens and animals and things to build and do with each other. We are all patronized and competent such that we needn’t worry about much labor but what we want to do. We write plays, poems, stories, books. We invite others to stay at our guest cabin. We host conferences and events. There is an amphitheater for community plays and folk concerts. There is a library building. There is a root cellar. Our children learn to ride horses and write in ancient languages. Our boys read of Charlemagne in the evening and hunt in the morning, our girls sew and dance and recite poetry.

#strong[Tessa Carman:] We have some writing projects we want to do together—some translation work, perhaps a children’s book. It would be wonderful to research a book together at the Bodleian. I think our big dream is simply to continue to make things as a family and to learn more things—woodworking, home preserving, cooking, music making—that we can enjoy together. I’d love to direct a play with our kids in it. \(Our girls have been working on a living room #emph[Les Miserables] ballet—maybe one day they can take that on the road!)

Folk art and skills are inseparable, for me, from what’s deemed "intellectual" work. The agricultural and manual arts are intertwined with what we deem "the life of the mind." We are embodied beings, after all, and we were made for the "low" or common things—making and breaking daily bread together—and the "high" or more uncommon things—singing psalms and taking the Eucharist. We were made to seek wisdom together, and books happen to keep alive that wisdom for generations. I’m grateful for friends that I can speak to or write in person, and also for those who’ve left behind their writings. We’re called to keep the flame alive, and to become flame ourselves.

Subscribe

#horizontalrule

= Have No Darlings
<have-no-darlings>
#emph[By phyliciamasonheimer | Feb 13, 2026]

= Have No Darlings
<have-no-darlings-1>
== on my writing process
<on-my-writing-process>
#strong[Feb 13, 2026]

#strong[Likes:] 0

#link("https://substackcdn.com/image/fetch/$s_!6YhO!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fcd1ab0ff-d17a-4c19-9b58-fc78d78e23aa_3024x4032.heic")[#box(width: 1456.0pt, image("substack2markdown_repo/assets/images/phyliciamasonheimer/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2Fcd1ab0ff-d17a-4c19-9b58-fc78d78e23aa_3024x4032.heic"));]

In his 1916 book on writing Sir Arthur Quiller-Couch advised writers to "murder their darlings" — to remove writing, even beautiful writing, that doesn’t further the author’s story.

Thanks for reading Every Woman a Theologian! Subscribe for free to receive new posts and support my work.

Subscribe

This post contains a glimpse of my writing process. Having read multiple books by writers \(e.g.~Anne Lamott, Stephen King) I’ve realized that the writing "process" looks little like a process at all. Very few writers have strict systems, a mathematical approach to their work; from what I’ve read most writers are chaotic, struggle with writer’s block, and painfully put words on a page. I relate to this. My process is not highly organized and I miss deadlines more often than I wish. Yet my work would not exist if I waited for inspired moments to do it. At the end of the day a writer must #emph[write.]

\(Writing about writing makes me nervous. This is an unedited, unproofed blog post written one-handed \(I had to feed the baby). For a look at writing I’m actually proud of, please see #emph[#link("https://phyliciamasonheimer.com/bible-study/")[Every Woman a Theologia] n.)]

Perhaps the most offensive part of my writing process, at least to the enneagram fours reading this, is my departure from Sir Arthur’s quippy advice. I don’t murder my darlings. I don’t murder them, because #emph[I don’t have any.]

+ #strong[Have No Darlings.]

I hold my writing very, very loosely. I don’t get emotionally attached. I love my editors. I thrive on their feedback and would honestly prefer to have an editor sitting at my elbow taking pages from my hand as they come off the \[imaginary\] typewriter. As I’ve considered this trait, I’ve wondered if it’s a product of my education. I was homeschooled and my mother was my first editor. She went over my papers, poems and pieces with a fine tooth comb and a red pen. I got personalized, hard feedback on what I wrote. I wasn’t coddled — but I was equipped to succeed. I became comfortable with pushback on my writing. This has been an advantage in the publishing world.

Having no darlings is easier, I think, in my genre of Christian nonfiction. But I also think writers have a tendency to involve ego in their work; to think their pen better than most, or better than some, or just #emph[better];. I appreciate a compliment on my writing as much as the next person, but my goal is not to be perceived as a "writer", a "career writer", or even a #emph[great] writer. My goal is to communicate the truths of God with such winsomeness the most hardened atheist will pause to hear. When I write, I don’t think about the writing. I think about the person reading it. And if my words aren’t framed in the best way to reach them, those words can die.

#link("https://substackcdn.com/image/fetch/$s_!U-93!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb84b3778-3477-43d5-b2ad-accc7d17a342_1500x2000.heic")[#box(width: 1456.0pt, image("substack2markdown_repo/assets/images/phyliciamasonheimer/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2Fb84b3778-3477-43d5-b2ad-accc7d17a342_1500x2000.heic"));]

#block[
#set enum(numbering: "1.", start: 2)
+ #strong[Write On Command.]
]

This second part is the product of long term discipline. There are days I simply #emph[do not want to write] but my projects and deadlines cannot be ignored. In a given week, my writing schedule looks like this:

- "big" publishing deadline — traditional book contract with six month lead time

- in-house publishing deadline \(for Every Woman a Theologian, aka self publishing) — usually a verse-by-verse Bible study

- short as-needed writing work — introductions to books that have been edited for re-launch, copy for marketing pieces, applying developmental edits

- Substack articles like this one — I try to write one a week on writing or motherhood

- Two emails a week — our newsletter on Tuesdays and a "Friday Favorites"

- Podcast outline for the next week’s recording — this includes research for the episode, writing the outline, then recording in my studio/office

- Teaching notes for live Bible study sessions — if I’m teaching live at my church or home, I research and write a session each week

This does not include social media, if I’m engaging there.

When I started out as a blogger and writer I was very long-winded. I was also impulsive. I wrote when I felt inspired and if I didn’t feel like writing, I just didn’t write.

But if writing is what you want to do for a living, there comes a point where, in order to live, you #emph[must write];. You must #emph[command] yourself to write. Thus somewhere in my mid-twenties, when I started being paid for my writing and compiling ebooks \(how I started self publishing) I learned that writing was a discipline before it was an art. You can’t write from emotion alone. The emotions catch up to the discipline.

Now I write on Wednesday, Thursday, and Saturday afternoons. Afternoon is not my favorite time to write. It’s not the best time for my brain. It’s not "ideal". But it’s what I have, because I’m homeschooling in the morning, I’m up with a baby at 4 am, and we have set family rhythms for evenings. Mondays I am at our co-op, Tuesdays I have meetings all day, Fridays I record podcasts. This leaves three days and any spare bits of time elsewhere in the week.

Sometimes being a writer is quite unromantic, but the romantic part is that you actually make a living writing — and that has to be enough.

#link("https://substackcdn.com/image/fetch/$s_!51Fk!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F017bfb9b-2165-44f1-bcae-e3ada9c896f4_2637x3516.heic")[#box(width: 1456.0pt, image("substack2markdown_repo/assets/images/phyliciamasonheimer/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2F017bfb9b-2165-44f1-bcae-e3ada9c896f4_2637x3516.heic"));]

#block[
#set enum(numbering: "1.", start: 3)
+ #strong[Outline everything.]
]

Though I do occasionally jot down post ideas or lines of poetry to work on later, most of my work starts out looking like a high school research paper:

#strong[introduction]

#strong[points a, b, c]

#strong[conclusion]

This structure acts like a coloring book page: all I have to do is color inside the lines. I can also stop and start easily, which I have to do in my season — I am typing this sentence one-handed as I nurse my five month old. \(Please note the three points in this article; if I’m one thing, it’s consistent!)

I speak from outlines. All my books start as outlines. Each chapter is also outlined, usually with 3-5 points based on a key text. The only thing I don’t outline are verse by verse Bible studies. These follow the structure of the text itself.

This is not original to me; most writers outline before writing, I imagine. I do it mainly for organization of thought but also for the convenience of working in short, achievable chunks \("just point B today") that leave a clear stop/start point. This is especially helpful for mother-writers who are primary caregiver to young children, as I am, but I did this when I was working outside the home using lunch breaks, too. It served me well across seasons.

While there are more pieces to my process — lighting a specific scented candle when I write, taking breaks every 20-30 minutes — the above three are my core. I admit I am a fast reader and a fast writer, so sometimes I leave a piece to fester for a few weeks and don’t look at it until I have fresh eyes. I use that time to do further research if it’s an in-depth piece versus opinion. Right now I’m working on a study on spiritual gifts, so I write in short increments based on my outline but do extra research in between writing sessions. I edit with that research in mind.

The more I write this, the less I see a process and the more I see a mess, but I hope a portion was helpful to your own writing journey.

#horizontalrule

#emph[I will pause here and save the rest for a future three-point essay. If you enjoyed this, subscribe to follow along for future pieces on self publishing, marketing as a Christian writer, homeschooling and theology.#link("https://phyliciamasonheimer.com")[Bookstore here!];]

Thanks for reading Every Woman a Theologian! Subscribe for free to receive new posts and support my work.

Subscribe

#horizontalrule

= What’s the most important book in the New Testament?
<whats-the-most-important-book-in-the-new-testament>
#emph[By zacharywagner | Feb 13, 2026]

= What’s the most important book in the New Testament?
<whats-the-most-important-book-in-the-new-testament-1>
== POLL – i.e.~please vote and tell me what you think!
<poll-i.e.-please-vote-and-tell-me-what-you-think>
#strong[Feb 13, 2026]

#strong[Likes:] 0

#link("https://substackcdn.com/image/fetch/$s_!cuUc!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F9dc012de-8c76-4eb7-a781-b79ecba3f106_1920x1005.jpeg")[#box(width: 1456.0pt, image("substack2markdown_repo/assets/images/zacharywagner/https_3A_2F_2Fsubstack-post-media.s3.amazonaws.com_2Fpublic_2Fimages_2F9dc012de-8c76-4eb7-a781-b79ecba3f106_1920x1005.jpeg"));];#link("https://unsplash.com/photos/an-open-bible-on-a-wooden-table-AifIWm8GBME?utm_source=unsplash&utm_medium=referral&utm_content=creditShareLink")[Tim Wildsmith] on Unsplash

Hello friends. I’m conducting a very unscientific poll to see what folks think is the single most important book of the New Testament. I’ve been chewing on some thoughts around this topic, and I’m hoping I can use and reflect on the responses to this poll in a future article.

A few ground rules/preliminary comments.

- Please only vote once! The poll is split into five smaller polls since Substack only lets me give up to five options per.

- The question is intentionally vague and is meant to invite your specific response/interpretation. Feel free to supply your own reason in your mind for #emph[why] this book is the most important \(e.g.~has had the greatest impact on history, has shaped NT interpretation the most, balances out the NT in some important way, gives an important summary or overview of some doctrine, includes an important event, has been meaningful to you personally… etc. etc.).

- Anyone can respond! Believers, nonbelievers; Protestants, Catholics; pastors, laypeople; scholars, skeptics. Please feel welcome to chime in.

- I combined a few of the options… honestly I can’t imagine anyone answering Jude or 3 John by itself.

- If you have a moment, please leave a comment explaining your answer \(and maybe a little bit about yourself and your background).

- Please also consider sharing / restacking to help me get more responses! The more people answer, the more interesting the data set will gets for everyone.

- If you’re curious about my thoughts on the responses, go ahead and subscribe/follow so you can hear about it when I post them in the coming days.

#link("https://zacharywagner.substack.com/p/whats-the-most-important-book-in#poll-449008")[]

Loading…

#link("https://zacharywagner.substack.com/p/whats-the-most-important-book-in#poll-449009")[]

Loading…

#link("https://zacharywagner.substack.com/p/whats-the-most-important-book-in#poll-449010")[]

Loading…

#link("https://zacharywagner.substack.com/p/whats-the-most-important-book-in#poll-449013")[]

Loading…

#link("https://zacharywagner.substack.com/p/whats-the-most-important-book-in#poll-449016")[]

Loading…

Thanks all. If you’d like to be notified when I post my reaction to the poll results in the coming days \(or if you’re simply interested in following my work), please subscribe \(for free) below.

Subscribe

#horizontalrule
