desc "This task is file is for setting up roles and users for the app"
task :setup_admin => :environment do

 # please uncomment code below if setting up for the first time
 # Role.delete_all
 # Role.create(name: "ADMIN")
 # Role.create(name: "STUDENT")

 #admin login after rake_setup is,username: example@hotmail.com password:hello1234
 User.create(firstname: "example",lastname: "rake",email: "example@hotmail.com",password: "hello1234")
 User.create(firstname: "jim",lastname:"parson",email: "jim@john.com",password: "hello1234")

 Permission.create(user_id: User.find_by_email("example@hotmail.com").id,role_id: Role.find_by_name("ADMIN").id)
 Permission.create(user_id: User.find_by_email("jim@john.com").id,role_id: Role.find_by_name("STUDENT").id)

end
