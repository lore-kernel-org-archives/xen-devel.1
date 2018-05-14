From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 1/4] libxc: Drop declarations of
 osdep_privcmd_open and _close
Date: Mon, 14 May 2018 18:08:56 +0100
Message-ID: <1526317739-17572-2-git-send-email-ian.jackson@eu.citrix.com>
References: <1526317739-17572-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bdup=ib=citrix.com=prvs=665fc3fee=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fIGyE-0002jf-OA
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 17:09:10 +0000
In-Reply-To: <1526317739-17572-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlc2UgZnVuY3Rpb25zIGFyZSBubyBsb25nZXIgZGVmaW5lZCBvciB1c2VkIGFueXdoZXJlLiAg
VGhlCmRlY2xhcmF0aW9ucyBzaG91bGQgaGF2ZSBiZWVuIGRlbGV0ZWQgd2hlbiB0aGUgZGVmaW5p
dGlvbnMgd2VyZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5j
aXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhjL3hjX3ByaXZhdGUuaCB8IDMgLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19wcml2
YXRlLmggYi90b29scy9saWJ4Yy94Y19wcml2YXRlLmgKaW5kZXggMDNiYzlhNy4uMjViYWU4YSAx
MDA2NDQKLS0tIGEvdG9vbHMvbGlieGMveGNfcHJpdmF0ZS5oCisrKyBiL3Rvb2xzL2xpYnhjL3hj
X3ByaXZhdGUuaApAQCAtMTAzLDkgKzEwMyw2IEBAIHN0cnVjdCB4Y19pbnRlcmZhY2VfY29yZSB7
CiAgICAgeGVuZGV2aWNlbW9kZWxfaGFuZGxlICpkbW9kOwogfTsKIAotaW50IG9zZGVwX3ByaXZj
bWRfb3Blbih4Y19pbnRlcmZhY2UgKnhjaCk7Ci1pbnQgb3NkZXBfcHJpdmNtZF9jbG9zZSh4Y19p
bnRlcmZhY2UgKnhjaCk7Ci0KIHZvaWQgKm9zZGVwX2FsbG9jX2h5cGVyY2FsbF9idWZmZXIoeGNf
aW50ZXJmYWNlICp4Y2gsIGludCBucGFnZXMpOwogdm9pZCBvc2RlcF9mcmVlX2h5cGVyY2FsbF9i
dWZmZXIoeGNfaW50ZXJmYWNlICp4Y2gsIHZvaWQgKnB0ciwgaW50IG5wYWdlcyk7CiAKLS0gCjIu
MS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
