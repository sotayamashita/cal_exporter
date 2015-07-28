CalExporter
============

[![Travis][travis-badge]][travis-link]
[![codeclimate][codeclimate-badge]][codeclimate-link]
[![Coverage Status][coverage-badge]][coverage-link]
[![Gem][gem-version-badge]][gem-version-link]
[![Gemnasium][gemnasium-badge]][gemnasium-link]

Export calendar data for **jekyll**.

## Installation

Add this line to your application's Gemfile:

    gem 'cal_exporter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cal_exporter

## Usage

### 1 Copy Calender ID : Select calender > Calender setting

![](https://dl.dropboxusercontent.com/u/74344418/github-image/cal_expoter.png)

### 2 Type code below:


    $ cal_exporter calendar CALENDER_ID FILE_FORMAT SAVE_LOCATION

Example code below :

    $ cal_exporter calendar engineyard.com_f0a3jqaqooc9r7kmk2hiblojgs@group.calendar.google.com jekyll ~/Desktop/meetups
    $ tree

    meetups/
     ├── 2013-04-08-qaias4p.md
     ├── 2013-04-15-boenj2u.md
     ├── 2013-04-17-8m2aphs.md
     ├── 2013-04-20-fqmab6r.md
     ├── 2013-04-22-5itqrg3.md
     ├── 2013-04-23-eml2lv5.md
     ├── 2013-04-24-9jck6ib.md
     ├── 2013-04-26-go72sbm.md
    ...

## TODO

- [ ] Export as CSV
- [ ] Export as JSON
- [ ] Decide export one file or each event file
- [ ] Export as xml

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cal_exporter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

[MIT](LICENSE) © [Sota Yamashita][me]


[me]:                https://github.com/sotayamashita/
[travis-badge]:      https://img.shields.io/travis/sotayamashita/cal_exporter.svg?style=flat-square
[travis-link]:       https://travis-ci.org/sotayamashita/cal_exporter
[codeclimate-badge]: https://img.shields.io/codeclimate/github/sotayamashita/cal_exporter.svg?style=flat-square
[codeclimate-link]:  https://codeclimate.com/github/sotayamashita/cal_exporter
[coverage-badge]:    https://img.shields.io/coveralls/sotayamashita/cal_exporter.svg?style=flat-square
[coverage-link]:     https://coveralls.io/github/sotayamashita/cal_exporter
[gem-version-badge]: https://img.shields.io/gem/sotayamashita/cal_exporter.svg?style=flat-square
[gem-version-link]:  https://rubygems.org/gems/cal_exporter
[gemnasium-badge]:   https://img.shields.io/gemnasium/sotayamashita/cal_exporter.svg?style=flat-square
[gemnasium-link]:    https://gemnasium.com/sota0805/cal_exporter



