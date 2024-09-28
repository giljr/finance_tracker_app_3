
#  💰  Docker Project - Finance App  💳


🚀 Introducing Finance Tracker App V3 with Docker Support! 🚀

The latest version of the Finance Tracker App is here, now with seamless Docker integration! Say goodbye to complex setups and get up and running in no time. Whether you're managing your personal finances or looking to explore a powerful new tool, Version 3 has you covered.

🔹 How To Install ?

    #[Insert User in docker group]
    sudo usermod -aG docker $USER
    getent group docker

    #[Install docker & verify]
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install -y docker-ce
    docker --version

    #[Start docker service]
    sudo systemctl enable docker.service
    sudo systemctl enable containerd.service

    #[Create the Finance APP]
    mkdir financeAPP
    cd financeAPP
    git clone https://github.com/giljr/finance_tracker_app_3.git
    cd finance_tracker_app_3
    docker compose up --build
    docker ps -a
    
    

Ready to dive in? Check out the GitHub repository for full instructions and code:

👉 GitHub: Finance Tracker App V3

Get started with Version 3 today and simplify your financial tracking like never before!

## Acknowledgements

 - [Jeovan Farias](https://www.linkedin.com/in/jeovan-f-6283b8145/)
 - [Bruno Vichinheski](https://www.linkedin.com/in/brunovichinheski/)
 - [Robson CAvalcante](https://www.linkedin.com/in/robson-machado-cavalcante/)

## Authors

- [@j3](https://github.com/giljr)


## 🚀 About Me
I'm a Full Stack Developer with a degree in Computer Engineering. You can explore my work and projects on my GitHub repository:

[GitHub Repo](https://github.com/giljr/fiscal_service_app)

## Episodes


👉 [v1](/) # **[Finance Tracker Epi 1](https://medium.com/jungletronics/new-finance-tracker-rails-app-c9dae81033a2)**- Build a Rails app with Bootstrap 5 via CDN, without Sprockets, Webpacker, Yarn, or npm.

👉 [v2](/) # **[Finance Tracker Epi 2](https://medium.com/jungletronics/new-finance-tracker-rails-app-99ad85b5f721)** - Bootstrap 5 compatibility, Add Gravatar service, Implement “Forgot your password?” & much more.


👉 [v3](/) # **[Finance Tracker Epi 3](https://medium.com/jungletronics/new-finance-tracker-rails-app-d423bce93828)** - Exploring the Currency Exchange API.


👉 [v4](/) # **[Docker Finance Tracker App Epi 4](https://medium.com/jungletronics/docker-intro-1c73f32db840)** - 🚀 Docker Introduction - Get Your Finance App Running in a Container!




    
## License

[MIT](https://choosealicense.com/licenses/mit/)

