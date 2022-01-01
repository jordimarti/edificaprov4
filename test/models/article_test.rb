require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "should not save article without title" do
    article = Article.new
    article.channel = channels(:one)
    assert_not article.save, "Saved the article without a title"
  end
end
