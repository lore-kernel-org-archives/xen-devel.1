From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH for-4.6] arm: constify atomic_read parameter
Date: Wed, 15 Aug 2018 09:30:09 +0100
Message-ID: <20180815083009.6436-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fjet=k6=citrix.com=prvs=75862455f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fprC1-0004vO-R8
 for xen-devel@lists.xenproject.org; Wed, 15 Aug 2018 08:30:13 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

N2Q5ODU5NGU2ZSBhZGRlZCBjb25zdCB0byBhdG9taWNfcmVhZC4gRG8gdGhlIHNhbWUgZm9yIEFy
bQpjb3VudGVycGFydC4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+Ci0tLQpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpD
YzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpCcmVha2FnZSBmcm9tIFhTQS0yNzMgY2hhbmdlcy4KLS0tCiB4ZW4vaW5jbHVkZS9h
c20tYXJtL2F0b21pYy5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9hdG9taWMuaCBi
L3hlbi9pbmNsdWRlL2FzbS1hcm0vYXRvbWljLmgKaW5kZXggNWEzOGM2N2ZiZC4uNzNjNTNlZmMy
YiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9hdG9taWMuaAorKysgYi94ZW4vaW5j
bHVkZS9hc20tYXJtL2F0b21pYy5oCkBAIC0xMTAsNyArMTEwLDcgQEAgdHlwZWRlZiBzdHJ1Y3Qg
eyBpbnQgY291bnRlcjsgfSBhdG9taWNfdDsKICAqIHN0cmV4L2xkcmV4IG1vbml0b3Igb24gc29t
ZSBpbXBsZW1lbnRhdGlvbnMuIFRoZSByZWFzb24gd2UgY2FuIHVzZSBpdCBmb3IKICAqIGF0b21p
Y19zZXQoKSBpcyB0aGUgY2xyZXggb3IgZHVtbXkgc3RyZXggZG9uZSBvbiBldmVyeSBleGNlcHRp
b24gcmV0dXJuLgogICovCi1zdGF0aWMgaW5saW5lIGludCBhdG9taWNfcmVhZChhdG9taWNfdCAq
dikKK3N0YXRpYyBpbmxpbmUgaW50IGF0b21pY19yZWFkKGNvbnN0IGF0b21pY190ICp2KQogewog
ICAgIHJldHVybiAqKHZvbGF0aWxlIGludCAqKSZ2LT5jb3VudGVyOwogfQotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
