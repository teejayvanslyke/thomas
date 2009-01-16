Feature:  I want to get information about a House Resolution by its numeric ID.
  Scenario:  I have a valid ID.
    Given I have specified the ID HR101
    When I query for its metadata
    Then its title is 'To amend the Internal Revenue Code of 1986 to allow all individuals, whether or not first-time homebuyers, a refundable income tax credit for the purchase of a residence during 2009 or 2010.'
    And its sponsor is 'Rep Dreier, David'
    And its introduction date is 1/6/2009
    And it has no cosponsors


