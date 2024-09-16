FROM ruby:3.2.2-slim

RUN apt update -qq && apt install -y build-essential libpq-dev nodejs

WORKDIR /app

COPY . .

RUN bundle install

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

ENV RAILS_ENV=development

CMD ["rails", "server", "-b", "0.0.0.0"]