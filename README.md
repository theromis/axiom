shell script will get output of `awscli` command

```shell
$ aws ec2 describe-instances --output text --query 'Reservations[*].Instances[*].[InstanceId, InstanceType, ImageId, State.Name, LaunchTime, Placement.AvailabilityZone, Placement.Tenancy, PrivateIpAddress, PrivateDnsName, PublicDnsName, [Tags[?Key==`Name`].Value] [0][0], [Tags[?Key==`Role`].Value] [0][0], [Tags[?Key==`SysHostName`].Value] [0][0], [Tags[?Key==`Product`].Value] [0][0], [Tags[?Key==`Project`].Value] [0][0] ]'
i-07c3aa6e19c3f13c3	t2.micro	ami-09a3d8a7177216dcf	running	2019-09-11T02:53:30.000Z	us-west-2b	default	172.31.29.154	ip-172-31-29-154.us-west-2.compute.internal	ec2-34-209-210-11.us-west-2.compute.amazonaws.com	test-u18	None	None	None	None
```
