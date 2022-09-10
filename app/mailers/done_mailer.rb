class DoneMailer < ApplicationMailer
    def send_when_done(task)
        @task = task
        mail to: task.user.email, subject: 'タスクの時間です。'
    end
end
