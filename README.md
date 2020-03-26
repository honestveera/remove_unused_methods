# Comment OR Remove Unused methods

  How can we found unused code in Rails?
  
  We can found unused code using  `rails_best_practices`

# Installation

Using Bundler:

    group :development do
      gem 'rails_best_practices'
    end

# Steps

1. First install brakeman gem in project
    
    `gem install rails_best_practices`
    
2. Then run the below comments

    `rails_best_practices . | grep 'remove unused methods' < output.txt`
    
3. Please check your `output.txt` file. you will get all unused methods like below

`app/controllers/admin/xxx_imports_controller.rb:32 - remove unused methods (Admin::XxxImportsController#get_yyyy_zzzz_location)
 app/controllers/admin/xxx_yyyy_controller.rb:32 - remove unused methods (Admin::XxxYyyController#yyyy_zzzz_location)`

4. Run My class. Now, go and check your directory. The unwanted methods will comment out.
   
   `CommentUnused.new.comment('output.txt')`


