From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH] x86/p2m: constify p2m_mem_access_sanity_check()
Date: Wed, 21 Nov 2018 13:01:40 +0200
Message-ID: <1542798100-840-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RqMg=OA=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gPQGR-0006WC-7A
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 11:01:47 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: tamas@tklengyel.com, wei.liu2@citrix.com, Razvan Cojocaru <rcojocaru@bitdefender.com>, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
PgotLS0KIHhlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgICAgIHwgMiArLQogeGVuL2luY2x1
ZGUvYXNtLXg4Ni9tZW1fYWNjZXNzLmggfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVt
X2FjY2Vzcy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwppbmRleCAzMGMyZjFhLi41
NmMwNmE0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKQEAgLTU0MSw3ICs1NDEsNyBAQCB2b2lkIGFyY2hf
cDJtX3NldF9hY2Nlc3NfcmVxdWlyZWQoc3RydWN0IGRvbWFpbiAqZCwgYm9vbCBhY2Nlc3NfcmVx
dWlyZWQpCiAjZW5kaWYKIH0KIAotYm9vbCBwMm1fbWVtX2FjY2Vzc19zYW5pdHlfY2hlY2soc3Ry
dWN0IGRvbWFpbiAqZCkKK2Jvb2wgcDJtX21lbV9hY2Nlc3Nfc2FuaXR5X2NoZWNrKGNvbnN0IHN0
cnVjdCBkb21haW4gKmQpCiB7CiAgICAgcmV0dXJuIGlzX2h2bV9kb21haW4oZCkgJiYgY3B1X2hh
c192bXggJiYgaGFwX2VuYWJsZWQoZCk7CiB9CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
eDg2L21lbV9hY2Nlc3MuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX2FjY2Vzcy5oCmluZGV4
IGM4MTVkYjguLjk5ODE3YTMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX2Fj
Y2Vzcy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX2FjY2Vzcy5oCkBAIC00NCw3ICs0
NCw3IEBAIGJvb2wgcDJtX21lbV9hY2Nlc3NfZW11bGF0ZV9jaGVjayhzdHJ1Y3QgdmNwdSAqdiwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB2bV9ldmVudF9yZXNwb25z
ZV90ICpyc3ApOwogCiAvKiBTYW5pdHkgY2hlY2sgZm9yIG1lbV9hY2Nlc3MgaGFyZHdhcmUgc3Vw
cG9ydCAqLwotYm9vbCBwMm1fbWVtX2FjY2Vzc19zYW5pdHlfY2hlY2soc3RydWN0IGRvbWFpbiAq
ZCk7Citib29sIHAybV9tZW1fYWNjZXNzX3Nhbml0eV9jaGVjayhjb25zdCBzdHJ1Y3QgZG9tYWlu
ICpkKTsKIAogI2VuZGlmIC8qX19BU01fWDg2X01FTV9BQ0NFU1NfSF9fICovCiAKLS0gCjIuNy40
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
