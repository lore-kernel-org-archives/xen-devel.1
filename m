From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] xen/credit2: Drop unnecessary bit test
Date: Thu, 11 Jan 2018 16:48:25 +0000
Message-ID: <1515689305-29482-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
LS0tCkNDOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+CkNDOiBE
YXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgoKTm90aWNlcyBieSBjaGFuY2Ugd2hp
bGUgaW5zcGVjdGluZyB0aGUgZGlzYXNzZW1ibHkgZGVsdGEgZm9yICJ4ODYvYml0b3BzOgpJbnRy
b2R1Y2UgdmFyaWFibGUvY29uc3RhbnQgcGFpcnMgZm9yIF9fe3NldCxjbGVhcixjaGFuZ2V9X2Jp
dCgpIgotLS0KIHhlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1v
bi9zY2hlZF9jcmVkaXQyLmMgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYwppbmRleCAxOGYz
OWNhLi5lZTk3NjhlIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYworKysg
Yi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYwpAQCAtMjA2Myw3ICsyMDYzLDcgQEAgY3NjaGVk
Ml92Y3B1X3NsZWVwKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHZjcHUgKnZj
KQogICAgICAgICB1cGRhdGVfbG9hZChvcHMsIHN2Yy0+cnFkLCBzdmMsIC0xLCBOT1coKSk7CiAg
ICAgICAgIHJ1bnFfcmVtb3ZlKHN2Yyk7CiAgICAgfQotICAgIGVsc2UgaWYgKCBzdmMtPmZsYWdz
ICYgQ1NGTEFHX2RlbGF5ZWRfcnVucV9hZGQgKQorICAgIGVsc2UKICAgICAgICAgX19jbGVhcl9i
aXQoX19DU0ZMQUdfZGVsYXllZF9ydW5xX2FkZCwgJnN2Yy0+ZmxhZ3MpOwogfQogCi0tIAoyLjEu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
