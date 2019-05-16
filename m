From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] libxl: fix regression introduced in 5c883cf036cf
Date: Thu, 16 May 2019 10:11:53 +0100
Message-ID: <20190516091153.31502-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRCQo-0006La-DE
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 09:12:06 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VHdvIGxpbmVzIHdlcmUgZXJyb25lb3VzbHkgZGVsZXRlZCBkdXJpbmcgcmViYXNlIHdoaWNoIGNh
dXNlZCBkb21haW4KZGVzdHJ1Y3Rpb24gdG8gZmFpbC4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpTb3JyeSBteSB1c3VhbCB0ZXN0IHNjcmlwdCBmYWls
ZWQgdG8gY2F0Y2ggdGhpcy4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kZXZpY2UuYyB8IDUgKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9s
aWJ4bC9saWJ4bF9kZXZpY2UuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RldmljZS5jCmluZGV4IGY4
MzQwYmE4MTUuLmRiNmMwMjAzYjcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2Rldmlj
ZS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RldmljZS5jCkBAIC03MzQsNiArNzM0LDExIEBA
IGludCBsaWJ4bF9fZGV2aWNlX2Rlc3Ryb3kobGlieGxfX2djICpnYywgbGlieGxfX2RldmljZSAq
ZGV2KQogICAgIHVpbnQzMl90IGRvbWlkOwogICAgIGludCBsaWJ4bF9vbmx5ID0gZGV2LT5iYWNr
ZW5kX2tpbmQgPT0gTElCWExfX0RFVklDRV9LSU5EX05PTkU7CiAKKyAgICBpZiAoIWxpYnhsX29u
bHkpIHsKKyAgICAgICAgYmVfcGF0aCA9IGxpYnhsX19kZXZpY2VfYmFja2VuZF9wYXRoKGdjLCBk
ZXYpOworICAgICAgICBmZV9wYXRoID0gbGlieGxfX2RldmljZV9mcm9udGVuZF9wYXRoKGdjLCBk
ZXYpOworICAgIH0KKwogICAgIHJjID0gbGlieGxfX2dldF9kb21pZChnYywgJmRvbWlkKTsKICAg
ICBpZiAocmMpIGdvdG8gb3V0OwogCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
