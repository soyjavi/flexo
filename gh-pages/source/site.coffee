$ ->
  sections = []
  for section in $ 'article section'
    id = $(section).attr( 'id')
    sections.push id: id, top: section.offsetTop if id

  links = $('aside > ul > li > a')
  $('article').scroll (event) ->
    scroll = event.target.scrollTop
    links.removeClass 'active'
    for section, index in sections when scroll >= section.top
      unless scroll >= sections[index + 1]?.top
        links.filter("[href=##{section.id}]").addClass 'active'
