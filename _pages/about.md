---
layout: academic
permalink: /
title: ""
redirect_from:
  - /about/
  - /about.html
---

<section class="academic-section" id="introduction">
  <h2>Introduction</h2>
  <div class="academic-copy academic-introduction">
    {{ site.data.profile.home.intro | markdownify }}
  </div>
</section>

<section class="academic-section" id="research-interests">
  <h2>Research Interests</h2>
  <div class="academic-copy academic-research">
    {{ site.data.profile.home.research_intro | markdownify }}
    <ul class="academic-list">
      {% for area in site.data.profile.home.research_areas %}
        <li>{{ area }}</li>
      {% endfor %}
    </ul>
  </div>
</section>

<section class="academic-section" id="publications">
  <h2>Publications</h2>
  <div class="academic-publications">
    {% assign featured_publications = site.publications | where: "featured", true %}
    {% for post in featured_publications reversed %}
      <article class="academic-publication">
        <p class="academic-publication__title"><a href="{{ post.url | relative_url }}">{{ post.title }}</a></p>
        <p class="academic-publication__meta">{{ post.citation | default: post.venue }}{% if post.date %} ({{ post.date | date: "%Y" }}){% endif %}</p>
        <p class="academic-publication__links">
          {% if post.paperurl %}<a href="{{ post.paperurl }}">[Paper]</a>{% endif %}
          {% if post.slidesurl %}<a href="{{ post.slidesurl }}">[Slides]</a>{% endif %}
        </p>
      </article>
    {% endfor %}
  </div>
</section>

<section class="academic-section" id="awards">
  <h2>Awards</h2>
  <div class="academic-copy academic-awards">
    {% if site.data.profile.home.awards and site.data.profile.home.awards != empty %}
      <ul class="academic-list">
        {% for award in site.data.profile.home.awards %}<li>{{ award }}</li>{% endfor %}
      </ul>
    {% else %}
      <p class="academic-muted">Awards will be added here.</p>
    {% endif %}
  </div>
</section>
