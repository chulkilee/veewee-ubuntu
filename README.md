# vewee-ubuntu

    # 1. install virtualbox
    # 2. install required gems
        bundle install
    # 3. build basebox, ubuntu-12.04.box
        bundle exec rake build
    # 4. add box from the basebox
        BOX_NAME='your-box-name' bundle exec rake vagrant:add

Most definitions are based on [Bento](https://github.com/opscode/bento).
