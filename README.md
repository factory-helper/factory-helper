factory-helper
=====
This gem began life as a fork of [stympy's Faker](https://github.com/stympy/faker).

**This is currently considered a _pre-release_ version by the authors.**

Its purpose is to facilitate software testing by allowing factories to have a solid source of random data with defined characteristics, but can be used for many other purposes as well as in production code.

It's main use-case is slightly different than Faker and will evolve in that direction, with a primary focus on software testing and not real-looking data.  Also the plan is to get some new features added, some of which have been stuck in PRs on the original repo, and many are planned by the authors.

[![Build Status](https://travis-ci.org/factory-helper/factory-helper.svg)](https://travis-ci.org/factory-helper/factory-helper)
[![Coverage Status](https://coveralls.io/repos/factory-helper/factory-helper/badge.svg)](https://coveralls.io/r/factory-helper/factory-helper)
[![Gem Version](https://badge.fury.io/rb/factory-helper.svg)](http://badge.fury.io/rb/factory-helper)

Installing
----------
```bash
gem install factory-helper
```

##Usage
-----
```ruby
FactoryHelper::Name.name      #=> "Christophe Bartell"

FactoryHelper::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"
```

###FactoryHelper::Address
-----------------

```ruby
FactoryHelper::Address.city #=> "Imogeneborough"

FactoryHelper::Address.street_name #=> "Larkin Fork"

FactoryHelper::Address.street_address #=> "282 Kevin Brook"

FactoryHelper::Address.secondary_address #=> "Apt. 672"

FactoryHelper::Address.building_number #=> "7304"

FactoryHelper::Address.zip_code #=> "58517"

FactoryHelper::Address.zip #=> "58517"

FactoryHelper::Address.postcode #=> "58517"

FactoryHelper::Address.time_zone #=> "Asia/Yakutsk"

FactoryHelper::Address.street_suffix #=> "Street"

FactoryHelper::Address.city_suffix #=> "fort"

FactoryHelper::Address.city_prefix #=> "Lake"

FactoryHelper::Address.state_abbr #=> "AP"

FactoryHelper::Address.state #=> "California"

FactoryHelper::Address.country #=> "French Guiana"

FactoryHelper::Address.latitude #=> "-58.17256227443719"

FactoryHelper::Address.longitude #=> "-156.65548382095133"


```

###FactoryHelper::Bitcoin
-----------------

```ruby

FactoryHelper::Bitcoin.address #=> "1HUoGjmgChmnxxYhz87YytV4gVjfPaExmh"
FactoryHelper::Bitcoin.testnet_address #=> ""msHGunDvoEwmVFXvd2Bub1SNw5RP1YHJaf""

```

###FactoryHelper::Business
------------------

```ruby

FactoryHelper::Business.credit_card_number #=> "1228-1221-1221-1431"

FactoryHelper::Business.credit_card_expiry_date #=> <Date: 2015-11-11 ((2457338j,0s,0n),+0s,2299161j)>

FactoryHelper::Business.credit_card_type #=> "visa"

```

###FactoryHelper::Code
--------------

```ruby

FactoryHelper::Code.isbn #=> "759021701-8"

FactoryHelper::Code.ean #=> "4600051000057"

```

###FactoryHelper::Commerce
------------------

```ruby

FactoryHelper::Commerce.color #=> "lavender"

# Optional arguments max=3, fixed_amount=false
FactoryHelper::Commerce.department #=> "Grocery, Health & Beauty"
FactoryHelper::Commerce.department(5) #=> "Grocery, Books, Health & Beauty"
FactoryHelper::Commerce.department(2, true) #=> "Books & Tools"

FactoryHelper::Commerce.product_name #=> "Practical Granite Shirt"

FactoryHelper::Commerce.price #=> "44.6"

```

###FactoryHelper::Company
-----------------

```ruby

FactoryHelper::Company.name #=> "Hirthe-Ritchie"

FactoryHelper::Company.suffix #=> "Group"

# Generate a buzzword-laden catch phrase.
FactoryHelper::Company.catch_phrase #=> "Business-focused coherent parallelism"

# When a straight answer won't do, BS to the rescue!
FactoryHelper::Company.bs #=> "empower one-to-one web-readiness"

FactoryHelper::Company.ein #=> "34-8488813"

FactoryHelper::Company.duns_number #=> "08-341-3736"

# Get a random company logo url in PNG format.
FactoryHelper::Company.logo #=> "http://pigment.github.com/fake-logos/logos/medium/color/5.png"

```

###FactoryHelper::Date
---------------------

```ruby
# Random date between dates
FactoryHelper::Date.between(2.days.ago, Date.today) #=> "Wed, 24 Sep 2014"

# Random date in the future (up to maximum of N days)
FactoryHelper::Date.forward(23) # => "Fri, 03 Oct 2014"

# Random date in the past (up to maximum of N days)
FactoryHelper::Date.backward(14) #=> "Fri, 19 Sep 2014"
```

###FactoryHelper::Internet
---------------

```ruby
# Optional argument name=nil
FactoryHelper::Internet.email #=> "eliza@mann.net"

FactoryHelper::Internet.email('Nancy') #=> "nancy@terry.biz"

# Optional argument name=nil
FactoryHelper::Internet.free_email #=> "freddy@gmail.com"

FactoryHelper::Internet.free_email('Nancy') #=> "nancy@yahoo.com"

# Optional argument name=nil
FactoryHelper::Internet.safe_email #=> "christelle@example.org"

FactoryHelper::Internet.safe_email('Nancy') #=> "nancy@example.net"

# Optional arguments specifier=nil, separators=%w(. _)
FactoryHelper::Internet.user_name #=> "alexie"

FactoryHelper::Internet.user_name('Nancy') #=> "nancy"

FactoryHelper::Internet.user_name('Nancy Johnson', %w(. _ -)) #=> "johnson-nancy"

# Optional arguments: min_length=8, max_length=16
FactoryHelper::Internet.password #=> "vg5msvy1uerg7"

FactoryHelper::Internet.password(8) #=> "yfgjik0hgzdqs0"

FactoryHelper::Internet.password(10, 20) #=> "eoc9shwd1hwq4vbgfw"

FactoryHelper::Internet.domain_name #=> "effertz.info"

FactoryHelper::Internet.fix_umlauts('äöüß') #=> "aeoeuess"

FactoryHelper::Internet.domain_word #=> "haleyziemann"

FactoryHelper::Internet.domain_suffix #=> "info"

FactoryHelper::Internet.ip_v4_address #=> "24.29.18.175"

FactoryHelper::Internet.ip_v6_address #=> "ac5f:d696:3807:1d72:2eb5:4e81:7d2b:e1df"

# Optional argument prefix=''
FactoryHelper::Internet.mac_address #=> "e6:0d:00:11:ed:4f"
FactoryHelper::Internet.mac_address('55:44:33') #=> "55:44:33:02:1d:9b"

# Optional arguments: host=domain_name, path="/#{user_name}"
FactoryHelper::Internet.url #=> "http://thiel.com/chauncey_simonis"
FactoryHelper::Internet.url('example.com') #=> "http://example.com/clotilde.swift"
FactoryHelper::Internet.url('example.com', '/foobar.html') #=> "http://example.com/foobar.html"

# Optional arguments: words=nil, glue=nil
FactoryHelper::Internet.slug #=> "pariatur_laudantium"
FactoryHelper::Internet.slug('foo bar') #=> "foo.bar"
FactoryHelper::Internet.slug('foo bar', '-') #=> "foo-bar"


```

###FactoryHelper::Lorem
---------------

```ruby

FactoryHelper::Lorem.word #=> "repellendus"

# Optional arguments: num=3, supplemental=false
FactoryHelper::Lorem.words #=> ["dolores", "adipisci", "nesciunt"]
FactoryHelper::Lorem.words(4) #=> ["culpa", "recusandae", "aut", "omnis"]
FactoryHelper::Lorem.words(4, true) #=> ["colloco", "qui", "vergo", "deporto"]

# Optional arguments: char_count=255
FactoryHelper::Lorem.characters #=> "uw1ep04lhs0c4d931n1jmrspprf5wrj85fefue0y7y6m56b6omquh7br7dhqijwlawejpl765nb1716idmp3xnfo85v349pzy2o9rir23y2qhflwr71c1585fnynguiphkjm8p0vktwitcsm16lny7jzp9t4drwav3qmhz4yjq4k04x14gl6p148hulyqioo72tf8nwrxxcclfypz2lc58lsibgfe5w5p0xv95peafjjmm2frkhdc6duoky0aha"
FactoryHelper::Lorem.characters(10) #=> "ang9cbhoa8"

# Optional arguments: word_count=4, supplemental=false, random_words_to_add=6
FactoryHelper::Lorem.sentence #=> "Dolore illum animi et neque accusantium."
FactoryHelper::Lorem.sentence(3) #=> "Commodi qui minus deserunt sed vero quia."
FactoryHelper::Lorem.sentence(3, true) #=> "Inflammatio denego necessitatibus caelestis autus illum."
FactoryHelper::Lorem.sentence(3, false, 4) #=> "Aut voluptatem illum fugit ut sit."
FactoryHelper::Lorem.sentence(3, true, 4) #=> "Accusantium tantillus dolorem timor."

# Optional arguments: sentence_count=3, supplemental=false
FactoryHelper::Lorem.sentences #=> ["Vero earum commodi soluta.", "Quaerat fuga cumque et vero eveniet omnis ut.", "Cumque sit dolor ut est consequuntur."]
FactoryHelper::Lorem.sentences(1) #=> ["Ut perspiciatis explicabo possimus doloribus enim quia."]
FactoryHelper::Lorem.sentences(1, true) #=> ["Quis capillus curo ager veritatis voro et ipsum."]

# Optional arguments: sentence_count=3, supplemental=false, random_sentences_to_add=3
FactoryHelper::Lorem.paragraph #=> "Neque dicta enim quasi. Qui corrupti est quisquam. Facere animi quod aut. Qui nulla consequuntur consectetur sapiente."
FactoryHelper::Lorem.paragraph(2) #=> "Illo qui voluptas. Id sit quaerat enim aut cupiditate voluptates dolorum. Porro necessitatibus numquam dolor quia earum."
FactoryHelper::Lorem.paragraph(2, true) #=> ""
FactoryHelper::Lorem.paragraph(2, false, 4) #=> ""
FactoryHelper::Lorem.paragraph(2, true, 4) #=> ""

# Optional arguments: paragraph_count=3, supplemental=false
FactoryHelper::Lorem.paragraphs #=> ""
FactoryHelper::Lorem.paragraphs(1) #=> ""
FactoryHelper::Lorem.paragraphs(1, true) #=> ""

```

###FactoryHelper::Name
--------------

```ruby

FactoryHelper::Name.name #=> "Tyshawn Johns Sr."

FactoryHelper::Name.first_name #=> "Kaci"

FactoryHelper::Name.last_name #=> "Ernser"

FactoryHelper::Name.prefix #=> "Mr."

FactoryHelper::Name.suffix #=> "IV"

FactoryHelper::Name.title #=> "Legacy Creative Director"

```

###FactoryHelper::Avatar
----------------

```ruby

FactoryHelper::Avatar.image #=> "http://robohash.org/sitsequiquia.png?size=300x300"

FactoryHelper::Avatar.image("my-own-slug") #=> "http://robohash.org/my-own-slug.png?size=300x300"

FactoryHelper::Avatar.image("my-own-slug", "50x50") #=> "http://robohash.org/my-own-slug.png?size=50x50"

FactoryHelper::Avatar.image("my-own-slug", "50x50", "jpg") #=> "http://robohash.org/my-own-slug.jpg?size=50x50"

FactoryHelper::Avatar.image("my-own-slug", "50x50", "bmp") #=> "http://robohash.org/my-own-slug.bmp?size=50x50"
```

###FactoryHelper::Number
----------------

```ruby

# Required parameter: digits
FactoryHelper::Number.number(10) #=> "1968353479"

FactoryHelper::Number.digit #=> "1"

```

###FactoryHelper::PhoneNumber
---------------------

Phone numbers may be in any of the following formats:

  * 333-333-3333
  * (333) 333-3333
  * 1-333-333-3333
  * 333.333.3333
  * 333-333-3333
  * 333-333-3333 x3333
  * (333) 333-3333 x3333
  * 1-333-333-3333 x3333
  * 333.333.3333 x3333

(Don't let the example output below fool you - any format can be returned at random.)

```ruby

FactoryHelper::PhoneNumber.phone_number #=> "397.693.1309"

FactoryHelper::PhoneNumber.cell_phone #=> "(186)285-7925"

# NOTE NOTE NOTE NOTE
# For the 'US only' methods below, first you must do the following:
FactoryHelper::Config.locale = 'en-US'

# US only
FactoryHelper::PhoneNumber.area_code #=> "201"

# US only
FactoryHelper::PhoneNumber.exchange_code #=> "208"

# Optional parameter: length=4
FactoryHelper::PhoneNumber.subscriber_number #=> "3873"

FactoryHelper::PhoneNumber.subscriber_number(2) #=> "39"

FactoryHelper::PhoneNumber.extension #=> "3764"

```

###FactoryHelper::Time
---------------------

```ruby
# Random date between dates
FactoryHelper::Time.between(2.days.ago, Time.now) #=> "2014-09-18 12:30:59 -0700"

# Random date between dates (within specified part of the day)
FactoryHelper::Time.between(2.days.ago, Time.now, :all) #=> "2014-09-19 07:03:30 -0700"
FactoryHelper::Time.between(2.days.ago, Time.now, :day) #=> "2014-09-18 16:28:13 -0700"
FactoryHelper::Time.between(2.days.ago, Time.now, :night) #=> "2014-09-20 19:39:38 -0700"
FactoryHelper::Time.between(2.days.ago, Time.now, :morning) #=> "2014-09-19 08:07:52 -0700"
FactoryHelper::Time.between(2.days.ago, Time.now, :afternoon) #=> "2014-09-18 12:10:34 -0700"
FactoryHelper::Time.between(2.days.ago, Time.now, :evening) #=> "2014-09-19 20:21:03 -0700"
FactoryHelper::Time.between(2.days.ago, Time.now, :midnight) #=> "2014-09-20 00:40:14 -0700"

# Random time in the future (up to maximum of N days)
FactoryHelper::Time.forward(23, :morning) # => "2014-09-26 06:54:47 -0700"

# Random time in the past (up to maximum of N days)
FactoryHelper::Time.backward(14, :evening) #=> "2014-09-17 19:56:33 -0700"
```

###FactoryHelper::Hacker
---------------------
Are you having trouble writing tech-savvy dialogue for your latest screenplay?
Worry not! Hollywood-grade technical talk is ready to fill out any form where you need to look smart.

```ruby
# Full Phrase
FactoryHelper::Hacker.say_something_smart #=> "Try to compress the SQL interface, maybe it will program the back-end hard drive!"

# Short technical abbreviations
FactoryHelper::Hacker.abbreviation  #=> "RAM"

# Hacker centric adjectives
FactoryHelper::Hacker.adjective   #=> "open-source"

# Only the best hacker related nouns
FactoryHelper::Hacker.noun   #=> "bandwidth"

# Actions that hackers take
FactoryHelper::Hacker.verb  #=> "bypass"

# Verbs that end in -ing
FactoryHelper::Hacker.ingverb #=> "synthesizing"
```

###FactoryHelper::App
-----------------

```ruby

FactoryHelper::App.name #=> "Treeflex"

FactoryHelper::App.version #=> "0.7.9"

FactoryHelper::App.author #=> "Daphne Swift"

```

Customization
------------
Since you may want to make addresses and other types of data look different
depending on where in the world you are (US postal codes vs. UK postal codes,
for example), FactoryHelper uses the I18n gem to store strings (like state names) and
formats (US postal codes are NNNNN while UK postal codes are AAN NAA),
allowing you to get different formats by switching locales.  Just set
FactoryHelper::Config.locale to the locale you want, and FactoryHelper will take care of the
rest.

If your locale doesn't already exist, create it in the \lib\locales\ directory
and you can then override or add elements to suit

```yaml

en-au-ocker:
  factory_helper:
    name:
      # Exiting factory_helper field, new data
      first_name: [Charlotte, Ava, Chloe, Emily]

      # New factory_helper fields
      ocker_first_name: [Bazza, Bluey, Davo, Johno, Shano, Shazza]
      region: [South East Queensland, Wide Bay Burnett, Margaret River, Port Pirie, Gippsland, Elizabeth, Barossa]

```

Contributing
------------
See [CONTRIBUTING.md](https://github.com/factory-helper/factory-helper/blob/master/CONTRIBUTING.md).

Contact
-------
Comments and feedback are welcome. Send an email to factory-helper@googlegroups.com.

License
-------
This code is free to use under the terms of the MIT license.
