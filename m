From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 2/7] x86/xpti: don't flush TLB twice when
 switching to 64-bit pv context
Date: Tue, 27 Mar 2018 11:06:59 +0200
Message-ID: <20180327090704.28646-3-jgross@suse.com>
References: <20180327090704.28646-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=p5gr=gr=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f0kZV-0005Rm-FH
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 09:07:13 +0000
In-Reply-To: <20180327090704.28646-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, andrew.cooper3@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

V2hlbiBzd2l0Y2hpbmcgdG8gYSA2NC1iaXQgcHYgY29udGV4dCB0aGUgVExCIGlzIGZsdXNoZWQg
dHdpY2UgdG9kYXk6CnRoZSBmaXJzdCB0aW1lIHdoZW4gc3dpdGNoaW5nIHRvIHRoZSBuZXcgYWRk
cmVzcyBzcGFjZSBpbgp3cml0ZV9wdGJhc2UoKSwgdGhlIHNlY29uZCB0aW1lIHdoZW4gc3dpdGNo
aW5nIHRvIGd1ZXN0IG1vZGUgaW4KcmVzdG9yZV90b19ndWVzdC4KCkF2b2lkIHRoZSBmaXJzdCBU
TEIgZmx1c2ggaW4gdGhhdCBjYXNlLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgotLS0KVjM6Ci0gb21pdCBzZXR0aW5nIHJvb3RfcGd0X2NoYW5nZWQgdG8g
ZmFsc2UgKEphbiBCZXVsaWNoKQotLS0KIHhlbi9hcmNoL3g4Ni9tbS5jIHwgOSArKysrKysrLS0K
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwppbmRleCBiMWQzZjBl
ZGE4Li5mN2QyNGExZjhiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4v
YXJjaC94ODYvbW0uYwpAQCAtMTIzLDYgKzEyMyw3IEBACiAjaW5jbHVkZSA8YXNtL2lvX2FwaWMu
aD4KICNpbmNsdWRlIDxhc20vcGNpLmg+CiAjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+CisjaW5jbHVk
ZSA8YXNtL3Byb2Nlc3Nvci5oPgogCiAjaW5jbHVkZSA8YXNtL2h2bS9ncmFudF90YWJsZS5oPgog
I2luY2x1ZGUgPGFzbS9wdi9ncmFudF90YWJsZS5oPgpAQCAtNTAzLDkgKzUwNCwxMyBAQCB2b2lk
IG1ha2VfY3IzKHN0cnVjdCB2Y3B1ICp2LCBtZm5fdCBtZm4pCiAKIHZvaWQgd3JpdGVfcHRiYXNl
KHN0cnVjdCB2Y3B1ICp2KQogewotICAgIGlmICggdGhpc19jcHUocm9vdF9wZ3QpICkKKyAgICBp
ZiAoIHRoaXNfY3B1KHJvb3RfcGd0KSAmJiBpc19wdl92Y3B1KHYpICYmICFpc19wdl8zMmJpdF92
Y3B1KHYpICkKKyAgICB7CiAgICAgICAgIGdldF9jcHVfaW5mbygpLT5yb290X3BndF9jaGFuZ2Vk
ID0gdHJ1ZTsKLSAgICB3cml0ZV9jcjModi0+YXJjaC5jcjMpOworICAgICAgICBhc20gdm9sYXRp
bGUgKCAibW92ICUwLCAlJWNyMyIgOiA6ICJyIiAodi0+YXJjaC5jcjMpIDogIm1lbW9yeSIgKTsK
KyAgICB9CisgICAgZWxzZQorICAgICAgICB3cml0ZV9jcjModi0+YXJjaC5jcjMpOwogfQogCiAv
KgotLSAKMi4xMy42CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
