From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12 v3 0/5] xen/arm: Implement Set/Way
 operations
Date: Fri, 14 Dec 2018 11:58:50 +0000
Message-ID: <20181214115855.6713-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=16tG=OX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gXm7T-0001Gn-He
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 11:59:03 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhpcyBpcyB2ZXJzaW9uIDMgb2YgdGhlIHNlcmllcyB0byBpbXBsZW1lbnQgc2V0
L3dheS4gRm9yIG1vcmUgZGV0YWlscyBzZWUKcGF0Y2ggIzQuCgpBIGJyYW5jaCB3aXRoIHRoZSBj
b2RlIGlzIGF2YWlsYWJsZSBhdDoKCmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3Bl
b3BsZS9qdWxpZW5nL3hlbi11bnN0YWJsZS5naXQKYnJhbmNoIGNhY2hlZmx1c2gvdjMKCkNoZWVy
cywKCkp1bGllbiBHcmFsbCAoNSk6CiAgeGVuL2FybTogdmNwcmVnOiBBZGQgd3JhcHBlcnMgdG8g
aGFuZGxlIGNvLXByb2MgYWNjZXNzIHRyYXBwZWQgYnkKICAgIEhDUl9FTDIuVFZNCiAgeGVuL2Fy
bTogdnN5c3JlZzogQWRkIHdyYXBwZXIgdG8gaGFuZGxlIHN5c3JlZyBhY2Nlc3MgdHJhcHBlZCBi
eQogICAgSENSX0VMMi5UVk0KICB4ZW4vYXJtOiBwMm06IEFkZCBzdXBwb3J0IGZvciBwcmVlbXB0
aW9uIGluIHAybV9jYWNoZV9mbHVzaF9yYW5nZQogIHhlbi9hcm06IEltcGxlbWVudCBTZXQvV2F5
IG9wZXJhdGlvbnMKICB4ZW4vYXJtOiBUcmFjayBwYWdlIGFjY2Vzc2VkIGJldHdlZW4gYmF0Y2gg
b2YgU2V0L1dheSBvcGVyYXRpb25zCgogeGVuL2FyY2gvYXJtL2FybTY0L3ZzeXNyZWcuYyB8ICA3
NSArKysrKysrKysrKysrKysrKysrCiB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgICAgICAgIHwgIDE0
ICsrKysKIHhlbi9hcmNoL2FybS9kb21jdGwuYyAgICAgICAgfCAgIDggKy0KIHhlbi9hcmNoL2Fy
bS9wMm0uYyAgICAgICAgICAgfCAxNTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tCiB4ZW4vYXJjaC9hcm0vdHJhcHMuYyAgICAgICAgIHwgIDI1ICsrKysrKy0KIHhlbi9h
cmNoL2FybS92Y3ByZWcuYyAgICAgICAgfCAxNzEgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogeGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgICB8ICAgNCArCiB4
ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAgIHwgICA1ICstCiB4ZW4vaW5jbHVkZS9hc20tYXJt
L2NwcmVncy5oIHwgICAxICsKIHhlbi9pbmNsdWRlL2FzbS1hcm0vZG9tYWluLmggfCAgIDggKysK
IHhlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmggICAgfCAgMjYgKysrKysrLQogeGVuL2luY2x1ZGUv
eGVuL2RvbWFpbi5oICAgICB8ICAgMiArCiAxMiBmaWxlcyBjaGFuZ2VkLCA0ODYgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
