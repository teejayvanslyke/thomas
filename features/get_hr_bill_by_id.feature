Feature:  I want to get information about a House Resolution by its numeric ID.
  Scenario:  I have a valid ID.
    Given I have specified the ID HR101
    When I query for its metadata
    Then its title is 'To amend the Internal Revenue Code of 1986 to allow all individuals, whether or not first-time homebuyers, a refundable income tax credit for the purchase of a residence during 2009 or 2010.'
    And its sponsor is 'Rep Dreier, David'
    And its introduction date is 1/6/2009
    And it has no cosponsors

    Given I have specified the ID HR105
    When I query for its metadata
    Then its title is 'To protect voting rights and to improve the administration of Federal elections, and for other purposes.'
    And its sponsor is 'Rep Conyers, John, Jr.'
    And its introduction date is 1/6/2009
    And it has 5 cosponsors
    And 'Rep Cohen, Steve' is a cosponsor 
    And 'Rep Gutierrez, Luis V.' is a cosponsor
    And 'Rep Jackson-Lee, Sheila' is a cosponsor 
    And 'Rep Nadler, Jerrold' is a cosponsor 
    And 'Rep Wexler, Robert' is a cosponsor

    Given I have specified the ID HR92
    When I query for its metadata
    Then its title is 'To amend titles XI and XIX of the Social Security Act to remove the cap on Medicaid payments for Puerto Rico, the Virgin Islands, Guam, the Northern Mariana Islands, and American Samoa and to adjust the Medicaid statutory matching rate for those territories.'
    And its sponsor is 'Rep Christensen, Donna M.'
    And its introduction date is 1/6/2009
    And it has 2 cosponsors
    And 'Rep Bordallo, Madeleine Z.' is a cosponsor
    And 'Rep Faleomavaega, Eni F.H.' is a cosponsor

    Given I have specified the ID HE52
    When I query for its metadata
    Then its title is 'Providing for consideration of the bill (H.R. 2) to amend title XXI of the Social Security Act to extend and improve the Children's Health Insurance Program, and for other purposes.'


    


