---
layout: default
title: Blog
---

<h2 style="display: flex; align-items: center; gap: 16px; flex-wrap: wrap; margin-bottom: 0;">
  <span>Blogs ({{ site.posts | size }})</span>
  <a href="/feed.xml"
     aria-label="Subscribe to RSS feed for new blog posts"
     style="display: inline-flex; align-items: center; gap: 8px;
            padding: 8px 18px; background: #F8F5EE;
            border: 2.5px solid #1A1A1A; border-radius: 12px;
            text-decoration: none; color: #1A1A1A;
            font-family: inherit; font-size: 0.8rem; font-weight: 700;
            letter-spacing: 0.5px; text-transform: uppercase;
            box-shadow: 0 3px 0 #1A1A1A;
            transition: all 0.2s ease; cursor: pointer;
            position: relative;"
     onmouseover="this.style.boxShadow='0 5px 0 #1A1A1A'; this.style.transform='translateY(-2px)'"
     onmouseout="this.style.boxShadow='0 3px 0 #1A1A1A'; this.style.transform='translateY(0)'"
     onfocus="this.style.outline='3px solid #FFB800'; this.style.outlineOffset='3px'"
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
This loop automatically lists all posts in _posts/, sorted by date (newest first).
{% endcomment %}

<ul style="list-style: none; padding-left: 0;">
  {% for post in site.posts %}
  <li style="margin-bottom: 1em;">
    <div style="color: #888;">{{ post.date | date: "%b %-d, %Y" }}</div>
    <a href="{{ post.external_url | default: post.url }}" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      {{ post.title }}
    </a>
  </li>
  {% endfor %}
</ul>

---

<footer>
  <div style="text-align: center; padding: 20px; margin-top: 40px;">
    <p>&copy; 2025 Shravan Reddy</p>
    <div style="margin-top: 10px;">
      <a href="https://github.com/NShravanReddy" style="margin: 0 10px; text-decoration: none; color: #333; font-size: 24px;">Github</a>
    </div>
  </div>
</footer>