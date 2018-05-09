From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 1/3] xen/pvh: enable and set default MTRR type
Date: Wed, 9 May 2018 11:21:27 +0100
Message-ID: <20180509102129.14832-2-roger.pau__20887.7245350324$1525861238$gmane$org@citrix.com>
References: <20180509102129.14832-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1nyl=h4=citrix.com=prvs=660b7377f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fGMEF-00058b-VC
 for xen-devel@lists.xenproject.org; Wed, 09 May 2018 10:21:48 +0000
In-Reply-To: <20180509102129.14832-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gUFZIIE1UUlIgaXMgbm90IGluaXRpYWxpemVkIGJ5IHRoZSBmaXJtd2FyZSAoYmVjYXVzZSB0
aGVyZSdzIG5vCmZpcm13YXJlKSwgc28gdGhlIGtlcm5lbCBpcyBzdGFydGVkIHdpdGggTVRSUiBk
aXNhYmxlZCB3aGljaCBtZWFucyBhbGwKbWVtb3J5IGFjY2Vzc2VzIGFyZSBVQy4KClNvIGZhciB0
aGVyZSBoYXZlIGJlZW4gbm8gaXNzdWVzIChpZTogc2xvd2Rvd25zKSBjYXVzZWQgYnkgdGhpcwpi
ZWNhdXNlIFBWSCBvbmx5IHN1cHBvcnRlZCBEb21VIG1vZGUgd2l0aG91dCBwYXNzZWQtdGhyb3Vn
aCBkZXZpY2VzLApzbyBYZW4gd2FzIHVzaW5nIFdCIGFzIHRoZSBkZWZhdWx0IG1lbW9yeSB0eXBl
IGluc3RlYWQgb2YgVUMuCgpGaXggdGhpcyBieSBlbmFibGluZyBNVFJSIGFuZCBzZXR0aW5nIHRo
ZSBkZWZhdWx0IHR5cGUgdG8gV0IuIExpbnV4CndpbGwgdXNlIFBBVCB0byBzZXQgdGhlIGFjdHVh
bCBtZW1vcnkgY2FjaGUgYXR0cmlidXRlcy4KClNpZ25lZC1vZmYtYnk6IEJvcmlzIE9zdHJvdnNr
eSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9y
aXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKLS0tCiBhcmNoL3g4Ni94ZW4v
ZW5saWdodGVuX3B2aC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2aC5jIGIvYXJjaC94ODYveGVu
L2VubGlnaHRlbl9wdmguYwppbmRleCBhYTFjNmE2ODMxYTkuLmUwMzlkMTgwOTgwOSAxMDA2NDQK
LS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdmguYworKysgYi9hcmNoL3g4Ni94ZW4vZW5s
aWdodGVuX3B2aC5jCkBAIC02LDYgKzYsNyBAQAogI2luY2x1ZGUgPGFzbS9pb19hcGljLmg+CiAj
aW5jbHVkZSA8YXNtL2h5cGVydmlzb3IuaD4KICNpbmNsdWRlIDxhc20vZTgyMC9hcGkuaD4KKyNp
bmNsdWRlIDxhc20vbXRyci5oPgogI2luY2x1ZGUgPGFzbS94ODZfaW5pdC5oPgogCiAjaW5jbHVk
ZSA8YXNtL3hlbi9pbnRlcmZhY2UuaD4KQEAgLTk4LDYgKzk5LDggQEAgdm9pZCBfX2luaXQgeGVu
X3ByZXBhcmVfcHZoKHZvaWQpCiAKIAl4ZW5fcHZoID0gMTsKIAorCXdybXNyX3NhZmUoTVNSX01U
UlJkZWZUeXBlLCAweDgwMCB8IE1UUlJfVFlQRV9XUkJBQ0ssIDApOworCiAJbXNyID0gY3B1aWRf
ZWJ4KHhlbl9jcHVpZF9iYXNlKCkgKyAyKTsKIAlwZm4gPSBfX3BhKGh5cGVyY2FsbF9wYWdlKTsK
IAl3cm1zcl9zYWZlKG1zciwgKHUzMilwZm4sICh1MzIpKHBmbiA+PiAzMikpOwotLSAKMi4xNy4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
