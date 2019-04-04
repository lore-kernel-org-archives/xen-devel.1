From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 2/3] automation: add Fedora image to
 containerize script
Date: Thu, 4 Apr 2019 12:23:01 +0100
Message-ID: <20190404112302.4796-3-wei.liu2@citrix.com>
References: <20190404112302.4796-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VYWF=SG=citrix.com=prvs=9901e81f4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hC0Se-00021H-Hj
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 11:23:12 +0000
In-Reply-To: <20190404112302.4796-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXQgdGhlIHNhbWUgdGltZSBzb3J0IHRoZSBsaXN0IGFscGhhYmV0aWNhbGx5LgoKU2lnbmVkLW9m
Zi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiBhdXRvbWF0aW9uL3Njcmlw
dHMvY29udGFpbmVyaXplIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFp
bmVyaXplIGIvYXV0b21hdGlvbi9zY3JpcHRzL2NvbnRhaW5lcml6ZQppbmRleCAwMWM0NGRhOTNj
Li5hNzgwOWIzMDEwIDEwMDc1NQotLS0gYS9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXpl
CisrKyBiL2F1dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJpemUKQEAgLTE5LDEwICsxOSwxMSBA
QCBjYXNlICJfJHtDT05UQUlORVJ9IiBpbgogICAgIF9jZW50b3M2KSBDT05UQUlORVI9IiR7QkFT
RX0vY2VudG9zOjYiIDs7CiAgICAgX2NlbnRvczcpIENPTlRBSU5FUj0iJHtCQVNFfS9jZW50b3M6
NyIgOzsKICAgICBfY2VudG9zNzIpIENPTlRBSU5FUj0iJHtCQVNFfS9jZW50b3M6Ny4yIiA7Owot
ICAgIF90cnVzdHkpIENPTlRBSU5FUj0iJHtCQVNFfS91YnVudHU6dHJ1c3R5IiA7OwotICAgIF94
ZW5pYWwpIENPTlRBSU5FUj0iJHtCQVNFfS91YnVudHU6eGVuaWFsIiA7OworICAgIF9mZWRvcmEp
IENPTlRBSU5FUj0iJHtCQVNFfS9mZWRvcmE6bGF0ZXN0Ijs7CiAgICAgX2plc3NpZSkgQ09OVEFJ
TkVSPSIke0JBU0V9L2RlYmlhbjpqZXNzaWUiIDs7CiAgICAgX3N0cmV0Y2h8XykgQ09OVEFJTkVS
PSIke0JBU0V9L2RlYmlhbjpzdHJldGNoIiA7OworICAgIF90cnVzdHkpIENPTlRBSU5FUj0iJHtC
QVNFfS91YnVudHU6dHJ1c3R5IiA7OworICAgIF94ZW5pYWwpIENPTlRBSU5FUj0iJHtCQVNFfS91
YnVudHU6eGVuaWFsIiA7OwogZXNhYwogCiAjIFVzZSB0aGlzIHZhcmlhYmxlIHRvIGNvbnRyb2wg
d2hlaHRlciByb290IHNob3VsZCBiZSB1c2VkCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
