# chat-demo-infrastructure

1) login aws console
2) select region 
3) create secrets. select other type of secrets. Name: aurora-db-credentials2
   4) add 2 key/value pairs:
      5) username: {username}
      6) password: {password}
7) navigate to `terraform` directory
8) call `terraform apply`