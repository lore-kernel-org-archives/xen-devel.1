From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 2/7] x86/xpti: don't flush TLB twice when
 switching to 64-bit pv context
Date: Wed, 21 Mar 2018 13:51:24 +0100
Message-ID: <20180321125129.28539-3-jgross@suse.com>
References: <20180321125129.28539-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=n5/p=gl=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eydDN-0005Sn-59
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 12:51:37 +0000
In-Reply-To: <20180321125129.28539-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, andrew.cooper3@citrix.com, jbeulich@suse.com, dfaggioli@suse.com
List-Id: xen-devel@lists.xenproject.org

V2hlbiBzd2l0Y2hpbmcgdG8gYSA2NC1iaXQgcHYgY29udGV4dCB0aGUgVExCIGlzIGZsdXNoZWQg
dHdpY2UgdG9kYXk6CnRoZSBmaXJzdCB0aW1lIHdoZW4gc3dpdGNoaW5nIHRvIHRoZSBuZXcgYWRk
cmVzcyBzcGFjZSBpbgp3cml0ZV9wdGJhc2UoKSwgdGhlIHNlY29uZCB0aW1lIHdoZW4gc3dpdGNo
aW5nIHRvIGd1ZXN0IG1vZGUgaW4KcmVzdG9yZV90b19ndWVzdC4KCkF2b2lkIHRoZSBmaXJzdCBU
TEIgZmx1c2ggaW4gdGhhdCBjYXNlLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgotLS0KVjM6Ci0gb21pdCBzZXR0aW5nIHJvb3RfcGd0X2NoYW5nZWQgdG8g
ZmFsc2UgKEphbiBCZXVsaWNoKQotLS0KIHhlbi9hcmNoL3g4Ni9tbS5jIHwgOSArKysrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IDM1MjYwMGFk
NzMuLjhjOTQ0YjMzYzkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9tbS5jCkBAIC0xMjMsNiArMTIzLDcgQEAKICNpbmNsdWRlIDxhc20vaW9fYXBpYy5o
PgogI2luY2x1ZGUgPGFzbS9wY2kuaD4KICNpbmNsdWRlIDxhc20vZ3Vlc3QuaD4KKyNpbmNsdWRl
IDxhc20vcHJvY2Vzc29yLmg+CiAKICNpbmNsdWRlIDxhc20vaHZtL2dyYW50X3RhYmxlLmg+CiAj
aW5jbHVkZSA8YXNtL3B2L2dyYW50X3RhYmxlLmg+CkBAIC01MDcsOCArNTA4LDE0IEBAIHZvaWQg
bWFrZV9jcjMoc3RydWN0IHZjcHUgKnYsIG1mbl90IG1mbikKIHZvaWQgd3JpdGVfcHRiYXNlKHN0
cnVjdCB2Y3B1ICp2KQogewogICAgIGlmICggdGhpc19jcHUocm9vdF9wZ3QpICYmIGlzX3B2X3Zj
cHUodikgJiYgIWlzX3B2XzMyYml0X3ZjcHUodikgKQorICAgIHsKICAgICAgICAgZ2V0X2NwdV9p
bmZvKCktPnJvb3RfcGd0X2NoYW5nZWQgPSB0cnVlOwotICAgIHdyaXRlX2NyMyh2LT5hcmNoLmNy
Myk7CisgICAgICAgIGFzbSB2b2xhdGlsZSAoICJtb3YgJTAsICUlY3IzIiA6IDogInIiICh2LT5h
cmNoLmNyMykgOiAibWVtb3J5IiApOworICAgIH0KKyAgICBlbHNlCisgICAgeworICAgICAgICB3
cml0ZV9jcjModi0+YXJjaC5jcjMpOworICAgIH0KIH0KIAogLyoKLS0gCjIuMTMuNgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
