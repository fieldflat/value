module ApplicationHelper

  # ページタイトルを設定する
  def full_title(page_title = '')
    base_title = "Value"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def display_string(str = '', max_length = 8)
    if str.length <= max_length
      str
    else
      str[0..(max_length-1)] + "..."
    end
  end
end
