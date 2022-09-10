class TodoMailer < ApplicationMailer
    def send_at_the_time(user,task)
        @user = user
        @task = task
        mail to: @user.email, subject: 'タスクの時間です。'
    end
end
