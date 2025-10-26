---
layout: default
title: Blog
---

## Posts

{% comment %}
This loop automatically lists all posts in _posts/, sorted by date (newest first).
{% endcomment %}

<ul style="list-style: none; padding-left: 0;">
  {% for post in site.posts %}
    <li style="margin-bottom: 1em;">
      <div style="color: #888;">{{ post.date | date: "%b %d, %Y" }}</div>
      <a href="{{ post.url | relative_url }}" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
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
      <a href="https://x.com/nshravanr" style="margin: 0 10px; text-decoration: none; color: #333; font-size: 24px;">X</a>
    </div>
  </div>
</footer>