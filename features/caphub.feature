Feature: Caphub
  In order to deploy multiple projects
  As a CLI
  I want to a comfortable set of commands to maintain different applications

  Scenario: Creating with standard ruby (1.8)
    When I run `caphub test`
    Then the output should contain "Copying the desired .rvmrc template for 1.8 to .rvmrc"

    When I run `caphub test`
    Then the following files should exist:
      | test/config/deploy.rb |
      | test/.rvmrc |
      | test/Capfile |
      | test/Gemfile |
      | test/Gemfile.lock |


  Scenario: Creating when directory already exists
    Given a directory named "test"
    When I run `caphub test`
    Then the output should contain "'test' exists."

  Scenario: Creating with jruby
    When I run `caphub --ruby jruby test`
    Then the output should contain "Copying the desired .rvmrc template for jruby to .rvmrc"
    And the file "test/.rvmrc" should contain "rvm jruby"