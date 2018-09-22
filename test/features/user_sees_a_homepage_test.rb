require './test/test_helper'
require 'pry'

class HomepageTest < CapybaraTestCase
  def test_user_can_see_the_homepage
    visit '/'

    assert page.has_content?("Welcome!")
    assert_equal 200, page.status_code
  end

  def test_404_status_code_is_recieved_when_visting_a_file_that_doesnt_exist
    visit 'kljf'

    assert_equal 404, page.status_code
    assert page.has_content?("Page not found.")
  end
end
