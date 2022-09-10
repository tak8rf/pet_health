namespace :reminders do
    desc "Send reminders"
    task :send => :environment do
        tasks = Task.where(mailer:false)
        tasks.each do |task|
            if task.start_time < Time.now
                TodoMailer.send_at_the_time(task.user,task).deliver
                task.mailer = true
                task.save
            end
        end
    end
end
