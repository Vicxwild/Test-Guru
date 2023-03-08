module ApplicationHelper

  FLASH_TYPES = { notice: 'alert-success', alert: 'alert-danger' }.freeze

  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to 'TestGuru project', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages
    flash.map do |flash_type, message|
      content_tag :p, message, class: "alert #{FLASH_TYPES[flash_type.to_sym]}"
    end.join.html_safe
  end

  def icon(name, text)
    content_tag :i, text, class: "bi bi-#{name}"
  end

  def switch_language
    I18n.locale == :ru ? url_for(lang: :en) : url_for(lang: :ru)
  end
end
