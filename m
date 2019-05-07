From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 02/14] xen/x86: Constify the parameter "d" in
 mfn_to_gfn
Date: Tue,  7 May 2019 16:14:46 +0100
Message-ID: <20190507151458.29350-3-julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hO1oI-0007JC-66
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 15:15:14 +0000
In-Reply-To: <20190507151458.29350-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHBhcmFtZXRlciAiZCIgaG9sZHMgdGhlIGRvbWFpbiBhbmQgaXMgbm90IG1vZGlmaWVkIGJ5
IHRoZSBmdW5jdGlvbi4KU28gY29uc3RpZnkgaXQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gRml4IGZ1bmN0
aW9uIG5hbWUgaW4gdGhlIHRpdGxlCiAgICAgICAgLSBBZGQgSmFuJ3MgcmV2aWV3ZWQtYnkKLS0t
CiB4ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9wMm0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKaW5kZXggMjgwMWE4Y2NjYS4uYzNi
ZDEyMDIwZSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaAorKysgYi94ZW4v
aW5jbHVkZS9hc20teDg2L3AybS5oCkBAIC01MDYsNyArNTA2LDcgQEAgc3RhdGljIGlubGluZSBz
dHJ1Y3QgcGFnZV9pbmZvICpnZXRfcGFnZV9mcm9tX2dmbigKIH0KIAogLyogR2VuZXJhbCBjb252
ZXJzaW9uIGZ1bmN0aW9uIGZyb20gbWZuIHRvIGdmbiAqLwotc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBsb25nIG1mbl90b19nZm4oc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgbWZuKQorc3RhdGljIGlu
bGluZSB1bnNpZ25lZCBsb25nIG1mbl90b19nZm4oY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgbWZu
X3QgbWZuKQogewogICAgIGlmICggcGFnaW5nX21vZGVfdHJhbnNsYXRlKGQpICkKICAgICAgICAg
cmV0dXJuIGdldF9ncGZuX2Zyb21fbWZuKG1mbl94KG1mbikpOwotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
