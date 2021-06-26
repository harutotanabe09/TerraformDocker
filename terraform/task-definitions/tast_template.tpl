[
  {
    "name": "nginx",
    "image": "nginx:1.20.1",
    "portMappings": [
      {
        "containerPort": ${port},
        "hostPort": ${port}
      }
    ]
  }
]