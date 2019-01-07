From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH 0/6] clean up MSR save/restore code
Date: Mon, 7 Jan 2019 12:02:52 +0000
Message-ID: <20190107120258.17897-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F0Vb=PP=citrix.com=prvs=90328960c=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1ggTe5-0004UL-T5
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 12:04:41 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UGF0Y2ggIzYgaXMgbm90IHN0cmljdGx5IHJlbGF0ZWQgdG8gc2F2ZS9yZXN0b3JlLiBJdCdzIGp1
c3QgY2xlYW4tdXAgb2YKc29tZXRoaW5nIEkgbm90aWNlZCBhbG9uZyB0aGUgd2F5LgoKUGF1bCBE
dXJyYW50ICg2KToKICB4ODY6IHN0b3AgaGFuZGxpbmcgTVNSX0lBMzJfQk5EQ0ZHUyBzYXZlL3Jl
c3RvcmUgaW4gaW1wbGVtZW50YXRpb24KICAgIGNvZGUKICB4ODY6IHNhdmUgR1VFU1RfQk5EQ0ZH
UyBvbiBjb250ZXh0IHN3aXRjaC4uLgogIHg4NjogbW92ZSB0aGUgc2F2ZWQgdmFsdWUgb2YgTVNS
X0lBMzJfWFNTIGludG8gc3RydWN0IHZjcHVfbXNycwogIHg4Njogc3RvcCBoYW5kbGluZyBNU1Jf
SUEzMl9YU1Mgc2F2ZS9yZXN0b3JlIGluIGltcGxlbWVudGF0aW9uIGNvZGUKICB4ODY6IHJlbW92
ZSBkZWZ1bmN0IGluaXQvbG9hZC9zYXZlX21zcigpIGh2bV9mdW5jcwogIHg4NjogaW50cm9kdWNl
IGRyX21hc2tfaWR4KCkgaGVscGVyIGZ1bmN0aW9uLi4uCgogeGVuL2FyY2gveDg2L2RvbWFpbi5j
ICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAgfCAxMDIg
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92
bXguYyAgICAgfCAgODMgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYv
bXNyLmMgICAgICAgICAgICAgfCAgNDggKysrKysrKysrKystLS0tLQogeGVuL2FyY2gveDg2L3B2
L2VtdWwtcHJpdi1vcC5jIHwgICAyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaCAg
fCAgMTcgKystLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92Y3B1LmggfCAgIDEgLQogeGVu
L2luY2x1ZGUvYXNtLXg4Ni9tc3IuaCAgICAgIHwgIDMzICsrKysrKysrKystCiA4IGZpbGVzIGNo
YW5nZWQsIDEzMyBpbnNlcnRpb25zKCspLCAxNTUgZGVsZXRpb25zKC0pCi0tLQpDYzogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KQ2M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4K
Q2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgpDYzogIlJvZ2VyIFBhdSBNb25u
w6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
