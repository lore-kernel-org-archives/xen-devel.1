From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 0/6] vhpet: add support for level triggered
 interrupts
Date: Fri, 8 Jun 2018 17:07:51 +0200
Message-ID: <20180608150758.25307-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k0yj=i2=citrix.com=prvs=690ca12ba=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fRIzo-00010K-IV
 for xen-devel@lists.xenproject.org; Fri, 08 Jun 2018 15:08:08 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBjb250YWluIGEgY291cGxlIG9mIGJ1ZyBmaXhl
cyBmb3IgdGhlIHZocGV0L3ZwdApjb2RlLCBhbmQgYWxzbyBhZGQgc3VwcG9ydCBmb3IgbGV2ZWwg
dHJpZ2dlciBpbnRlcnJ1cHRzIHRvIHZocGV0LiBMZXZlbAp0cmlnZ2VyZWQgaW50ZXJydXB0cyBh
cmUgbm90IGFuIG9wdGlvbmFsIGZlYXR1cmUgb2YgdGhlIGhwZXQgc3BlYywgc28KdGhleSBtdXN0
IGJlIGltcGxlbWVudGVkIGluIG9yZGVyIHRvIGhhdmUgYSBjb21wbGV0ZSBlbXVsYXRlZCBocGV0
CmltcGxlbWVudGF0aW9uIGluIFhlbi4KCkxhc3QgcGF0Y2ggYWRkcyBzb21lIGJhc2ljIHRlc3Rp
bmcgb2YgaHBldCAobWFpbmx5IHRoZSBsZXZlbCB0cmlnZ2VyZWQKaW50ZXJydXB0cykgdG8geHRm
LgoKVGhhbmtzLCBSb2dlci4KClJvZ2VyIFBhdSBNb25uZSAoNik6CiAgdnB0OiBmaXggY3JlYXRl
X3BlcmlvZGljX3RpbWUgdG8gdXNlIHRoZSBpcnEgcGFyYW1ldGVyCiAgdmhwZXQ6IGNoZWNrIHRo
YXQgdGhlIHNldCBpbnRlcnJ1cHQgcm91dGUgaXMgdmFsaWQKICB2cHQ6IGNvbnZlcnQgcGVyaW9k
aWNfdGltZSBmaWVsZHMgdG8gYm9vbAogIHZwdDogc3BsaXQgcGFydCBvZiBwdF9pbnRyX3Bvc3Qg
aW50byBhIHNlcGFyYXRlIGhlbHBlcgogIHZwdDogYWRkIHN1cHBvcnQgZm9yIGxldmVsIGludGVy
cnVwdHMKICB2aHBldDogYWRkIHN1cHBvcnQgZm9yIGxldmVsIHRyaWdnZXJlZCBpbnRlcnJ1cHRz
CgogeGVuL2FyY2gveDg2L2h2bS9ocGV0LmMgICAgICAgfCAgODcgKysrKysrKysrKysrKysrKysr
KysrLS0tLQogeGVuL2FyY2gveDg2L2h2bS9pODI1NC5jICAgICAgfCAgIDQgKy0KIHhlbi9hcmNo
L3g4Ni9odm0vaXJxLmMgICAgICAgIHwgIDE1ICsrKysrCiB4ZW4vYXJjaC94ODYvaHZtL3J0Yy5j
ICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L2h2bS92bGFwaWMuYyAgICAgfCAgIDggKy0t
CiB4ZW4vYXJjaC94ODYvaHZtL3ZwdC5jICAgICAgICB8IDExNiArKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pcnEuaCB8ICAgMyArLQog
eGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdnB0LmggfCAgMTMgKystLQogOCBmaWxlcyBjaGFuZ2Vk
LCAxODIgaW5zZXJ0aW9ucygrKSwgNjYgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
