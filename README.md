# csg-revamp
# The CSG you know and love, revamped!

## Overview
Who remembers CSG? I'm pretty sure we all do. It was *that* server always involved or associated with drama of sorts. Whether it be CIT or SAUR, they *were always* at war with somebody. Hell, they even all fought each other at point. Most notably, it was one CIT ripoff that gained quite a lot of success. I would say it was the most successful of all the ripoffs at the time.

## History Lesson
Founded in 2011 by Dennis (UniOn) and UniQ, CSG was released in July of 2012. On the release, CSG experienced a peak of around 300 players which overloaded the budget VPS at the time. Needless to say, the release was highly anticipated as it received a lot of hype around CIT, the largest server at the time, and still today.
The average player count was a lot less than 300 but the server still had a loyal player base, which was not anywhere near small. The server was continually developed in versions, from beta, to 1.x and to the final 2.x versions. However, development on CSG took a radical turn in 2013 when Will and Callum took power of CSG. They began to clone features of SAUR, and implement them within CSG. Soon after, Will leaked the resources publically and Sensei took CSG back. With the help of Soap, Sensei managed to salvage CSG.
Sensei began to make even more radical changes to the server. He and Soap renamed it to NGC and began a major overhaul. The months that came after January and February of 2014 were to sent CSG/NGC were the start of a downspiral. Sensei leaked NGC's scripts and database, leaving it open for everyone. A few other CSG and NGC clones were made after that, but only NGC (which is now supported by Sensei himself) really managed to gain traction and stability, with the rest dying off or shutting down.

## What to expect
Now these resources are the last of what is left of the "original" CSG game mode. The 'original' branch was from January 2014, and did not include the radical changes made by Will in late 2013, as he kept those to himself. The 'master' branch is full of resources that have been updated. Updates will be purely in code cleanup/readability and bug fixes. There will be no new gameplay features or additons.

## Notes
- You are able to commit to this. I'm leaving it open for everyone. Though, your commits must be purely bug fixes or purely code cleanup. No new features.
- Not every commit will be tested. So, with saying that, if you're going to use this, be very cautious. If commits are untested, they will contain a "[UT]" prefix.
- The plan is to preserve CSG as closely as possible. We want to keep it original and pure to what it was. So no major changes to game values or meta.

## Commits
- All commits should be on per a resource basis, so do not modify multiple resources in one commit.
- Include [resourceName] in the commit title.
- [UT] means untested. This is for actual code changes, so don't use it on code cleanup commits. Use it for resource merges or bug fixes, if they are untested

## Current Status
- Most things tested save correctly. Staff members, bans, some server settings, accounts, groups etc. Turfs, some player stats (not account data), job ranks etc do not currently save. I'm working on it.
- We are nearing a stable release. That is, a release where everything just works easily and with no hassles. That is coming soon.
- The database is still edging. The copy I have does not contain the `turfing` or `playerstats` tables. That sole fact has put the revamp further back than I would have liked. `playerstats` stores things like job ranks, muscle, CJ (I think), weapon stats and more. `turfing` contained all the turf coordinates. I'll need to get my hands on a database with them or remap them.
- The codebase and resource structure is still messy. That is precisely what 2 years of lazy development does. People carelessly created new resources with peculiar names similarities between other resources. It has created a complex web that still needs time to restore to an acceptable state.
- There are a lot of bugs within the code that were never fixed in CSG, or that have been fixed in NGC.
- There is no documentation on anything. I will be working on that.
