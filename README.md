# CalExporter

[![Build Status](https://travis-ci.org/sota0805/cal_exporter.svg)](https://travis-ci.org/sota0805/cal_exporter)
[![Code Climate](https://codeclimate.com/github/sota0805/cal_exporter.png)](https://codeclimate.com/github/sota0805/cal_exporter)
[![Coverage Status](https://coveralls.io/repos/sota0805/cal_exporter/badge.png)](https://coveralls.io/r/sota0805/cal_exporter)


TODO: Write a gem description

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

```
$ cal_exporter calender CALENDER_ID FILE_FORMAT SAVE_LOCATION 
```

Example code below :

```
$ cal_exporter calender engineyard.com_f0a3jqaqooc9r7kmk2hiblojgs@group.calendar.google.com jekyll ~/Desktop

$ tree
.
├── 2013-04-08-qaias4p.md
├── 2013-04-15-boenj2u.md
├── 2013-04-17-8m2aphs.md
├── 2013-04-20-fqmab6r.md
├── 2013-04-22-5itqrg3.md
├── 2013-04-23-eml2lv5.md
├── 2013-04-24-9jck6ib.md
├── 2013-04-26-go72sbm.md
...
 
```




## TODO

- Export as CSV
- Export as JSON
- Decide export one file or each event file

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cal_exporter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
