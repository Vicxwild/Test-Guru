module ApplicationHelper

  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to 'TestGuru project', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages
    flash.map do |key, message|
      content_tag :p, message, class: "flash #{key}"
    end.join.html_safe
  end

  def icon(name, text)
    content_tag :i, text, class: "bi bi-#{name}"
  end
end
