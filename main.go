package main

import (
	"fmt"
	"net"

	"github.com/fatih/color"
)

func error_check(err error) {
	if err != nil {
		fmt.Println(err)
	}
}

func check_ip_interfaces() {
	interfaces, err := net.Interfaces()
	error_check(err)
	for _, i := range interfaces {
		addrs, err := i.Addrs()
		error_check(err)

		for _, addr := range addrs {
			var ip net.IP
			switch v := addr.(type) {
			case *net.IPNet:
				ip = v.IP
			case *net.IPAddr:
				ip = v.IP
			}
			if ip == nil {
				continue
			}
			if ip.To4() != nil {
				fmt.Printf("%s%s %s%s\n",
					color.CyanString(i.Name+":"+"\t"),
					color.New(color.Reset).Sprint(" "),
					color.RedString("IPv4:"),
					color.RedString(" "+addr.String()))
			} else {
				fmt.Printf("%s%s %s%s\n",
					color.BlueString(i.Name+":"+"\t"),
					color.New(color.Reset).Sprint(" "),
					color.GreenString("IPv6:"),
					color.GreenString(" "+addr.String()))
			}
		}
	}
}

func main() {
	check_ip_interfaces()
}
