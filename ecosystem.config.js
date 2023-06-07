module.exports = {
  apps : [{
    name: "BackendTimes", //aplication Name
    script: 'app.js', //script to run [ex: server.js or directory src/]
    watch: false, //automatic reload when changes happens
    instances: 1, //instances of app, [if value "-1" <-- auto generate by cpu core]
    exec_mode: "cluster", //execmode fork or cluster
    env: {
      "PORT": 8008,
    },
    env_integration: {
      "PORT": 8008,
      "NODE_ENV": "development"
    },
    env_uat: {
      "PORT": 8008,
      "NODE_ENV": "uat"
    },
    env_production: {
      "PORT": 8008,
      "NODE_ENV": "production"
    },
  }, {
    script: './service-worker/',
    watch: ['./service-worker']
  }],

  // deploy : {
  //   production : {
  //     user : 'SSH_USERNAME',
  //     host : 'SSH_HOSTMACHINE',
  //     ref  : 'origin/master',
  //     repo : 'GIT_REPOSITORY',
  //     path : 'DESTINATION_PATH',
  //     'pre-deploy-local': '',
  //     'post-deploy' : 'npm install && pm2 reload ecosystem.config.js --env production',
  //     'pre-setup': ''
  //   }
  // }
};
