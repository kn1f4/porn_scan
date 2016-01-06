调用nmap扫描一个范围的端口，自动保存结果到gnmap文件<br>
<br>
-o 选项定义一个开始IP<br>
-e 选项定义一个结束IP<br>
-p 选项定义要扫描的端口<br>
-m 打印用于nmap扫描的一个IP段（如:1-255.1-255.1-255.1-255）<br>
<br>
也可以把要扫描的IP段保存为 /tmp/iprange.tmp （开始IP与结束IP之间使用tab符分割）<br>
例如:<br>
1.1.1.1 255.255.255.255<br>
***
Use -o option specify start ip.<br>
Use -e option specify end ip.<br>
Use -p option specify porn.<br>
Use -m option jusk print nmap need ip range, -m option only be used in final.<br>
<br>
Example:<br>
    port_scan.sh -o 1.1.1.1 -e 2.2.2.2 -m<br>
Or<br>
    port_scan.sh -o 1.1.1.1 -e 2.2.2.2<br>
