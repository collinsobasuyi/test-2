Feature: Integration Automated Test
  As a business User
  I want to submit my business details
  So that i can get a call back from an agent

  @ManualAddressValidation
  Scenario Outline: Validate Manual Address Form Field
    Given User is on homepage "https://smart-connectivity-qa.makeitcheaper.com/"
    When User enter postcode "<PostCode>"
    And Click find business button
    And Click My address is not listed, Enter it manually
    And user enter Street Address 1 "<StreetAddress1>"
    And user enter Street Address 2 "<StreetAddress2>"
    And user enter Town "<Town>"
    And user enter County "<County>"
    And user enter Post Code "<PostCode>"
    Then Street Address 1 validation error "<StreetAddress1Validation>" is displayed
    And Street Address 2 validation error "<StreetAddress2Validation>" is displayed
    And Town validation error "<TownValidation>" is displayed
    And County validation error "<CountyValidation>" is displayed
    And Post Code validation error "<PostCodeValidation>" is displayed
    And User exit page

    Examples: 
      | PostCode | StreetAddress1                                 | StreetAddress2                                 | Town                               | County                               | PostCode                                | StreetAddress1Validation                          | StreetAddress2Validation                            | TownValidation                          | CountyValidation                          | PostCodeValidation            |
      | KT64DU   | Street address 1 We will use this to recommend | Street address 2 We will use this to recommend | Town We will use this to recommend | County We will use this to recommend | Post Code We will use this to recommend | Street address must be no more than 32 characters | Street address 2 must be no more than 32 characters | Town must be no more than 32 characters | County must be no more than 32 characters | Please enter a valid postcode |

  @PostcodeValidation
  Scenario Outline: Validate Postcode
    Given User is on homepage "https://smart-connectivity-qa.makeitcheaper.com/"
    When User enter postcode "<PostCode>"
    And Click find business button
    Then Post Code validation error message "<PostCodeValidation>" is displayed
    And User exit page

    Examples: 
      | PostCode | PostCodeValidation                         |
      |          | Please enter a valid postcode to continue. |
      | KT6 4d   | Please enter a valid postcode to continue. |
      | lorem    | Please enter a valid postcode to continue. |
      |     1234 | Please enter a valid postcode to continue. |
      | <>:'     | Please enter a valid postcode to continue. |
      | KT6      | Please enter a valid postcode to continue. |

  @ManualScenario
  Scenario Outline: Manual Address scenario
    Given User is on homepage "https://smart-connectivity-qa.makeitcheaper.com/"
    When User enter postcode "<PostCode>"
    And Click find business button
    And Click My address is not listed, Enter it manually
    And user enter Street Address 1 "<StreetAddress1>"
    And user enter Street Address 2 "<StreetAddress2>"
    And user enter Town "<Town>"
    And user enter County "<County>"
    And Click next button
    When User click Broadband and Landline
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/supplier"
    And Copy content heading level one should be "Who is your current broadband provider?"
    And Copy content heading level two should be "This will help us to recommend other potential providers."
    When User click BT provider
    And Unselect My landline provider is the same checkbox
    And Click SKY provider
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/internet"
    And Copy content heading level one should be "What do you use your broadband for?"
    And Copy content heading level two should be "Let's make sure you get the right broadband speed."
    When User click Emails
    Then Copy content message should be "Your broadband usage is light, but we'll ask you a few more questions to check."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-often"
    And Copy content heading level one should be "When do you use your broadband connection?"
    And Copy content heading level two should be "Speeds vary depending on the time of day."
    When User click During the day
    Then Copy content message should be "Speeds are usually better at these times. Some providers prioritise business traffic if it does get busy."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-many-users"
    And Copy content heading level one should be "How many people use the internet at once?"
    And Copy content heading level two should be "Let's make sure you get enough bandwidth."
    When User click 1 to 3
    Then Copy content message should be "Thanks. This will help us recommend the right speed for your business."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/type-of-calls"
    And Copy content heading level one should be "How do you normally use your landline?"
    And Copy content heading level two should be "Let's make sure you get the right calls package."
    When User click International calls
    Then Copy content message should be "We'll look for the best rates for calls like these."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/call-features"
    And Copy content heading level one should be "Do you need any special call features?"
    And Copy content heading level two should be "Let's make sure you get all the call features you need."
    When User click Conference calling
    Then Copy content message should be "Thanks. We'll ensure your new service has these features."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/phone-lines"
    And Copy content heading level one should be "Do you have multiple phone lines?"
    And Copy content heading level two should be "As well as lines for calls, you could have lines for card machines, alarms or lifts."
    When User click Yes
    Then Copy content message should be "Great. Our experts will work with you to understand your phone usage in more detail."
    When User click message all done button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/results"
    And First copy content for broadband should be "Low internet usage, requiring a reliable connection and standard speeds"
    And Second copy content for broadband should be "You could manage with a standard broadband connection"
    And Landline copy content should be "Advanced landline needs. We'll find you a package with the right combination of calls and features."
    And Copy content at the bottom should be "Let's connect with our telecoms experts and find the right product for you"
    When User click Great, let's talk button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/chat"
    When User click call me now button
    And User enter Business name "<BusinessName>"
    And User enter Your name "<YourName>"
    And User enter Your phone number "<YourPhoneNumber>"
    And User enter Your email address "<YourEmailAddress>"
    And Click Call me button
    Then Copy content should be "Great. One of our business connectivity experts will call you in a few minutes."
    And Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/confirmation"
    And User exit page

    Examples: 
      | StreetAddress1 | StreetAddress2 | Town | County | PostCode |
      | Test           | Test           | test | test   | KT64DU   |

  @Scenario_1
  Scenario Outline: Low Broadband & High Phone Usage
    Given User is on homepage "https://smart-connectivity-qa.makeitcheaper.com/"
    When User enter postcode "<PostCode>"
    And Click find business button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/postcode"
    And Copy content heading level one should be "What is your business address?"
    And Copy content heading level two should be "We will use this to recommend products at your address."
    When User enter address "<Address>"
    And Click on fredericks
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/trade"
    And Copy content heading level one should be "Tell us your business trade"
    And Copy content heading level two should be "We will tailor our recommendation to your specific business needs."
    When User enter business trade "<BusinessTrade>"
    And Click business trade
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/service"
    And Copy content heading level one should be "Which service can we help you with?"
    And Copy content heading level two should be "Our experts specialise in the following services:"
    When User click Broadband and Landline
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/supplier"
    And Copy content heading level one should be "Who is your current broadband provider?"
    And Copy content heading level two should be "This will help us to recommend other potential providers."
    When User click BT provider
    And Unselect My landline provider is the same checkbox
    And Click SKY provider
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/internet"
    And Copy content heading level one should be "What do you use your broadband for?"
    And Copy content heading level two should be "Let's make sure you get the right broadband speed."
    When User click Emails
    Then Copy content message should be "Your broadband usage is light, but we'll ask you a few more questions to check."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-often"
    And Copy content heading level one should be "When do you use your broadband connection?"
    And Copy content heading level two should be "Speeds vary depending on the time of day."
    When User click During the day
    Then Copy content message should be "Speeds are usually better at these times. Some providers prioritise business traffic if it does get busy."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-many-users"
    And Copy content heading level one should be "How many people use the internet at once?"
    And Copy content heading level two should be "Let's make sure you get enough bandwidth."
    When User click 1 to 3
    Then Copy content message should be "Thanks. This will help us recommend the right speed for your business."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/type-of-calls"
    And Copy content heading level one should be "How do you normally use your landline?"
    And Copy content heading level two should be "Let's make sure you get the right calls package."
    When User click International calls
    Then Copy content message should be "We'll look for the best rates for calls like these."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/call-features"
    And Copy content heading level one should be "Do you need any special call features?"
    And Copy content heading level two should be "Let's make sure you get all the call features you need."
    When User click Conference calling
    Then Copy content message should be "Thanks. We'll ensure your new service has these features."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/phone-lines"
    And Copy content heading level one should be "Do you have multiple phone lines?"
    And Copy content heading level two should be "As well as lines for calls, you could have lines for card machines, alarms or lifts."
    When User click Yes
    Then Copy content message should be "Great. Our experts will work with you to understand your phone usage in more detail."
    When User click message all done button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/results"
    And First copy content for broadband should be "Low internet usage, requiring a reliable connection and standard speeds"
    And Second copy content for broadband should be "You could manage with a standard broadband connection"
    And Landline copy content should be "Advanced landline needs. We'll find you a package with the right combination of calls and features."
    And Copy content at the bottom should be "Let's connect with our telecoms experts and find the right product for you"
    When User click Great, let's talk button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/chat"
    When User click call me now button
    And User enter Business name "<BusinessName>"
    And User enter Your name "<YourName>"
    And User enter Your phone number "<YourPhoneNumber>"
    And User enter Your email address "<YourEmailAddress>"
    And Click Call me button
    Then Copy content should be "Great. One of our business connectivity experts will call you in a few minutes."
    And Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/confirmation"
    Then User exit page

    Examples: 
      | PostCode | Address    | BusinessTrade     | Date       | BusinessName                                          | YourName | YourPhoneNumber | YourEmailAddress   |
      | KT6 4DU  | Fredericks | academy or school | 01/12/2019 | Telco QA Integration Test Scenario 1 L Band & H Phone | Test Mic |     01234567890 | test@testqamic.com |

  @Scenario_2
  Scenario Outline: Low Broadband & High Phone usage
    Given User is on homepage "https://smart-connectivity-qa.makeitcheaper.com/"
    When User enter postcode "<PostCode>"
    And Click find business button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/postcode"
    And Copy content heading level one should be "What is your business address?"
    And Copy content heading level two should be "We will use this to recommend products at your address."
    When User enter address "<Address>"
    And Click on fredericks
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/trade"
    And Copy content heading level one should be "Tell us your business trade"
    And Copy content heading level two should be "We will tailor our recommendation to your specific business needs."
    When User enter business trade "<BusinessTrade>"
    And Click business trade
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/service"
    And Copy content heading level one should be "Which service can we help you with?"
    And Copy content heading level two should be "Our experts specialise in the following services:"
    When User click Broadband and Landline
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/supplier"
    And Copy content heading level one should be "Who is your current broadband provider?"
    And Copy content heading level two should be "This will help us to recommend other potential providers."
    When User click BT provider
    And Unselect My landline provider is the same checkbox
    And Click SKY provider
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/internet"
    And Copy content heading level one should be "What do you use your broadband for?"
    And Copy content heading level two should be "Let's make sure you get the right broadband speed."
    And User click Emails
    Then Copy content message should be "Your broadband usage is light, but we'll ask you a few more questions to check."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-often"
    And Copy content heading level one should be "When do you use your broadband connection?"
    And Copy content heading level two should be "Speeds vary depending on the time of day."
    When User click At night
    Then Copy content message should be "Speeds are usually better at these times. Some providers prioritise business traffic if it does get busy."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-many-users"
    And Copy content heading level one should be "How many people use the internet at once?"
    And Copy content heading level two should be "Let's make sure you get enough bandwidth."
    When User click 1 to 3
    Then Copy content message should be "Thanks. This will help us recommend the right speed for your business."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/type-of-calls"
    And Copy content heading level one should be "How do you normally use your landline?"
    And Copy content heading level two should be "Let's make sure you get the right calls package."
    When User click International calls
    Then Copy content message should be "We'll look for the best rates for calls like these."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/call-features"
    And Copy content heading level one should be "Do you need any special call features?"
    And Copy content heading level two should be "Let's make sure you get all the call features you need."
    When User click Automatic ring back
    Then Copy content message should be "Thanks. We'll ensure your new service has these features."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/phone-lines"
    And Copy content heading level one should be "Do you have multiple phone lines?"
    And Copy content heading level two should be "As well as lines for calls, you could have lines for card machines, alarms or lifts."
    When User click No
    Then Copy content message should be "OK that makes things easy! We can discuss whether you have a need for more lines in the future."
    When User click message all done button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/results"
    And First copy content for broadband should be "Low internet usage, requiring a reliable connection and standard speeds"
    And Second copy content for broadband should be "You could manage with a standard broadband connection"
    And Landline copy content should be "Advanced landline needs. We'll find you a package with the right combination of calls and features."
    And Copy content at the bottom should be "Let's connect with our telecoms experts and find the right product for you"
    When User click Great, let's talk button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/chat"
    When User click Schedule for later button
    And User click continue button
    And User enter Business name "<BusinessName>"
    And User enter Your name "<YourName>"
    And User enter Your phone number "<YourPhoneNumber>"
    And User enter Your email address "<YourEmailAddress>"
    And Click Call me button
    Then Copy content should be "Great. Your personal telecoms expert will call you soon."
    And Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/confirmation"
    Then User exit page

    Examples: 
      | PostCode | Address    | BusinessTrade    | Date       | BusinessName                                          | YourName | YourPhoneNumber | YourEmailAddress   |
      | KT6 4DU  | Fredericks | Zumba instructor | 01/12/2019 | Telco QA Integration Test Scenario 2 L Band & H Phone | Test Mic |     01234567890 | test@testqamic.com |

  @Scenario_3
  Scenario Outline: Med Broadband & High Phone usage
    Given User is on homepage "https://smart-connectivity-qa.makeitcheaper.com/"
    When User enter postcode "<PostCode>"
    And Click find business button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/postcode"
    And Copy content heading level one should be "What is your business address?"
    And Copy content heading level two should be "We will use this to recommend products at your address."
    When User enter address "<Address>"
    And Click on fredericks
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/trade"
    And Copy content heading level one should be "Tell us your business trade"
    And Copy content heading level two should be "We will tailor our recommendation to your specific business needs."
    When User enter business trade "<BusinessTrade>"
    And Click business trade
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/service"
    And Copy content heading level one should be "Which service can we help you with?"
    And Copy content heading level two should be "Our experts specialise in the following services:"
    When User click Broadband and Landline
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/supplier"
    And Copy content heading level one should be "Who is your current broadband provider?"
    And Copy content heading level two should be "This will help us to recommend other potential providers."
    When User click BT provider
    And Unselect My landline provider is the same checkbox
    And Click SKY provider
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/internet"
    And Copy content heading level one should be "What do you use your broadband for?"
    And Copy content heading level two should be "Let's make sure you get the right broadband speed."
    And User click Using the web
    Then Copy content message should be "Your broadband usage is light, but we'll ask you a few more questions to check."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-often"
    And Copy content heading level one should be "When do you use your broadband connection?"
    And Copy content heading level two should be "Speeds vary depending on the time of day."
    When User click In the evenings
    Then Copy content message should be "Speeds can slow down in the evening. Some providers prioritise business traffic if it does get busy."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-many-users"
    And Copy content heading level one should be "How many people use the internet at once?"
    And Copy content heading level two should be "Let's make sure you get enough bandwidth."
    When User click 9 to 14
    Then Copy content message should be "Thanks. This will help us recommend the right speed for your business."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/type-of-calls"
    And Copy content heading level one should be "How do you normally use your landline?"
    And Copy content heading level two should be "Let's make sure you get the right calls package."
    When User click International calls
    Then Copy content message should be "We'll look for the best rates for calls like these."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/call-features"
    And Copy content heading level one should be "Do you need any special call features?"
    And Copy content heading level two should be "Let's make sure you get all the call features you need."
    When User click Barring
    Then Copy content message should be "Thanks. We'll ensure your new service has these features."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/phone-lines"
    And Copy content heading level one should be "Do you have multiple phone lines?"
    And Copy content heading level two should be "As well as lines for calls, you could have lines for card machines, alarms or lifts."
    When User click Yes
    Then Copy content message should be "Great. Our experts will work with you to understand your phone usage in more detail."
    When User click message all done button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/results"
    And First copy content for broadband should be "Medium internet usage, requiring a reliable connection and fast speeds"
    And Second copy content for broadband should be "You would benefit from a fast fibre connection"
    And Landline copy content should be "Advanced landline needs. We'll find you a package with the right combination of calls and features."
    And Copy content at the bottom should be "Let's connect with our telecoms experts and find the right product for you"
    When User click Great, let's talk button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/chat"
    When User click Schedule for later button
    And User click continue button
    And User enter Business name "<BusinessName>"
    And User enter Your name "<YourName>"
    And User enter Your phone number "<YourPhoneNumber>"
    And User enter Your email address "<YourEmailAddress>"
    And Click Call me button
    Then Copy content should be "Great. Your personal telecoms expert will call you soon."
    And Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/confirmation"
    Then User exit page

    Examples: 
      | PostCode | Address    | BusinessTrade | Date       | BusinessName                                          | YourName | YourPhoneNumber | YourEmailAddress   |
      | KT6 4DU  | Fredericks | Yacht club    | 01/12/2019 | Telco QA Integration Test Scenario 3 M Band & H Phone | Test Mic |     01234567890 | test@testqamic.com |

  @Scenario_4
  Scenario Outline: High Broadband & High Phone usage
    Given User is on homepage "https://smart-connectivity-qa.makeitcheaper.com/"
    When User enter postcode "<PostCode>"
    And Click find business button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/postcode"
    And Copy content heading level one should be "What is your business address?"
    And Copy content heading level two should be "We will use this to recommend products at your address."
    When User enter address "<Address>"
    And Click on fredericks
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/trade"
    And Copy content heading level one should be "Tell us your business trade"
    And Copy content heading level two should be "We will tailor our recommendation to your specific business needs."
    When User enter business trade "<BusinessTrade>"
    And Click business trade
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/service"
    And Copy content heading level one should be "Which service can we help you with?"
    And Copy content heading level two should be "Our experts specialise in the following services:"
    When User click Broadband and Landline
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/supplier"
    And Copy content heading level one should be "Who is your current broadband provider?"
    And Copy content heading level two should be "This will help us to recommend other potential providers."
    When User click BT provider
    And Unselect My landline provider is the same checkbox
    And Click SKY provider
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/internet"
    And Copy content heading level one should be "What do you use your broadband for?"
    And Copy content heading level two should be "Let's make sure you get the right broadband speed."
    And User click Using the web
    Then Copy content message should be "Your broadband usage is light, but we'll ask you a few more questions to check."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-often"
    And Copy content heading level one should be "When do you use your broadband connection?"
    And Copy content heading level two should be "Speeds vary depending on the time of day."
    When User click During the day
    Then Copy content message should be "Speeds are usually better at these times. Some providers prioritise business traffic if it does get busy."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-many-users"
    And Copy content heading level one should be "How many people use the internet at once?"
    And Copy content heading level two should be "Let's make sure you get enough bandwidth."
    When User click 15+
    Then Copy content message should be "Thanks. This will help us recommend the right speed for your business."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/type-of-calls"
    And Copy content heading level one should be "How do you normally use your landline?"
    And Copy content heading level two should be "Let's make sure you get the right calls package."
    When User click International calls
    Then Copy content message should be "We'll look for the best rates for calls like these."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/call-features"
    And Copy content heading level one should be "Do you need any special call features?"
    And Copy content heading level two should be "Let's make sure you get all the call features you need."
    When User click Conference calls
    And User click Automatic ring back
    And User click Barring
    Then Copy content message should be "Thanks. We'll ensure your new service has these features."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/phone-lines"
    And Copy content heading level one should be "Do you have multiple phone lines?"
    And Copy content heading level two should be "As well as lines for calls, you could have lines for card machines, alarms or lifts."
    When User click Yes
    Then Copy content message should be "Great. Our experts will work with you to understand your phone usage in more detail."
    When User click message all done button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/results"
    And First copy content for broadband should be "High internet usage, requiring a solid connection and fast speeds"
    And Second copy content for broadband should be "You would benefit from a fast fibre connection"
    And Landline copy content should be "Advanced landline needs. We'll find you a package with the right combination of calls and features."
    And Copy content at the bottom should be "Let's connect with our telecoms experts and find the right product for you"
    When User click Great, let's talk button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/chat"
    When User click Schedule for later button
    And User click continue button
    And User enter Business name "<BusinessName>"
    And User enter Your name "<YourName>"
    And User enter Your phone number "<YourPhoneNumber>"
    And User enter Your email address "<YourEmailAddress>"
    And Click Call me button
    Then Copy content should be "Great. Your personal telecoms expert will call you soon."
    And Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/confirmation"
    Then User exit page

    Examples: 
      | PostCode | Address    | BusinessTrade      | Date       | BusinessName                                          | YourName | YourPhoneNumber | YourEmailAddress   |
      | KT6 4DU  | Fredericks | Chauffeur services | 01/12/2019 | Telco QA Integration Test Scenario 4 H Band & H Phone | Test Mic |     01234567890 | test@testqamic.com |

  @Scenario_5
  Scenario Outline: Low Broadband & High Phone usage
    Given User is on homepage "https://smart-connectivity-qa.makeitcheaper.com/"
    When User enter postcode "<PostCode>"
    And Click find business button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/postcode"
    And Copy content heading level one should be "What is your business address?"
    And Copy content heading level two should be "We will use this to recommend products at your address."
    When User enter address "<Address>"
    And Click on fredericks
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/trade"
    And Copy content heading level one should be "Tell us your business trade"
    And Copy content heading level two should be "We will tailor our recommendation to your specific business needs."
    When User enter business trade "<BusinessTrade>"
    And Click business trade
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/service"
    And Copy content heading level one should be "Which service can we help you with?"
    And Copy content heading level two should be "Our experts specialise in the following services:"
    When User click Broadband and Landline
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/supplier"
    And Copy content heading level one should be "Who is your current broadband provider?"
    And Copy content heading level two should be "This will help us to recommend other potential providers."
    When User click BT provider
    And Unselect My landline provider is the same checkbox
    And Click SKY provider
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/internet"
    And Copy content heading level one should be "What do you use your broadband for?"
    And Copy content heading level two should be "Let's make sure you get the right broadband speed."
    And User click Using the web
    And User click Emails
    Then Copy content message should be "Your broadband usage is light, but we'll ask you a few more questions to check."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-often"
    And Copy content heading level one should be "When do you use your broadband connection?"
    And Copy content heading level two should be "Speeds vary depending on the time of day."
    When User click During the day
    And User click At night
    Then Copy content message should be "Speeds are usually better at these times. Some providers prioritise business traffic if it does get busy."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-many-users"
    And Copy content heading level one should be "How many people use the internet at once?"
    And Copy content heading level two should be "Let's make sure you get enough bandwidth."
    When User click 1 to 3
    Then Copy content message should be "Thanks. This will help us recommend the right speed for your business."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/type-of-calls"
    And Copy content heading level one should be "How do you normally use your landline?"
    And Copy content heading level two should be "Let's make sure you get the right calls package."
    When User click International calls
    Then Copy content message should be "We'll look for the best rates for calls like these."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/call-features"
    And Copy content heading level one should be "Do you need any special call features?"
    And Copy content heading level two should be "Let's make sure you get all the call features you need."
    When User click Call diversion
    And User click Call waiting
    And User click Caller display
    Then Copy content message should be "Thanks. We'll ensure your new service has these features."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/phone-lines"
    And Copy content heading level one should be "Do you have multiple phone lines?"
    And Copy content heading level two should be "As well as lines for calls, you could have lines for card machines, alarms or lifts."
    When User click Yes
    Then Copy content message should be "Great. Our experts will work with you to understand your phone usage in more detail."
    When User click message all done button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/results"
    And First copy content for broadband should be "Low internet usage, requiring a reliable connection and standard speeds"
    And Second copy content for broadband should be "You could manage with a standard broadband connection"
    And Landline copy content should be "Advanced landline needs. We'll find you a package with the right combination of calls and features."
    And Copy content at the bottom should be "Let's connect with our telecoms experts and find the right product for you"
    When User click Great, let's talk button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/chat"
    When User click Schedule for later button
    And User click continue button
    And User enter Business name "<BusinessName>"
    And User enter Your name "<YourName>"
    And User enter Your phone number "<YourPhoneNumber>"
    And User enter Your email address "<YourEmailAddress>"
    And Click Call me button
    Then Copy content should be "Great. Your personal telecoms expert will call you soon."
    And Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/confirmation"
    Then User exit page

    Examples: 
      | PostCode | Address    | BusinessTrade            | Date       | BusinessName                                          | YourName | YourPhoneNumber | YourEmailAddress   |
      | KT6 4DU  | Fredericks | Dairy products retailing | 01/12/2019 | Telco QA Integration Test Scenario 5 L Band & H Phone | Test Mic |     01234567890 | test@testqamic.com |

  @Scenario_6
  Scenario Outline: Low Broadband & High Phone usage
    Given User is on homepage "https://smart-connectivity-qa.makeitcheaper.com/"
    When User enter postcode "<PostCode>"
    And Click find business button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/postcode"
    And Copy content heading level one should be "What is your business address?"
    And Copy content heading level two should be "We will use this to recommend products at your address."
    When User enter address "<Address>"
    And Click on fredericks
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/trade"
    And Copy content heading level one should be "Tell us your business trade"
    And Copy content heading level two should be "We will tailor our recommendation to your specific business needs."
    When User enter business trade "<BusinessTrade>"
    And Click business trade
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/service"
    And Copy content heading level one should be "Which service can we help you with?"
    And Copy content heading level two should be "Our experts specialise in the following services:"
    When User click Broadband and Landline
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/supplier"
    And Copy content heading level one should be "Who is your current broadband provider?"
    And Copy content heading level two should be "This will help us to recommend other potential providers."
    When User click BT provider
    And Unselect My landline provider is the same checkbox
    And Click SKY provider
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/internet"
    And Copy content heading level one should be "What do you use your broadband for?"
    And Copy content heading level two should be "Let's make sure you get the right broadband speed."
    And User click Social media
    Then Copy content message should be "Social media can sometimes mean you need a fast connection so we'll ask you more about this later."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-often"
    And Copy content heading level one should be "When do you use your broadband connection?"
    And Copy content heading level two should be "Speeds vary depending on the time of day."
    When User click During the day
    Then Copy content message should be "Speeds are usually better at these times. Some providers prioritise business traffic if it does get busy."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-many-users"
    And Copy content heading level one should be "How many people use the internet at once?"
    And Copy content heading level two should be "Let's make sure you get enough bandwidth."
    When User click 1 to 3
    Then Copy content message should be "Thanks. This will help us recommend the right speed for your business."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/type-of-calls"
    And Copy content heading level one should be "How do you normally use your landline?"
    And Copy content heading level two should be "Let's make sure you get the right calls package."
    When User click Calls to landline
    And User click Calls to mobile
    Then Copy content message should be "We'll look for the best rates for calls like these."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/call-features"
    And Copy content heading level one should be "Do you need any special call features?"
    And Copy content heading level two should be "Let's make sure you get all the call features you need."
    When User click Call diversion
    And User click Call waiting
    And User click Caller display
    Then Copy content message should be "Thanks. We'll ensure your new service has these features."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/phone-lines"
    And Copy content heading level one should be "Do you have multiple phone lines?"
    And Copy content heading level two should be "As well as lines for calls, you could have lines for card machines, alarms or lifts."
    When User click Yes
    Then Copy content message should be "Great. Our experts will work with you to understand your phone usage in more detail."
    When User click message all done button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/results"
    And First copy content for broadband should be "Low internet usage, requiring a reliable connection and standard speeds"
    And Second copy content for broadband should be "You could manage with a standard broadband connection"
    And Landline copy content should be "Advanced landline needs. We'll find you a package with the right combination of calls and features."
    And Copy content at the bottom should be "Let's connect with our telecoms experts and find the right product for you"
    When User click Great, let's talk button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/chat"
    When User click Schedule for later button
    And User click continue button
    And User enter Business name "<BusinessName>"
    And User enter Your name "<YourName>"
    And User enter Your phone number "<YourPhoneNumber>"
    And User enter Your email address "<YourEmailAddress>"
    And Click Call me button
    Then Copy content should be "Great. Your personal telecoms expert will call you soon."
    And Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/confirmation"
    Then User exit page

    Examples: 
      | PostCode | Address    | BusinessTrade | Date       | BusinessName                                          | YourName | YourPhoneNumber | YourEmailAddress   |
      | KT6 4DU  | Fredericks | Economist     | 01/12/2019 | Telco QA Integration Test Scenario 6 L Band & H Phone | Test Mic |     01234567890 | test@testqamic.com |

  @Scenario_7
  Scenario Outline: High Broadband & Medium Phone usage
    Given User is on homepage "https://smart-connectivity-qa.makeitcheaper.com/"
    When User enter postcode "<PostCode>"
    And Click find business button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/postcode"
    And Copy content heading level one should be "What is your business address?"
    And Copy content heading level two should be "We will use this to recommend products at your address."
    When User enter address "<Address>"
    And Click on fredericks
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/trade"
    And Copy content heading level one should be "Tell us your business trade"
    And Copy content heading level two should be "We will tailor our recommendation to your specific business needs."
    When User enter business trade "<BusinessTrade>"
    And Click business trade
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/service"
    And Copy content heading level one should be "Which service can we help you with?"
    And Copy content heading level two should be "Our experts specialise in the following services:"
    When User click Broadband and Landline
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/supplier"
    And Copy content heading level one should be "Who is your current broadband provider?"
    And Copy content heading level two should be "This will help us to recommend other potential providers."
    When User click BT provider
    And Unselect My landline provider is the same checkbox
    And Click SKY provider
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/internet"
    And Copy content heading level one should be "What do you use your broadband for?"
    And Copy content heading level two should be "Let's make sure you get the right broadband speed."
    And User click Social media
    Then Copy content message should be "Social media can sometimes mean you need a fast connection so we'll ask you more about this later."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-often"
    And Copy content heading level one should be "When do you use your broadband connection?"
    And Copy content heading level two should be "Speeds vary depending on the time of day."
    When User click In the evenings
    Then Copy content message should be "Speeds can slow down in the evening. Some providers prioritise business traffic if it does get busy."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-many-users"
    And Copy content heading level one should be "How many people use the internet at once?"
    And Copy content heading level two should be "Let's make sure you get enough bandwidth."
    When User click 15+
    Then Copy content message should be "Thanks. This will help us recommend the right speed for your business."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/type-of-calls"
    And Copy content heading level one should be "How do you normally use your landline?"
    And Copy content heading level two should be "Let's make sure you get the right calls package."
    When User click Calls to landline
    Then Copy content message should be "We'll look for the best rates for calls like these."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/call-features"
    And Copy content heading level one should be "Do you need any special call features?"
    And Copy content heading level two should be "Let's make sure you get all the call features you need."
    When User click Call diversion
    And User click Call waiting
    And User click Caller display
    Then Copy content message should be "Thanks. We'll ensure your new service has these features."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/phone-lines"
    And Copy content heading level one should be "Do you have multiple phone lines?"
    And Copy content heading level two should be "As well as lines for calls, you could have lines for card machines, alarms or lifts."
    When User click No
    Then Copy content message should be "OK that makes things easy! We can discuss whether you have a need for more lines in the future."
    When User click message all done button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/results"
    And First copy content for broadband should be "High internet usage, requiring a solid connection and fast speeds"
    And Second copy content for broadband should be "You would benefit from a fast fibre connection"
    And Landline copy content should be "Standard landline needs. We'll find you a package with the right combination of calls and features."
    And Copy content at the bottom should be "Let's connect with our telecoms experts and find the right product for you"
    When User click Great, let's talk button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/chat"
    When User click Schedule for later button
    And User click continue button
    And User enter Business name "<BusinessName>"
    And User enter Your name "<YourName>"
    And User enter Your phone number "<YourPhoneNumber>"
    And User enter Your email address "<YourEmailAddress>"
    And Click Call me button
    Then Copy content should be "Great. Your personal telecoms expert will call you soon."
    And Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/confirmation"
    Then User exit page

    Examples: 
      | PostCode | Address    | BusinessTrade      | Date       | BusinessName                                          | YourName | YourPhoneNumber | YourEmailAddress   |
      | KT6 4DU  | Fredericks | Fitness instructor | 01/12/2019 | Telco QA Integration Test Scenario 7 H Band & M Phone | Test Mic |     01234567890 | test@testqamic.com |

  @Scenario_8
  Scenario Outline: Medium Broadband & Standard Phone usage
    Given User is on homepage "https://smart-connectivity-qa.makeitcheaper.com/"
    When User enter postcode "<PostCode>"
    And Click find business button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/postcode"
    And Copy content heading level one should be "What is your business address?"
    And Copy content heading level two should be "We will use this to recommend products at your address."
    When User enter address "<Address>"
    And Click on fredericks
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/trade"
    And Copy content heading level one should be "Tell us your business trade"
    And Copy content heading level two should be "We will tailor our recommendation to your specific business needs."
    When User enter business trade "<BusinessTrade>"
    And Click business trade
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/service"
    And Copy content heading level one should be "Which service can we help you with?"
    And Copy content heading level two should be "Our experts specialise in the following services:"
    When User click Broadband and Landline
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/supplier"
    And Copy content heading level one should be "Who is your current broadband provider?"
    And Copy content heading level two should be "This will help us to recommend other potential providers."
    When User click BT provider
    And Unselect My landline provider is the same checkbox
    And Click SKY provider
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/internet"
    And Copy content heading level one should be "What do you use your broadband for?"
    And Copy content heading level two should be "Let's make sure you get the right broadband speed."
    And User click Social media
    And User click Emails
    And User click Using the web
    Then Copy content message should be "Social media can sometimes mean you need a fast connection so we'll ask you more about this later."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-often"
    And Copy content heading level one should be "When do you use your broadband connection?"
    And Copy content heading level two should be "Speeds vary depending on the time of day."
    When User click During the day
    And User click In the evenings
    And User click At night
    Then Copy content message should be "Speeds can slow down in the evening. Some providers prioritise business traffic if it does get busy."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-many-users"
    And Copy content heading level one should be "How many people use the internet at once?"
    And Copy content heading level two should be "Let's make sure you get enough bandwidth."
    When User click 4 to 8
    Then Copy content message should be "Thanks. This will help us recommend the right speed for your business."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/type-of-calls"
    And Copy content heading level one should be "How do you normally use your landline?"
    And Copy content heading level two should be "Let's make sure you get the right calls package."
    When User click Calls to mobile
    Then Copy content message should be "We'll look for the best rates for calls like these."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/call-features"
    And Copy content heading level one should be "Do you need any special call features?"
    And Copy content heading level two should be "Let's make sure you get all the call features you need."
    When User click Call diversion
    And User click Call waiting
    And User click Caller display
    Then Copy content message should be "Thanks. We'll ensure your new service has these features."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/phone-lines"
    And Copy content heading level one should be "Do you have multiple phone lines?"
    And Copy content heading level two should be "As well as lines for calls, you could have lines for card machines, alarms or lifts."
    When User click No
    Then Copy content message should be "OK that makes things easy! We can discuss whether you have a need for more lines in the future."
    When User click message all done button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/results"
    And First copy content for broadband should be "Medium internet usage, requiring a reliable connection and fast speeds"
    And Second copy content for broadband should be "You would benefit from a fast fibre connection"
    And Landline copy content should be "Standard landline needs. We'll find you a package with the right combination of calls and features."
    And Copy content at the bottom should be "Let's connect with our telecoms experts and find the right product for you"
    When User click Great, let's talk button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/chat"
    When User click Schedule for later button
    And User click continue button
    And User enter Business name "<BusinessName>"
    And User enter Your name "<YourName>"
    And User enter Your phone number "<YourPhoneNumber>"
    And User enter Your email address "<YourEmailAddress>"
    And Click Call me button
    Then Copy content should be "Great. Your personal telecoms expert will call you soon."
    And Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/confirmation"
    Then User exit page

    Examples: 
      | PostCode | Address    | BusinessTrade | Date       | BusinessName                                          | YourName | YourPhoneNumber | YourEmailAddress   |
      | KT6 4DU  | Fredericks | Garage        | 01/12/2019 | Telco QA Integration Test Scenario 8 M Band & S Phone | Test Mic |     01234567890 | test@testqamic.com |

  @Scenario_9
  Scenario Outline: Medium Broadband & Standard Phone usage
    Given User is on homepage "https://smart-connectivity-qa.makeitcheaper.com/"
    When User enter postcode "<PostCode>"
    And Click find business button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/postcode"
    And Copy content heading level one should be "What is your business address?"
    And Copy content heading level two should be "We will use this to recommend products at your address."
    When User enter address "<Address>"
    And Click on fredericks
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/trade"
    And Copy content heading level one should be "Tell us your business trade"
    And Copy content heading level two should be "We will tailor our recommendation to your specific business needs."
    When User enter business trade "<BusinessTrade>"
    And Click business trade
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/service"
    And Copy content heading level one should be "Which service can we help you with?"
    And Copy content heading level two should be "Our experts specialise in the following services:"
    When User click Broadband and Landline
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/supplier"
    And Copy content heading level one should be "Who is your current broadband provider?"
    And Copy content heading level two should be "This will help us to recommend other potential providers."
    When User click BT provider
    And Unselect My landline provider is the same checkbox
    And Click SKY provider
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/internet"
    And Copy content heading level one should be "What do you use your broadband for?"
    And Copy content heading level two should be "Let's make sure you get the right broadband speed."
    And User click Streaming
    Then Copy content message should be "These activities can require a lot of bandwidth - we'll talk more about this later."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-often"
    And Copy content heading level one should be "When do you use your broadband connection?"
    And Copy content heading level two should be "Speeds vary depending on the time of day."
    When User click During the day
    Then Copy content message should be "Speeds are usually better at these times. Some providers prioritise business traffic if it does get busy."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-many-users"
    And Copy content heading level one should be "How many people use the internet at once?"
    And Copy content heading level two should be "Let's make sure you get enough bandwidth."
    When User click 1 to 3
    Then Copy content message should be "Thanks. This will help us recommend the right speed for your business."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/type-of-calls"
    And Copy content heading level one should be "How do you normally use your landline?"
    And Copy content heading level two should be "Let's make sure you get the right calls package."
    When User click Calls to landline
    Then Copy content message should be "We'll look for the best rates for calls like these."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/call-features"
    And Copy content heading level one should be "Do you need any special call features?"
    And Copy content heading level two should be "Let's make sure you get all the call features you need."
    When User click Call diversion
    Then Copy content message should be "Thanks. We'll ensure your new service has these features."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/phone-lines"
    And Copy content heading level one should be "Do you have multiple phone lines?"
    And Copy content heading level two should be "As well as lines for calls, you could have lines for card machines, alarms or lifts."
    When User click No
    Then Copy content message should be "OK that makes things easy! We can discuss whether you have a need for more lines in the future."
    When User click message all done button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/results"
    And First copy content for broadband should be "Medium internet usage, requiring a reliable connection and fast speeds"
    And Second copy content for broadband should be "You would benefit from a fast fibre connection"
    And Landline copy content should be "Standard landline needs. We'll find you a package with the right combination of calls and features."
    And Copy content at the bottom should be "Let's connect with our telecoms experts and find the right product for you"
    When User click Great, let's talk button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/chat"
    When User click Schedule for later button
    And User click continue button
    And User enter Business name "<BusinessName>"
    And User enter Your name "<YourName>"
    And User enter Your phone number "<YourPhoneNumber>"
    And User enter Your email address "<YourEmailAddress>"
    And Click Call me button
    Then Copy content should be "Great. Your personal telecoms expert will call you soon."
    And Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/confirmation"
    Then User exit page

    Examples: 
      | PostCode | Address    | BusinessTrade | Date       | BusinessName                                          | YourName | YourPhoneNumber | YourEmailAddress   |
      | KT6 4DU  | Fredericks | Hairdresser   | 01/12/2019 | Telco QA Integration Test Scenario 9 M Band & S Phone | Test Mic |     01234567890 | test@testqamic.com |

  @Scenario_10
  Scenario Outline: Medium Broadband & Standard Phone usage
    Given User is on homepage "https://smart-connectivity-qa.makeitcheaper.com/"
    When User enter postcode "<PostCode>"
    And Click find business button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/postcode"
    And Copy content heading level one should be "What is your business address?"
    And Copy content heading level two should be "We will use this to recommend products at your address."
    When User enter address "<Address>"
    And Click on fredericks
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/trade"
    And Copy content heading level one should be "Tell us your business trade"
    And Copy content heading level two should be "We will tailor our recommendation to your specific business needs."
    When User enter business trade "<BusinessTrade>"
    And Click business trade
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/service"
    And Copy content heading level one should be "Which service can we help you with?"
    And Copy content heading level two should be "Our experts specialise in the following services:"
    When User click Broadband and Landline
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/supplier"
    And Copy content heading level one should be "Who is your current broadband provider?"
    And Copy content heading level two should be "This will help us to recommend other potential providers."
    When User click BT provider
    And Unselect My landline provider is the same checkbox
    And Click SKY provider
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/internet"
    And Copy content heading level one should be "What do you use your broadband for?"
    And Copy content heading level two should be "Let's make sure you get the right broadband speed."
    And User click Transferring files
    Then Copy content message should be "These activities can require a lot of bandwidth - we'll talk more about this later."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/transfers"
    And Copy content heading level one should be "What files do you regularly send and receive?"
    And Copy content heading level two should be "Let’s make sure you get the right broadband speed."
    When User click Document
    Then Copy content message should be "We'll make sure you have the right connection to send and receive files efficiently."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-often"
    And Copy content heading level one should be "When do you use your broadband connection?"
    And Copy content heading level two should be "Speeds vary depending on the time of day."
    When User click During the day
    Then Copy content message should be "Speeds are usually better at these times. Some providers prioritise business traffic if it does get busy."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-many-users"
    And Copy content heading level one should be "How many people use the internet at once?"
    And Copy content heading level two should be "Let's make sure you get enough bandwidth."
    When User click 1 to 3
    Then Copy content message should be "Thanks. This will help us recommend the right speed for your business."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/type-of-calls"
    And Copy content heading level one should be "How do you normally use your landline?"
    And Copy content heading level two should be "Let's make sure you get the right calls package."
    When User click Calls to mobile
    Then Copy content message should be "We'll look for the best rates for calls like these."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/call-features"
    And Copy content heading level one should be "Do you need any special call features?"
    And Copy content heading level two should be "Let's make sure you get all the call features you need."
    When User click Call waiting
    When User click Caller display
    Then Copy content message should be "Thanks. We'll ensure your new service has these features."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/phone-lines"
    And Copy content heading level one should be "Do you have multiple phone lines?"
    And Copy content heading level two should be "As well as lines for calls, you could have lines for card machines, alarms or lifts."
    When User click No
    Then Copy content message should be "OK that makes things easy! We can discuss whether you have a need for more lines in the future."
    When User click message all done button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/results"
    And First copy content for broadband should be "Medium internet usage, requiring a reliable connection and fast speeds"
    And Second copy content for broadband should be "You would benefit from a fast fibre connection"
    And Landline copy content should be "Standard landline needs. We'll find you a package with the right combination of calls and features."
    And Copy content at the bottom should be "Let's connect with our telecoms experts and find the right product for you"
    When User click Great, let's talk button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/chat"
    When User click call me now button
    And User enter Business name "<BusinessName>"
    And User enter Your name "<YourName>"
    And User enter Your phone number "<YourPhoneNumber>"
    And User enter Your email address "<YourEmailAddress>"
    And Click Call me button
    Then Copy content should be "Great. One of our business connectivity experts will call you in a few minutes."
    And Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/confirmation"
    Then User exit page

    Examples: 
      | PostCode | Address    | BusinessTrade  | Date       | BusinessName                                           | YourName | YourPhoneNumber | YourEmailAddress   |
      | KT6 4DU  | Fredericks | Paint supplier | 01/12/2019 | Telco QA Integration Test Scenario 10 M Band & S Phone | Test Mic |     01234567890 | test@testqamic.com |

  @Scenario_11
  Scenario Outline: High Broadband & High Phone usage
    Given User is on homepage "https://smart-connectivity-qa.makeitcheaper.com/"
    When User enter postcode "<PostCode>"
    And Click find business button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/postcode"
    And Copy content heading level one should be "What is your business address?"
    And Copy content heading level two should be "We will use this to recommend products at your address."
    When User enter address "<Address>"
    And Click on fredericks
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/trade"
    And Copy content heading level one should be "Tell us your business trade"
    And Copy content heading level two should be "We will tailor our recommendation to your specific business needs."
    When User enter business trade "<BusinessTrade>"
    And Click business trade
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/service"
    And Copy content heading level one should be "Which service can we help you with?"
    And Copy content heading level two should be "Our experts specialise in the following services:"
    When User click Broadband and Landline
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/supplier"
    And Copy content heading level one should be "Who is your current broadband provider?"
    And Copy content heading level two should be "This will help us to recommend other potential providers."
    When User click BT provider
    And Unselect My landline provider is the same checkbox
    And Click SKY provider
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/internet"
    And Copy content heading level one should be "What do you use your broadband for?"
    And Copy content heading level two should be "Let's make sure you get the right broadband speed."
    And User click Transferring files
    Then Copy content message should be "These activities can require a lot of bandwidth - we'll talk more about this later."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/transfers"
    And Copy content heading level one should be "What files do you regularly send and receive?"
    And Copy content heading level two should be "Let’s make sure you get the right broadband speed."
    When User click Document
    And User click Photos
    And User click Video files
    And User click Audio files
    And User click Something else
    Then Copy content message should be "We'll make sure you have the right connection to send and receive files efficiently."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-often"
    And Copy content heading level one should be "When do you use your broadband connection?"
    And Copy content heading level two should be "Speeds vary depending on the time of day."
    When User click During the day
    And User click In the evenings
    And User click At night
    Then Copy content message should be "Speeds can slow down in the evening. Some providers prioritise business traffic if it does get busy."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-many-users"
    And Copy content heading level one should be "How many people use the internet at once?"
    And Copy content heading level two should be "Let's make sure you get enough bandwidth."
    When User click 15+
    Then Copy content message should be "Thanks. This will help us recommend the right speed for your business."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/type-of-calls"
    And Copy content heading level one should be "How do you normally use your landline?"
    And Copy content heading level two should be "Let's make sure you get the right calls package."
    When User click International calls
    Then Copy content message should be "We'll look for the best rates for calls like these."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/call-features"
    And Copy content heading level one should be "Do you need any special call features?"
    And Copy content heading level two should be "Let's make sure you get all the call features you need."
    When User click Conference calling
    Then Copy content message should be "Thanks. We'll ensure your new service has these features."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/phone-lines"
    And Copy content heading level one should be "Do you have multiple phone lines?"
    And Copy content heading level two should be "As well as lines for calls, you could have lines for card machines, alarms or lifts."
    When User click Yes
    Then Copy content message should be "Great. Our experts will work with you to understand your phone usage in more detail."
    When User click message all done button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/results"
    And First copy content for broadband should be "High internet usage, requiring a solid connection and fast speeds"
    And Second copy content for broadband should be "You would benefit from a fast fibre connection"
    And Landline copy content should be "Advanced landline needs. We'll find you a package with the right combination of calls and features."
    And Copy content at the bottom should be "Let's connect with our telecoms experts and find the right product for you"
    When User click Great, let's talk button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/chat"
    When User click call me now button
    And User enter Business name "<BusinessName>"
    And User enter Your name "<YourName>"
    And User enter Your phone number "<YourPhoneNumber>"
    And User enter Your email address "<YourEmailAddress>"
    And Click Call me button
    Then Copy content should be "Great. One of our business connectivity experts will call you in a few minutes."
    And Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/confirmation"
    Then User exit page

    Examples: 
      | PostCode | Address    | BusinessTrade     | Date       | BusinessName                                           | YourName | YourPhoneNumber | YourEmailAddress   |
      | KT6 4DU  | Fredericks | Quantity surveyor | 01/12/2019 | Telco QA Integration Test Scenario 11 H Band & H Phone | Test Mic |     01234567890 | test@testqamic.com |

  @Scenario_12
  Scenario Outline: High Broadband & High Phone usage
    Given User is on homepage "https://smart-connectivity-qa.makeitcheaper.com/"
    When User enter postcode "<PostCode>"
    And Click find business button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/postcode"
    And Copy content heading level one should be "What is your business address?"
    And Copy content heading level two should be "We will use this to recommend products at your address."
    When User enter address "<Address>"
    And Click on fredericks
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/trade"
    And Copy content heading level one should be "Tell us your business trade"
    And Copy content heading level two should be "We will tailor our recommendation to your specific business needs."
    When User enter business trade "<BusinessTrade>"
    And Click business trade
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/service"
    And Copy content heading level one should be "Which service can we help you with?"
    And Copy content heading level two should be "Our experts specialise in the following services:"
    When User click Broadband and Landline
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/supplier"
    And Copy content heading level one should be "Who is your current broadband provider?"
    And Copy content heading level two should be "This will help us to recommend other potential providers."
    When User click BT provider
    And Unselect My landline provider is the same checkbox
    And Click SKY provider
    And Click next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/internet"
    And Copy content heading level one should be "What do you use your broadband for?"
    And Copy content heading level two should be "Let's make sure you get the right broadband speed."
    When User click Wifi for my customers
    And User click Transferring files
    And User click Social media
    And User click Streaming
    And User click Emails
    And User click Using the web
    Then Copy content message should be "These activities can require a lot of bandwidth - we'll talk more about this later."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/transfers"
    And Copy content heading level one should be "What files do you regularly send and receive?"
    And Copy content heading level two should be "Let’s make sure you get the right broadband speed."
    When User click Document
    And User click Photos
    And User click Video files
    And User click Audio files
    And User click Something else
    Then Copy content message should be "We'll make sure you have the right connection to send and receive files efficiently."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-often"
    And Copy content heading level one should be "When do you use your broadband connection?"
    And Copy content heading level two should be "Speeds vary depending on the time of day."
    When User click During the day
    And User click In the evenings
    And User click At night
    Then Copy content message should be "Speeds can slow down in the evening. Some providers prioritise business traffic if it does get busy."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/how-many-users"
    And Copy content heading level one should be "How many people use the internet at once?"
    And Copy content heading level two should be "Let's make sure you get enough bandwidth."
    When User click 1 to 3
    Then Copy content message should be "Thanks. This will help us recommend the right speed for your business."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/type-of-calls"
    And Copy content heading level one should be "How do you normally use your landline?"
    And Copy content heading level two should be "Let's make sure you get the right calls package."
    When User click International calls
    Then Copy content message should be "We'll look for the best rates for calls like these."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/call-features"
    And Copy content heading level one should be "Do you need any special call features?"
    And Copy content heading level two should be "Let's make sure you get all the call features you need."
    When User click Conference calling
    Then Copy content message should be "Thanks. We'll ensure your new service has these features."
    When User click message next button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/question/phone-lines"
    And Copy content heading level one should be "Do you have multiple phone lines?"
    And Copy content heading level two should be "As well as lines for calls, you could have lines for card machines, alarms or lifts."
    When User click Yes
    Then Copy content message should be "Great. Our experts will work with you to understand your phone usage in more detail."
    When User click message all done button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/results"
    And First copy content for broadband should be "High internet usage, requiring a solid connection and fast speeds"
    And Second copy content for broadband should be "You would benefit from a fast fibre connection"
    And Landline copy content should be "Advanced landline needs. We'll find you a package with the right combination of calls and features."
    And Copy content at the bottom should be "Let's connect with our telecoms experts and find the right product for you"
    When User click Great, let's talk button
    Then Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/chat"
    When User click call me now button
    And User enter Business name "<BusinessName>"
    And User enter Your name "<YourName>"
    And User enter Your phone number "<YourPhoneNumber>"
    And User enter Your email address "<YourEmailAddress>"
    And Click Call me button
    Then Copy content should be "Great. One of our business connectivity experts will call you in a few minutes."
    And Current URL should be "https://smart-connectivity-qa.makeitcheaper.com/confirmation"
    Then User exit page

    Examples: 
      | PostCode | Address    | BusinessTrade   | Date       | BusinessName                                           | YourName | YourPhoneNumber | YourEmailAddress   |
      | KT6 4DU  | Fredericks | Box wholesalers | 01/12/2019 | Telco QA Integration Test Scenario 12 H Band & H Phone | Test Mic |     01234567890 | test@testqamic.com |
