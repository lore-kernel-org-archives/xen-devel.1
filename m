From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 21/34] x86/mm: p2m_flush and nvcpu_flush are HVM
 only
Date: Fri, 17 Aug 2018 16:12:39 +0100
Message-ID: <e8c4ff53a1b67c443b987cf77991787b53c30db0.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqgg8-0001VE-3l
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:28:44 +0000
In-Reply-To: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

cDJtX2ZsdXNoIGlzIG9ubHkgY2FsbGVkIGJ5IEhBUCBjb2RlLCBudmNwdV9mbHVzaCBpcyBvbmx5
IHVzZWZ1bCBmb3IKbmVzdGVkaHZtLCBib3RoIG9mIHdoaWNoIGRlcGVuZCBvbiBIVk0gc3VwcG9y
dC4KCkVuY2xvc2UgdGhlaXIgY29kZSBpbiBDT05GSUdfSFZNLiBBZGQgYXNzZXJ0aW9ucy4KClNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gv
eDg2L21tL3AybS5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJt
LmMKaW5kZXggMTA4OWI4Ni4uMWEwNGIzNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL3Ay
bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwpAQCAtMTc4NSwxMCArMTc4NSwxMyBAQCBw
Mm1fZmx1c2hfdGFibGUoc3RydWN0IHAybV9kb21haW4gKnAybSkKIHZvaWQKIHAybV9mbHVzaChz
dHJ1Y3QgdmNwdSAqdiwgc3RydWN0IHAybV9kb21haW4gKnAybSkKIHsKKyNpZiBDT05GSUdfSFZN
CisgICAgQVNTRVJUKGlzX2h2bV92Y3B1KHYpKTsKICAgICBBU1NFUlQodi0+ZG9tYWluID09IHAy
bS0+ZG9tYWluKTsKICAgICB2Y3B1X25lc3RlZGh2bSh2KS5udl9wMm0gPSBOVUxMOwogICAgIHAy
bV9mbHVzaF90YWJsZShwMm0pOwogICAgIGh2bV9hc2lkX2ZsdXNoX3ZjcHUodik7CisjZW5kaWYK
IH0KIAogdm9pZApAQCAtMTgzOSw4ICsxODQyLDExIEBAIHN0YXRpYyB2b2lkIGFzc2lnbl9ucDJt
KHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQogCiBzdGF0aWMgdm9pZCBu
dmNwdV9mbHVzaChzdHJ1Y3QgdmNwdSAqdikKIHsKKyNpZiBDT05GSUdfSFZNCisgICAgQVNTRVJU
KGlzX2h2bV92Y3B1KHYpKTsKICAgICBodm1fYXNpZF9mbHVzaF92Y3B1KHYpOwogICAgIHZjcHVf
bmVzdGVkaHZtKHYpLnN0YWxlX25wMm0gPSB0cnVlOworI2VuZGlmCiB9CiAKIHN0cnVjdCBwMm1f
ZG9tYWluICoKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
