From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH v2 03/14] x86/cpu/vpmu: Add Hygon Dhyana and AMD
 Zen support for vPMU
Date: Thu, 21 Feb 2019 17:50:54 +0800
Message-ID: <040f45bfbf35ade98027221680777cb96e561c65.1550647742.git.puwen@hygon.cn>
References: <cover.1550647742.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hIO5=Q4=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1gwl2H-0001VU-Tx
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 09:52:57 +0000
In-Reply-To: <cover.1550647742.git.puwen@hygon.cn>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Pu Wen <puwen@hygon.cn>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIFBNVSBhcmNoaXRlY3R1cmUgZm9yIHRoZSBIeWdvbiBEaHlhbmEgQ1BVIGlzIHNpbWlsYXIg
dG8gdGhlIEFNRApmYW1pbHkgMTdoIG9uZS4gU28gYWRkIEh5Z29uIERoeWFuYSBzdXBwb3J0IGlu
IHZwbXVfYXJjaF9pbml0aWFsaXNlCmFuZCB2cG11X2luaXQgYnkgdXNpbmcgdGhlIGNvZGUgcGF0
aCBvZiBBTUQuCgpTaW5jZSBjdXJyZW50IFhlbiB2UE1VIHN0aWxsIG5vdCBzdXBwb3J0IFplbigw
eDE3KSwgc28gYWRkIGJvdGggMHgxNwphbmQgMHgxOCBzdXBwb3J0IGJ5IHVzaW5nIHRoZSAweDE1
J3MgY2FzZSBpbiBhbWRfdnBtdV9pbml0LCBmb3IgMHgxNwphbmQgMHgxOCBoYXZlIHRoZSBzYW1l
IHBlcmZvcm1hbmNlIGV2ZW50IHNlbGVjdCBhbmQgY291bnRlciBNU1JzIGFzCjB4MTUgaGFzLgoK
U2lnbmVkLW9mZi1ieTogUHUgV2VuIDxwdXdlbkBoeWdvbi5jbj4KLS0tCiB4ZW4vYXJjaC94ODYv
Y3B1L3ZwbXUuYyAgICAgfCAyICsrCiB4ZW4vYXJjaC94ODYvY3B1L3ZwbXVfYW1kLmMgfCAyICsr
CiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9jcHUvdnBtdS5jIGIveGVuL2FyY2gveDg2L2NwdS92cG11LmMKaW5kZXggMTNkYTdkMC4u
ZjY3OWU3OSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2NwdS92cG11LmMKKysrIGIveGVuL2Fy
Y2gveDg2L2NwdS92cG11LmMKQEAgLTQ1OSw2ICs0NTksNyBAQCBzdGF0aWMgaW50IHZwbXVfYXJj
aF9pbml0aWFsaXNlKHN0cnVjdCB2Y3B1ICp2KQogICAgIHN3aXRjaCAoIHZlbmRvciApCiAgICAg
ewogICAgIGNhc2UgWDg2X1ZFTkRPUl9BTUQ6CisgICAgY2FzZSBYODZfVkVORE9SX0hZR09OOgog
ICAgICAgICByZXQgPSBzdm1fdnBtdV9pbml0aWFsaXNlKHYpOwogICAgICAgICBicmVhazsKIApA
QCAtODc2LDYgKzg3Nyw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHZwbXVfaW5pdCh2b2lkKQogICAg
IHN3aXRjaCAoIHZlbmRvciApCiAgICAgewogICAgIGNhc2UgWDg2X1ZFTkRPUl9BTUQ6CisgICAg
Y2FzZSBYODZfVkVORE9SX0hZR09OOgogICAgICAgICBpZiAoIGFtZF92cG11X2luaXQoKSApCiAg
ICAgICAgICAgIHZwbXVfbW9kZSA9IFhFTlBNVV9NT0RFX09GRjsKICAgICAgICAgYnJlYWs7CmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfYW1kLmMgYi94ZW4vYXJjaC94ODYvY3B1
L3ZwbXVfYW1kLmMKaW5kZXggNWVmYzM5Yi4uYzlhYmU2ZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2NwdS92cG11X2FtZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdV9hbWQuYwpAQCAt
NTQ1LDYgKzU0NSw4IEBAIGludCBfX2luaXQgYW1kX3ZwbXVfaW5pdCh2b2lkKQogICAgIHN3aXRj
aCAoIGN1cnJlbnRfY3B1X2RhdGEueDg2ICkKICAgICB7CiAgICAgY2FzZSAweDE1OgorICAgIGNh
c2UgMHgxNzoKKyAgICBjYXNlIDB4MTg6CiAgICAgICAgIG51bV9jb3VudGVycyA9IEYxNUhfTlVN
X0NPVU5URVJTOwogICAgICAgICBjb3VudGVycyA9IEFNRF9GMTVIX0NPVU5URVJTOwogICAgICAg
ICBjdHJscyA9IEFNRF9GMTVIX0NUUkxTOwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
