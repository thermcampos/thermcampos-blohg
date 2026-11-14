AI Skills Like a Pro
====================

.. tags: AI, skills, programming
.. attachment-image:: ai-skills-like-a-pro-header.png

Hello hello! In this post I want to talk about `Matt Pocock's skills`_ set
that was specifically designed for us, programmers. I don't often
talk about AI here, but this is important. I can't say where you are at
in the AI age, but this is the bare minimum acceptable and expected for
a professional software developer in 2026.

That said, I'll be giving you a bit of context, the commands to get
the skills installed on your local dev environment and which ones I use on
my setup. It's not hard, but I believe it's nice to get a perspective from
someone else. Let's jump in.

.. _`Matt Pocock's skills`: https://aihero.dev/skills
.. read_more

context
-------

It's really hard talking about AI these days. I feel there's a lot
to say, but at the same time, the internet is flooded and maybe saturated with
this topic. For the purpose of this small guide, let's keep it simple.

In 2026 it is expected that software engineers have a good understanding about
AI, a two-letter word that carries a lot of weight. You don't need to master everything,
that would be crazy. But if you're coming from the old days, or just don't want
to follow the bubble, you should at least be able to code, or rather, guide
agents to do the coding, while you do the engineering, orchestration, and
architecture.

AI agents are fast, and somewhat cheap (debatable). As engineers, we're not
supposed to be coding anymore, instead, we provide LLMs with a good environment, also
called harness, to do the job. This is what I'll be showing you here.

getting started
---------------

Let me be direct. Getting started is simple, all you need is to run the
following command on your terminal. Oh, this needs **node** and **npm**, in case you
don't have them, follow this guide: https://dev-station.tech/install-npm-and-nodejs/

.. code:: bash

   npx skills@latest add mattpocock/skills

The above command will ask you to agree to the package installation, type **y** if
you agree. I expect you will.

Then you will be provided a list of skills to be installed. There's a lot. The
skills selection can vary depending on your usage, daily workflow, and team size.
For example, If you work with Jira or GitHub, if you have a more structured
workflow on your team, or work alone.

I won't go over all the skills, it's a lot and they get updated often. For this,
you should read Matt's page directly, here: https://aihero.dev/skills

Then it'll prompt you the target agents, such as OpenAI, Codex, Claude Code,
Crush and so on. Choose the ones you use.

Then it'll ask you **where to install the skills**. This step is important. Choose
your user directory if only are the sole user. In another words, if you need to run
cloud agents that will clone the repo on the run, you might choose installing inside
the repo, so the skills get visible for sandboxed agents.

That's it. The skills are in place. We're ready to move on to the next step. Now,
let me share which ones I use.

which skills I use
------------------

Disclaimer: these skills and usage are for my personal projects, solo learning
and research work. At work I have a different workflow,
similar, but not quite as it is presented here.

In general, I follow these simple steps:

1. Grill a feature, change or bug fix. This step includes scanning the repo,
   confirming assumptions, and clarifying any questions that come up when
   cross-referencing the idea against the repo's current state. Usually it involves
   handling trade-offs and making decisions.
2. Then I ask for a ticket (Jira, GitHub issue, or spec MD file). I always run
   these two steps in the same context window. All technical notes, findings,
   and relevant information should be persisted to another agent later.
3. In a new context window (use /new or /clear or equivalent), I ask for the
   implementation based in the ticket description. The context change is key
   here, since agents tend to produce slop in long contexts.
4. Also in the same context as the above, I ask for the PR. Here, I like to
   ask for QA steps. This is crucial for me, because AI sometimes makes mistakes
   and by QA'ing is how I catch bugs.
5. In a new context again, I ask for the review. The new context matters here
   because the agent can get biased, and there's the slop problem for long
   running sessions. But I'll be honest. I only ask for review for big changes.

So in order, I use these skills:

1. grill-with-docs - https://aihero.dev/skills-grill-with-docs
2. to-tickets - https://aihero.dev/skills-to-tickets
3. implement - https://aihero.dev/skills-implement
4. code-review - https://aihero.dev/skills-code-review

All these are part of what Matt Pocock calls **The Main Flow**.

This is what I wanted to share today. If you have questions or comments,
use the section below and share your thoughts. I'd love to read them.

That's all for today. Until next time.

