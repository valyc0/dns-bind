$ORIGIN .
$TTL 86400	; 1 day
esempio.com		IN SOA	ns1.esempio.com. admin.esempio.com. (
				2025010908 ; serial
				3600       ; refresh (1 hour)
				1800       ; retry (30 minutes)
				1209600    ; expire (2 weeks)
				86400      ; minimum (1 day)
				)
			NS	ns1.esempio.com.
$ORIGIN esempio.com.
$TTL 300	; 5 minutes
51594f001893		A	172.16.238.11
$TTL 86400	; 1 day
client1			A	172.16.238.11
client2			A	172.16.238.12
ns1			A	172.16.238.10
