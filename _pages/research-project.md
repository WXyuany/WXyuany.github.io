---
layout: academic
title: "Research Project"
permalink: /research-project/
---

<section class="academic-section academic-section--first">
  <h2>Research Project</h2>
  <div class="academic-copy">
    <p>This page presents selected research and engineering projects.</p>
  </div>

  <div class="academic-projects">
    {% for project in site.data.research_projects %}
      <article class="academic-project">
        <details>
          <summary>{{ project.title }}</summary>
          <div class="academic-project__body">
            <p class="academic-project__description">{{ project.description }}</p>
            <img class="academic-project__gif" src="{{ project.video | relative_url }}" alt="{{ project.title }}" loading="lazy" decoding="async">
          </div>
        </details>
      </article>
    {% endfor %}
  </div>
</section>
