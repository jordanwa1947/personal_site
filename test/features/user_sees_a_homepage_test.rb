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

  def test_that_about_is_visited_with_about_path
    visit 'about'

    assert page.has_content?("About Me!\nHere's some stuff to know.")
  end
end
