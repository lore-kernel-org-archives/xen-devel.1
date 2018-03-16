From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86: correct EFLAGS.IF in SYSENTER frame
Date: Fri, 16 Mar 2018 08:13:35 -0600
Message-ID: <5AABDF1F02000078001B2D98@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=krzt=gg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewq74-0007p6-Bg
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 14:13:42 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDlkMWQzMWFkOTQgKCJ4ODY6IHNsaWdodGx5IHJlZHVjZSBNZWx0ZG93biBiYW5kLWFp
ZCBvdmVyaGVhZCIpCm1vdmVkIHRoZSBTVEkgcGFzdCB0aGUgUFVTSEYuIFdoaWxlIHRoaXMgaXNu
J3QgYW4gYWN0aXZlIHByb2JsZW0gKGFzIHdlCmZvcmNlIEVGTEFHUy5JRiB0byAxIGJlZm9yZSBl
eGl0aW5nIHRvIGd1ZXN0IGNvbnRleHQpLCBsZXQncyBub3QgcmlzawppbnRlcm5hbCBjb25mdXNp
b24gYnkgZmluZGluZyBhIFBWIGd1ZXN0IGZyYW1lIHdpdGggaW50ZXJydXB0cwphcHBhcmVudGx5
IG9mZi4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0t
LSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvZW50cnkuUworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0
L2VudHJ5LlMKQEAgLTI4MSw2ICsyODEsOCBAQCBHTE9CQUwoc3lzZW50ZXJfZWZsYWdzX3NhdmVk
KQogICAgICAgICAvKiBXQVJOSU5HISBgcmV0YCwgYGNhbGwgKmAsIGBqbXAgKmAgbm90IHNhZmUg
YmVmb3JlIHRoaXMgcG9pbnQuICovCiAKICAgICAgICAgR0VUX1NUQUNLX0VORChieCkKKyAgICAg
ICAgLyogUFVTSEYgYWJvdmUgaGFzIHNhdmVkIEVGTEFHUy5JRiBjbGVhciAodGhlIGNhbGxlciBo
YWQgaXQgc2V0KS4gKi8KKyAgICAgICAgb3JsICAgJFg4Nl9FRkxBR1NfSUYsIFVSRUdTX2VmbGFn
cyglcnNwKQogICAgICAgICBtb3YgICBTVEFDS19DUFVJTkZPX0ZJRUxEKHhlbl9jcjMpKCVyYngp
LCAlcmN4CiAgICAgICAgIG5lZyAgICVyY3gKICAgICAgICAganogICAgLkxzeXNlX2NyM19va2F5
CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
