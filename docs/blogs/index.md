---
layout: default
title: Blogs
---

<h2 style="display: flex; align-items: center; gap: 16px; flex-wrap: wrap; margin-bottom: 0;">
  <span>Blogs ({{ site.posts | size }})</span>
  <a href="/feed.xml" class="rss-btn"
     aria-label="Subscribe to RSS feed for new blog posts"
     title="Get notified when I publish new blog posts.">
    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
      <path d="M4 11C9 11 13 15 13 20" stroke="#E85D2C" stroke-width="2.5" stroke-linecap="round"/>
      <path d="M4 4C13.5 4 20 10.5 20 20" stroke="#E85D2C" stroke-width="2.5" stroke-linecap="round"/>
      <circle cx="5.5" cy="18.5" r="2.5" fill="#E85D2C"/>
    </svg>
    Subscribe via RSS
  </a>
</h2>

{% comment %}
Group all posts by publish year (newest first) and list them per year
with a short excerpt under each title.
{% endcomment %}

{% assign years = site.posts | group_by_exp: "post", "post.date | date: '%Y'" %}
{% for year in years %}
  <h3>{{ year.name }}</h3>
  {% include post-list.html posts=year.items %}
{% endfor %}