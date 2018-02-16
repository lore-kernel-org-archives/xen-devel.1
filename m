From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] hvm/monitor: fix usage of the control register
	mask
Date: Fri, 16 Feb 2018 12:18:37 +0000
Message-ID: <20180216121837.7317-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=c1s1=fk=citrix.com=prvs=57802d2d1=roger.pau@srs-us1.protection.inumbo.net>)
 id 1emeyx-0004Gs-Bj
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 12:19:15 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UHJldmlvdXMgdXNhZ2UgaXMgbm90IGNvcnJlY3QgYW5kIHdvdWxkIHByZXZlbnQgY2VydGFpbiB1
cGRhdGVzIGZyb20KYmVpbmcgbm90aWZpZWQgdG8gdGhlIG1vbml0b3IgY2xpZW50LgoKRm9yIGV4
YW1wbGUgaWYgKHZhbHVlIF4gb2xkKSA9PSAoUEdFIHwgUFNFKSBhbmQgbWFzayA9PSBQR0UgdGhp
cwp1cGRhdGUgd291bGQgbm90IGJlIG5vdGlmaWVkLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogUmF6dmFuIENvam9jYXJ1IDxy
Y29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgpDYzogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xl
bmd5ZWwuY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZt
L21vbml0b3IuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vbW9uaXRvci5jIGIveGVuL2Fy
Y2gveDg2L2h2bS9tb25pdG9yLmMKaW5kZXggMTMxYjg1MjA5Zi4uMDQ2NjVjNWY2YyAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9tb25pdG9yLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9t
b25pdG9yLmMKQEAgLTM5LDcgKzM5LDcgQEAgYm9vbCBodm1fbW9uaXRvcl9jcih1bnNpZ25lZCBp
bnQgaW5kZXgsIHVuc2lnbmVkIGxvbmcgdmFsdWUsIHVuc2lnbmVkIGxvbmcgb2xkKQogICAgIGlm
ICggKGFkLT5tb25pdG9yLndyaXRlX2N0cmxyZWdfZW5hYmxlZCAmIGN0cmxyZWdfYml0bWFzaykg
JiYKICAgICAgICAgICghKGFkLT5tb25pdG9yLndyaXRlX2N0cmxyZWdfb25jaGFuZ2Vvbmx5ICYg
Y3RybHJlZ19iaXRtYXNrKSB8fAogICAgICAgICAgIHZhbHVlICE9IG9sZCkgJiYKLSAgICAgICAg
ICghKCh2YWx1ZSBeIG9sZCkgJiBhZC0+bW9uaXRvci53cml0ZV9jdHJscmVnX21hc2tbaW5kZXhd
KSkgKQorICAgICAgICAgKCh2YWx1ZSBeIG9sZCkgJiB+YWQtPm1vbml0b3Iud3JpdGVfY3RybHJl
Z19tYXNrW2luZGV4XSkgKQogICAgIHsKICAgICAgICAgYm9vbCBzeW5jID0gYWQtPm1vbml0b3Iu
d3JpdGVfY3RybHJlZ19zeW5jICYgY3RybHJlZ19iaXRtYXNrOwogCi0tIAoyLjE2LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
