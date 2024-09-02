# Define the master node
resource "aws_instance" "k8s_master" {
  ami                    = var.master_ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group]
  key_name               = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "${var.instance_name}-master"
  }
}

# Define the worker nodes with count set to 2
resource "aws_instance" "k8s_worker" {
  count                  = 2  # Set to create two worker nodes
  ami                    = var.worker_ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group]
  key_name               = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "${var.instance_name}-worker-${count.index + 1}"
  }
}
