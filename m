From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH for-next 3/5] automation: add a script to build
 newly pushed commits in Gitlab CI
Date: Thu, 28 Feb 2019 13:44:46 +0000
Message-ID: <20190228134448.6097-4-wei.liu2@citrix.com>
References: <20190228134448.6097-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0So3=RD=citrix.com=prvs=955226cfb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gzLzz-00070h-ML
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 13:45:19 +0000
In-Reply-To: <20190228134448.6097-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiBhdXRvbWF0
aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5zaCB8IDE2ICsrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA3NTUgYXV0
b21hdGlvbi9naXRsYWItY2kvYnVpbGQtZWFjaC1jb21taXQuc2gKCmRpZmYgLS1naXQgYS9hdXRv
bWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5zaCBiL2F1dG9tYXRpb24vZ2l0bGFi
LWNpL2J1aWxkLWVhY2gtY29tbWl0LnNoCm5ldyBmaWxlIG1vZGUgMTAwNzU1CmluZGV4IDAwMDAw
MDAwMDAuLjViMmUyMjQ3MTAKLS0tIC9kZXYvbnVsbAorKysgYi9hdXRvbWF0aW9uL2dpdGxhYi1j
aS9idWlsZC1lYWNoLWNvbW1pdC5zaApAQCAtMCwwICsxLDE2IEBACisjIS9iaW4vYmFzaAorCisj
IEZvciBhIG5ld2x5IHB1c2hlZCBicmFuY2ggdGhlIEJFRk9SRV9TSEEgd2lsbCBiZSBhbGwgMHMK
K2lmIFtbICR7Q0lfQ09NTUlUX0JFRk9SRV9TSEF9ID09IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAgXV07IHRoZW4KKyAgICBlY2hvICJOZXdseSBwdXNoZWQgYnJhbmNo
LCBza2lwcGVkIgorICAgIGV4aXQgMAorZmkKKworZ2l0IG1lcmdlLWJhc2UgLS1pcy1hbmNlc3Rv
ciAke0NJX0NPTU1JVF9CRUZPUkVfU0hBfSAke0NJX0NPTU1JVF9TSEF9CitpZiBbWyAkPyAtbmUg
MCBdXTsgdGhlbgorICAgIGVjaG8gIiR7Q0lfQ09NTUlUX1NIQX0gaXMgbm90IGEgZGVzY2VuZGVu
dCBvZiAke0NJX0NPTU1JVF9CRUZPUkVfU0hBfSwgc2tpcHBlZCIKKyAgICBleGl0IDAKK2ZpCisK
K05PTl9TWU1CT0xJQ19SRUY9MSAuL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZC10ZXN0LnNoICR7
Q0lfQ09NTUlUX0JFRk9SRV9TSEF9ICR7Q0lfQ09NTUlUX1NIQX0gXAorICAgICAgIAliYXNoIC1j
ICJtYWtlIC1qNCBkaXN0Y2xlYW4gJiYgLi9hdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQiCi0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
