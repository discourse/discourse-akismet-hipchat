# discourse-akismet-hipchat

This plugin notifies hipchat when your Discourse server has new spam to review.

This plugin requires the [discourse-akismet](https://github.com/discourse/discourse-akismet) plugin
on your Discourse instance.

# Setup

You must define the following environment variables to enable the plugin:

```bash
export HIPCHAT_TOKEN='YOUR HIPCHAT TOKEN'
export NOTIFY_HIPCHAT=true;
export HIPCHAT_ROOM_ID='YOUR HIPCHAT ROOM ID';
export HIPCHAT_MSG_COLOR='COLOR YOU WANT'; # red, yellow, purple, green, gray
```

# License

MIT
