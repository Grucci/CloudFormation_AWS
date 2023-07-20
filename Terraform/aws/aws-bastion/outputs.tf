output "security_group_id" {
  value = "${aws_security_group.bastion_sg.id}"
}

output "asg_id" {
  value = "${aws_autoscaling_group.bastion_asg.id}"
}

output "bastion_eip_ids" {
  value = "${aws_eip.bastion_eip.*.id}"
}

output "bastion_public_ips" {
  value = "${aws_eip.bastion_eip.*.public_ip}"
}

output "bastion_public_dns" {
  value = "${aws_eip.bastion_eip.*.public_dns}"
}

output "bastion_cloud_init" {
  value = data.template_cloudinit_config.bastion_userdata.rendered
}
