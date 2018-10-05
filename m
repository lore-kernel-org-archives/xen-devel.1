From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] pass-through: provide two !HVM stubs
Date: Fri, 05 Oct 2018 05:11:55 -0600
Message-ID: <5BB746FB02000078001EEC6E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vier=mr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g8O1V-0005C6-VN
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 11:11:57 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T2xkZXIgZ2NjLCBkZXNwaXRlIGVsaW1pbmF0aW5nIHBjaV9jbGVhbl9kcGNpX2lycXMoKSB3aGVu
ICFIVk0sIGRvZXMKbm90IG1hbmFnZSB0byBhbHNvIGVsaW1pbmF0ZSBwY2lfY2xlYW5fZHBjaV9p
cnEoKS4gQ29wZSB3aXRoIHRoaXMuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pcnEuaAorKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pcnEuaApAQCAtMTgwLDcgKzE4MCwxNSBAQCBpbnQgcHRf
cGlycV9pdGVyYXRlKHN0cnVjdCBkb21haW4gKmQsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgaHZtX3BpcnFfZHBjaSAqLCB2b2lkICphcmcpLAogICAgICAgICAgICAgICAg
ICAgICB2b2lkICphcmcpOwogCisjaWZkZWYgQ09ORklHX0hWTQogYm9vbCBwdF9waXJxX3NvZnRp
cnFfYWN0aXZlKHN0cnVjdCBodm1fcGlycV9kcGNpICopOworI2Vsc2UKK3N0YXRpYyBpbmxpbmUg
Ym9vbCBwdF9waXJxX3NvZnRpcnFfYWN0aXZlKHN0cnVjdCBodm1fcGlycV9kcGNpICpkcGNpKQor
eworICAgIHJldHVybiBmYWxzZTsKK30KKyNlbmRpZgorCiAvKiBNb2RpZnkgc3RhdGUgb2YgYSBQ
Q0kgSU5UeCB3aXJlLiAqLwogdm9pZCBodm1fcGNpX2ludHhfYXNzZXJ0KHN0cnVjdCBkb21haW4g
KmQsIHVuc2lnbmVkIGludCBkZXZpY2UsCiAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IGludHgpOwotLS0gYS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaAorKysgYi94ZW4vaW5j
bHVkZS94ZW4vaW9tbXUuaApAQCAtMTA0LDcgKzEwNCwxMSBAQCBpbnQgcHRfaXJxX2Rlc3Ryb3lf
YmluZChzdHJ1Y3QgZG9tYWluICosCiB2b2lkIGh2bV9kcGNpX2lzYWlycV9lb2koc3RydWN0IGRv
bWFpbiAqZCwgdW5zaWduZWQgaW50IGlzYWlycSk7CiBzdHJ1Y3QgaHZtX2lycV9kcGNpICpkb21h
aW5fZ2V0X2lycV9kcGNpKGNvbnN0IHN0cnVjdCBkb21haW4gKik7CiB2b2lkIGZyZWVfaHZtX2ly
cV9kcGNpKHN0cnVjdCBodm1faXJxX2RwY2kgKmRwY2kpOwotYm9vbF90IHB0X2lycV9uZWVkX3Rp
bWVyKHVpbnQzMl90IGZsYWdzKTsKKyNpZmRlZiBDT05GSUdfSFZNCitib29sIHB0X2lycV9uZWVk
X3RpbWVyKHVpbnQzMl90IGZsYWdzKTsKKyNlbHNlCitzdGF0aWMgaW5saW5lIGJvb2wgcHRfaXJx
X25lZWRfdGltZXIodW5zaWduZWQgaW50IGZsYWdzKSB7IHJldHVybiBmYWxzZTsgfQorI2VuZGlm
CiAKIHN0cnVjdCBtc2lfZGVzYzsKIHN0cnVjdCBtc2lfbXNnOwoKCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
