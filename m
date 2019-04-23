From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] xen/timers: Fix memory leak with cpu
 unplug/plug (take 2)
Date: Tue, 23 Apr 2019 16:49:53 +0100
Message-ID: <1556034593-3692-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RGA1=SZ=citrix.com=prvs=00953f314=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hIxgF-0007Ie-GJ
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 15:49:59 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

UHJldmlvdXMgYXR0ZW1wdHMgdG8gZml4IHRoaXMgbGVhayBmYWlsZWQgdG8gaWRlbnRpZnkgdGhl
IHJvb3QgY2F1c2UsIGFuZAp1bHRpbWF0ZWx5IGZhaWxlZC4gIFRoZSBjYXVzZSBpcyB0aGUgQ1BV
X1VQX1BSRVBBUkUgY2FzZSAocmUpaW5pdGlhbGlzaW5nCnRzLT5oZWFwIGJhY2sgdG8gZHVtbXlf
aGVhcCwgd2hpY2ggbGVha3MgdGhlIHByZXZpb3VzIGFsbG9jYXRpb24uCgpSZWFycmFuZ2UgdGhl
IGxvZ2ljIHRvIG9ubHkgaW5pdGlhbGlzZSB0cyBvbmNlLiAgVGhpcyBhbHNvIGF2b2lkcyB0aGUK
cmVkdW5kYW50IChidXQgYmVuaWduLCBkdWUgdG8gdHMtPmluYWN0aXZlIGFsd2F5cyBiZWluZyBl
bXB0eSkgaW5pdGlhbGlzaW5nIG9mCnRoZSBvdGhlciB0cyBmaWVsZHMuCgpTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEdlb3Jn
ZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ0M6IEphbiBCZXVsaWNoIDxK
QmV1bGljaEBzdXNlLmNvbT4KQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtA
b3JhY2xlLmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KQ0M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVu
L2NvbW1vbi90aW1lci5jIHwgMTAgKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3RpbWVyLmMg
Yi94ZW4vY29tbW9uL3RpbWVyLmMKaW5kZXggZjYwNzEyYS4uNjUwZTM5OCAxMDA2NDQKLS0tIGEv
eGVuL2NvbW1vbi90aW1lci5jCisrKyBiL3hlbi9jb21tb24vdGltZXIuYwpAQCAtNjU3LDkgKzY1
NywxMyBAQCBzdGF0aWMgaW50IGNwdV9jYWxsYmFjaygKICAgICBzd2l0Y2ggKCBhY3Rpb24gKQog
ICAgIHsKICAgICBjYXNlIENQVV9VUF9QUkVQQVJFOgotICAgICAgICBJTklUX0xJU1RfSEVBRCgm
dHMtPmluYWN0aXZlKTsKLSAgICAgICAgc3Bpbl9sb2NrX2luaXQoJnRzLT5sb2NrKTsKLSAgICAg
ICAgdHMtPmhlYXAgPSBkdW1teV9oZWFwOworICAgICAgICAvKiBPbmx5IGluaXRpYWxpc2UgdHMg
b25jZS4gKi8KKyAgICAgICAgaWYgKCAhdHMtPmhlYXAgKQorICAgICAgICB7CisgICAgICAgICAg
ICBJTklUX0xJU1RfSEVBRCgmdHMtPmluYWN0aXZlKTsKKyAgICAgICAgICAgIHNwaW5fbG9ja19p
bml0KCZ0cy0+bG9jayk7CisgICAgICAgICAgICB0cy0+aGVhcCA9IGR1bW15X2hlYXA7CisgICAg
ICAgIH0KICAgICAgICAgYnJlYWs7CiAKICAgICBjYXNlIENQVV9VUF9DQU5DRUxFRDoKLS0gCjIu
MS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
