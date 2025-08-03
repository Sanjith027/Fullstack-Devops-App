<<<<<<< HEAD
output "jenkins_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}

output "app_server_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "db_endpoint" {
  value = aws_db_instance.mysql.endpoint
}
=======
output "jenkins_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}

output "app_server_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "db_endpoint" {
  value = aws_db_instance.mysql.endpoint
}
>>>>>>> 05fc064 (Re-added infra folder as normal directory)
