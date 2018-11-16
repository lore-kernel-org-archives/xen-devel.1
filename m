From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 2/3] automation: introduce some RANDCONFIG tests
Date: Fri, 16 Nov 2018 13:12:29 +0000
Message-ID: <20181116131230.25885-3-wei.liu2@citrix.com>
References: <20181116131230.25885-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cpgy=n3=citrix.com=prvs=851546e96=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gNdvH-0007BA-EM
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 13:12:35 +0000
In-Reply-To: <20181116131230.25885-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiAuZ2l0bGFi
LWNpLnltbCB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS8uZ2l0bGFiLWNpLnltbCBiLy5naXRsYWItY2ku
eW1sCmluZGV4IDFjN2IzZDNkNWIuLmIyNjgxODJiYzYgMTAwNjQ0Ci0tLSBhLy5naXRsYWItY2ku
eW1sCisrKyBiLy5naXRsYWItY2kueW1sCkBAIC0yMjcsNiArMjI3LDE4IEBAIGRlYmlhbi11bnN0
YWJsZS1nY2MtZGVidWc6CiAgIHZhcmlhYmxlczoKICAgICBDT05UQUlORVI6IGRlYmlhbjp1bnN0
YWJsZQogCitkZWJpYW4tdW5zdGFibGUtZ2NjLXJhbmRjb25maWc6CisgIGV4dGVuZHM6IC5nY2Mt
eDg2LTY0LWJ1aWxkCisgIHZhcmlhYmxlczoKKyAgICBDT05UQUlORVI6IGRlYmlhbjp1bnN0YWJs
ZQorICAgIFJBTkRDT05GSUc6IHkKKworZGViaWFuLXVuc3RhYmxlLWdjYy1kZWJ1Zy1yYW5kY29u
ZmlnOgorICBleHRlbmRzOiAuZ2NjLXg4Ni02NC1idWlsZC1kZWJ1ZworICB2YXJpYWJsZXM6Cisg
ICAgQ09OVEFJTkVSOiBkZWJpYW46dW5zdGFibGUKKyAgICBSQU5EQ09ORklHOiB5CisKIGRlYmlh
bi11bnN0YWJsZS0zMi1jbGFuZzoKICAgZXh0ZW5kczogLmNsYW5nLXg4Ni0zMi1idWlsZAogICB2
YXJpYWJsZXM6CkBAIC0zMTAsMyArMzIyLDE1IEBAIGRlYmlhbi11bnN0YWJsZS1nY2MtZGVidWct
YXJtNjQ6CiAgIGV4dGVuZHM6IC5nY2MtYXJtNjQtYnVpbGQtZGVidWcKICAgdmFyaWFibGVzOgog
ICAgIENPTlRBSU5FUjogZGViaWFuOnVuc3RhYmxlLWFybTY0djgKKworZGViaWFuLXVuc3RhYmxl
LWdjYy1hcm02NC1yYW5kY29uZmlnOgorICBleHRlbmRzOiAuZ2NjLWFybTY0LWJ1aWxkCisgIHZh
cmlhYmxlczoKKyAgICBDT05UQUlORVI6IGRlYmlhbjp1bnN0YWJsZS1hcm02NHY4CisgICAgUkFO
RENPTkZJRzogeQorCitkZWJpYW4tdW5zdGFibGUtZ2NjLWRlYnVnLWFybTY0LXJhbmRjb25maWc6
CisgIGV4dGVuZHM6IC5nY2MtYXJtNjQtYnVpbGQtZGVidWcKKyAgdmFyaWFibGVzOgorICAgIENP
TlRBSU5FUjogZGViaWFuOnVuc3RhYmxlLWFybTY0djgKKyAgICBSQU5EQ09ORklHOiB5Ci0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
