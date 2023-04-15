# IP-traffic-separation

IP 流量分離工具
這是一個用於在 Linux 系統上實現 IPv4 IP 地址流量分離（IP Traffic Separation）的 Shell 腳本。通過配置網路地址轉換 (NAT) 規則和 IP 轉發規則，可以將一個 IPv4 接收流量、另一個 IPv4 發送流量的功能實現到不同的網卡介面上。

## 如何使用
要使用此腳本，請運行以下命令：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/younasiqw/IP-traffic-separation/main/IP%20separation.sh)
```
此命令將自動從 GitHub 代碼庫中獲取最新版本的腳本，在您的 Linux 系統上執行它。當腳本運行時，您需要輸入入口和出口網路介面及其對應的 IP 位址。腳本會根據您的輸入配置 NAT 和 IP 轉發規則，並在完成後顯示提示資訊。

請注意，在使用此腳本之前，請確保已經了解您的網路拓撲和安全需求，並且您已經掌握基本的 Linux 命令和網路知識。
