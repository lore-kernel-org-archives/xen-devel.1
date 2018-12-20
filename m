From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH 03/15] x86/cpu/vpmu: Add Hygon Dhyana support
 for vPMU
Date: Thu, 20 Dec 2018 21:12:07 +0800
Message-ID: <717bb961700ecc2ebb9d3c424f2f0fea3bb71d00.1545284932.git.puwen@hygon.cn>
References: <cover.1545284932.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VrHp=O5=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1gZy92-0001oY-FA
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 13:13:44 +0000
In-Reply-To: <cover.1545284932.git.puwen@hygon.cn>
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
dG8gdGhlIEFNRApmYW1pbHkgMTdoIG9uZS4gVG8gc3VwcG9ydCBpdCwgYWRkIEh5Z29uIERoeWFu
YSBzdXBwb3J0IGluIHRoZSBzaW1pbGFyCndheSBhcyBBTUQgZG9lcy4KClNpZ25lZC1vZmYtYnk6
IFB1IFdlbiA8cHV3ZW5AaHlnb24uY24+Ci0tLQogeGVuL2FyY2gveDg2L2NwdS92cG11LmMgICAg
IHwgMiArKwogeGVuL2FyY2gveDg2L2NwdS92cG11X2FtZC5jIHwgMiArKwogMiBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L3ZwbXUu
YyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdS5jCmluZGV4IDhhNGY3NTMuLmFmZDM2MDcgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBt
dS5jCkBAIC00NzMsNiArNDczLDcgQEAgc3RhdGljIGludCB2cG11X2FyY2hfaW5pdGlhbGlzZShz
dHJ1Y3QgdmNwdSAqdikKIAogICAgIHN3aXRjaCAoIHZlbmRvciApCiAgICAgeworICAgIGNhc2Ug
WDg2X1ZFTkRPUl9IWUdPTjoKICAgICBjYXNlIFg4Nl9WRU5ET1JfQU1EOgogICAgICAgICByZXQg
PSBzdm1fdnBtdV9pbml0aWFsaXNlKHYpOwogICAgICAgICBicmVhazsKQEAgLTg5MCw2ICs4OTEs
NyBAQCBzdGF0aWMgaW50IF9faW5pdCB2cG11X2luaXQodm9pZCkKIAogICAgIHN3aXRjaCAoIHZl
bmRvciApCiAgICAgeworICAgIGNhc2UgWDg2X1ZFTkRPUl9IWUdPTjoKICAgICBjYXNlIFg4Nl9W
RU5ET1JfQU1EOgogICAgICAgICBpZiAoIGFtZF92cG11X2luaXQoKSApCiAgICAgICAgICAgIHZw
bXVfbW9kZSA9IFhFTlBNVV9NT0RFX09GRjsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUv
dnBtdV9hbWQuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdV9hbWQuYwppbmRleCA1ZWZjMzliLi5l
OWYwYTVjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfYW1kLmMKKysrIGIveGVu
L2FyY2gveDg2L2NwdS92cG11X2FtZC5jCkBAIC01NTQsNiArNTU0LDggQEAgaW50IF9faW5pdCBh
bWRfdnBtdV9pbml0KHZvaWQpCiAgICAgY2FzZSAweDEyOgogICAgIGNhc2UgMHgxNDoKICAgICBj
YXNlIDB4MTY6CisgICAgY2FzZSAweDE3OgorICAgIGNhc2UgMHgxODoKICAgICAgICAgbnVtX2Nv
dW50ZXJzID0gRjEwSF9OVU1fQ09VTlRFUlM7CiAgICAgICAgIGNvdW50ZXJzID0gQU1EX0YxMEhf
Q09VTlRFUlM7CiAgICAgICAgIGN0cmxzID0gQU1EX0YxMEhfQ1RSTFM7Ci0tIAoyLjcuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
