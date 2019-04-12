From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] xl: handle PVH type in
 apply_global_affinity_masks again
Date: Fri, 12 Apr 2019 11:03:25 +0100
Message-ID: <20190412100325.11699-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VTWF=SO=citrix.com=prvs=99843409f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hEt1s-0007A6-Um
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 10:03:28 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QSBjYWxsIHNpdGUgaW4gY3JlYXRlX2RvbWFpbiBjYW4gY2FsbCBpdCB3aXRoIFBWSCB0eXBlLiBU
aGF0IHNpdGUgd2FzCm1pc3NlZCBkdXJpbmcgdGhlIHJldmlldyBvZiA0OGRhYjk3NjcuCgpSZWlu
c3RhdGUgUFZIIHR5cGUgaW4gdGhlIHN3aXRjaC4KClJlcG9ydGVkLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgotLS0KIHRvb2xzL3hsL3hsX3ZjcHUuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMveGwveGxfdmNwdS5jIGIvdG9vbHMv
eGwveGxfdmNwdS5jCmluZGV4IDkzYWJjYzY1YzAuLjMyOTUxMmVhYWYgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL3hsL3hsX3ZjcHUuYworKysgYi90b29scy94bC94bF92Y3B1LmMKQEAgLTc5LDYgKzc5LDcg
QEAgdm9pZCBhcHBseV9nbG9iYWxfYWZmaW5pdHlfbWFza3MobGlieGxfZG9tYWluX3R5cGUgdHlw
ZSwKIAogICAgIHN3aXRjaCAodHlwZSkgewogICAgIGNhc2UgTElCWExfRE9NQUlOX1RZUEVfSFZN
OgorICAgIGNhc2UgTElCWExfRE9NQUlOX1RZUEVfUFZIOgogICAgICAgICB0eXBlX21hc2sgPSAm
Z2xvYmFsX2h2bV9hZmZpbml0eV9tYXNrOwogICAgICAgICBicmVhazsKICAgICBjYXNlIExJQlhM
X0RPTUFJTl9UWVBFX1BWOgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
