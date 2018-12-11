From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2] x86emul: fix vector-length check for AVX512F
 scalar fused-multiply-add insns
Date: Tue, 11 Dec 2018 01:48:37 -0700
Message-ID: <5C0F79E50200007800204F55@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gWdid-0002Kn-7n
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 08:48:43 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGNoZWNrIG5lZWRzIHRvIGhhcHBlbiB3aGVuZXZlciBFVkVYLmIgKFNETSBub21lbmNsYXR1
cmUpIGlzIGNsZWFyLApub3QganVzdCBpbiB0aGUgbWVtb3J5IG9wZXJhbmQgY2FzZS4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYyOiBDbGFyaWZ5
IG5hbWluZyAodG8gYWRkcmVzcyBhcHBhcmVudCBkaXNjb25uZWN0IGJldHdlZW4gZGVzY3JpcHRp
b24KICAgIGFuZCBjb2RlIGNoYW5nZSkuCgotLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUv
eDg2X2VtdWxhdGUuYworKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUu
YwpAQCAtODUyNiwxMSArODUyNiw5IEBAIHg4Nl9lbXVsYXRlKAogICAgIGNhc2UgWDg2RU1VTF9P
UENfRVZFWF82NigweDBmMzgsIDB4YmQpOiAvKiB2Zm5tYWRkMjMxc3tzLGR9IHhtbS9tZW0seG1t
LHhtbXtrfSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmMzgsIDB4YmYpOiAv
KiB2Zm5tc3ViMjMxc3tzLGR9IHhtbS9tZW0seG1tLHhtbXtrfSAqLwogICAgICAgICBob3N0X2Fu
ZF92Y3B1X211c3RfaGF2ZShhdng1MTJmKTsKLSAgICAgICAgaWYgKCBlYS50eXBlID09IE9QX01F
TSApCi0gICAgICAgIHsKLSAgICAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZihldmV4LmJy
LCBFWENfVUQpOworICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoZWEudHlwZSAhPSBPUF9S
RUcgJiYgZXZleC5iciwgRVhDX1VEKTsKKyAgICAgICAgaWYgKCAhZXZleC5iciApCiAgICAgICAg
ICAgICBhdng1MTJfdmxlbl9jaGVjayh0cnVlKTsKLSAgICAgICAgfQogICAgICAgICBnb3RvIHNp
bWRfem1tOwogCiAgICAgY2FzZSBYODZFTVVMX09QQygweDBmMzgsIDB4YzgpOiAgICAgLyogc2hh
MW5leHRlIHhtbS9tMTI4LHhtbSAqLwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
