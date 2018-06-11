From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH v2 1/8] libxc: Drop declarations of
 osdep_privcmd_open and _close
Date: Mon, 11 Jun 2018 15:13:17 +0100
Message-ID: <1528726404-14924-2-git-send-email-ian.jackson@eu.citrix.com>
References: <1528726404-14924-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m2ge=i5=citrix.com=prvs=6937e3dae=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fSNZh-0000lV-P5
 for xen-devel@lists.xenproject.org; Mon, 11 Jun 2018 14:13:37 +0000
In-Reply-To: <1528726404-14924-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlc2UgZnVuY3Rpb25zIGFyZSBubyBsb25nZXIgZGVmaW5lZCBvciB1c2VkIGFueXdoZXJlLiAg
VGhlCmRlY2xhcmF0aW9ucyBzaG91bGQgaGF2ZSBiZWVuIGRlbGV0ZWQgd2hlbiB0aGUgZGVmaW5p
dGlvbnMgd2VyZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5j
aXRyaXguY29tPgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KUmV2aWV3
ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHRvb2xz
L2xpYnhjL3hjX3ByaXZhdGUuaCB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19wcml2YXRlLmggYi90b29scy9saWJ4Yy94
Y19wcml2YXRlLmgKaW5kZXggMDNiYzlhNy4uMjViYWU4YSAxMDA2NDQKLS0tIGEvdG9vbHMvbGli
eGMveGNfcHJpdmF0ZS5oCisrKyBiL3Rvb2xzL2xpYnhjL3hjX3ByaXZhdGUuaApAQCAtMTAzLDkg
KzEwMyw2IEBAIHN0cnVjdCB4Y19pbnRlcmZhY2VfY29yZSB7CiAgICAgeGVuZGV2aWNlbW9kZWxf
aGFuZGxlICpkbW9kOwogfTsKIAotaW50IG9zZGVwX3ByaXZjbWRfb3Blbih4Y19pbnRlcmZhY2Ug
KnhjaCk7Ci1pbnQgb3NkZXBfcHJpdmNtZF9jbG9zZSh4Y19pbnRlcmZhY2UgKnhjaCk7Ci0KIHZv
aWQgKm9zZGVwX2FsbG9jX2h5cGVyY2FsbF9idWZmZXIoeGNfaW50ZXJmYWNlICp4Y2gsIGludCBu
cGFnZXMpOwogdm9pZCBvc2RlcF9mcmVlX2h5cGVyY2FsbF9idWZmZXIoeGNfaW50ZXJmYWNlICp4
Y2gsIHZvaWQgKnB0ciwgaW50IG5wYWdlcyk7CiAKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
