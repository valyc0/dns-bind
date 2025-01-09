# DNS BIND Configuration Guide

This guide provides instructions for setting up and configuring DNS BIND in a Docker environment.

## Prerequisites

- Docker installed on your system
- Docker Compose installed
- Basic understanding of DNS concepts
- Administrative access to your system

## Installation and Configuration

### Server Side Setup

Start the DNS BIND server using Docker Compose:

```bash
docker-compose up
```

### Client Side Configuration

1. Access the client container:
```bash
docker exec -it client1 bash
```

2. Configure the DNS server:
```bash
echo "nameserver 172.16.238.10" > /etc/resolv.conf
```

3. Install required DNS utilities:
```bash
apt-get update && apt-get install -y dnsutils
```

4. Update DNS configuration:
```bash
/scripts/update-dns1.sh
```

## to generate key in named.conf
```bash
openssl rand -base64 32
```


## Verification

To verify that your DNS configuration is working correctly, use the dig command:

```bash
dig @172.16.238.10 client1.esempio.com
```

This command should return the DNS records for client1.esempio.com from your configured BIND server.

## Troubleshooting

If you encounter issues:

1. Verify that the BIND server container is running
2. Check that the DNS server IP address is correctly configured
3. Ensure the DNS utilities are properly installed
4. Review the BIND server logs for any error messages

## Additional Resources

For more information about BIND DNS server:
- [BIND Documentation](https://www.isc.org/bind/)
- [Docker Hub BIND Image](https://hub.docker.com/_/bind)

## Support

If you need assistance, please:
1. Check the troubleshooting section
2. Review the BIND documentation
3. Open an issue in the repository

## License

This documentation is provided under the MIT License. Feel free to modify and distribute as needed.
