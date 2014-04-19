# NasctechWorkflow

Tools collection for automate processes with redmine.

## Installation

  1. gem install nasctech_workflow --source https://eKbwPx4qxkWgqzAwGXFZ@gem.fury.io/bolkabolka/
  2. create .nasctech_workflow.yml at your home directory
    
    ######Example
      > - `redmine:`
      >   - `site: 'http://redmine.nasctech.com/'`
      >   - `user: superman`
      >   - `password: nooneknow`

## Usage

nw -v

## Features Plan
  1. Add options_parser
    * -p merged to parent
    * -k keep in branch
  2. Get ticket id from last commit

## Contributing

1. Fork it ( http://github.com/<my-github-username>/nasctech_workflow/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
