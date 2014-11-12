Feature: Starting the game
  In order to play battleships  
  As a nostalgic player
  I want to start a new game

  Scenario: Registering
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"
    Then I should complete a form

  Scenario: Player Does Not Input Name
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"
      But I do not input my name

  Scenario: Player places ships
    Given I am on the homepage
    When I follow "New Game"
    Then I should complete a form
    Then I see positioning options
    Then I should submit my choice

  Scenario: Player has chosen 0,1
    Given I am on the homepage
    When I follow "New Game"
    Then I should complete a form
    Then I see positioning options
    Then I should choose "0" from x-co-ordinate


    

