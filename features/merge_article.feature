Feature: Merge article
  As a blog administrator
  In order to combine similar articles
  I want to have merge article functionality

  Background: articles in database

    Given the blog is set up
    And I am logged into the admin panel

    Given the following articles exist:
      | title            | author    | body |
      | Hello World!     | Mr Typo   | abc  |
      | Merge into Other | johnnymo  | def  |
      | Merge into Me    | jennytuch | ghi  |
      | Team Solo Mid    | TheOddOne | jkl  |

    # Oddly enough, ids are 1,3,4,5 ... 2 is skipped.
    Given the following comments exist:
      | author         | body        | article_id |
      | Jiminy Cricket | Chirp Chirp | 3          |
      | SaintVicious   | AY-YO SON   | 4          |

  Scenario: Merge one article into another
    Given I am on the Manage Articles page
    When I go to the Edit page for the "Merge into Other" article
    Then I should see "Merge Articles"
    When I fill in "Article ID" with "3"
    And I press "Merge"
    Then I should be on the admin content page
    When I go to the show page for "Merge into Me"
    Then I should see "def" and "ghi" in consecutive paragraphs
    And I should see the comment "Chirp Chirp" by "Jiminy Cricket"
    And I should see the comment "AY-YO SON" by "SaintVicious"

