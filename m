From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 04/13] libx86: introduce a libx86 shared
 library
Date: Wed, 4 Jul 2018 16:48:52 +0100
Message-ID: <747953e8-26f3-150d-9955-44989bdcd7cc@citrix.com>
References: <1530651326-5320-1-git-send-email-andrew.cooper3@citrix.com>
 <1530651326-5320-5-git-send-email-andrew.cooper3@citrix.com>
 <5B3C886402000078001D0E40@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B3C886402000078001D0E40@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDcvMTggMDk6NDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Cj4+IC0tLSAvZGV2L251bGwK
Pj4gKysrIGIveGVuL2NvbW1vbi9saWJ4ODYvbGlieDg2LXByaXZhdGUuaAo+PiBAQCAtMCwwICsx
LDQyIEBACj4+ICsjaWZuZGVmIFhFTl9MSUJYODZfUFJJVkFURV9ICj4+ICsjZGVmaW5lIFhFTl9M
SUJYODZfUFJJVkFURV9ICj4+ICsKPj4gKyNpZmRlZiBfX1hFTl9fCj4+ICsKPj4gKyNpbmNsdWRl
IDx4ZW4vYml0b3BzLmg+Cj4+ICsjaW5jbHVkZSA8eGVuL2tlcm5lbC5oPgo+PiArI2luY2x1ZGUg
PHhlbi9saWIuaD4KPj4gKyNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KPj4gKwo+PiArI2Vsc2UKPj4g
Kwo+PiArI2luY2x1ZGUgPGludHR5cGVzLmg+Cj4+ICsjaW5jbHVkZSA8c3RkYm9vbC5oPgo+PiAr
I2luY2x1ZGUgPHN0ZGRlZi5oPgo+PiArCj4+ICsjaW5jbHVkZSA8eGVuLXRvb2xzL2xpYnMuaD4K
Pj4gKwo+PiArI2RlZmluZSBNQVgoeCwgeSkgKCh4KSA+ICh5KSA/ICh4KSA6ICh5KSkKPj4gKwo+
PiArI2RlZmluZSBBUlJBWV9TSVpFKHgpIChzaXplb2YgeCAvIHNpemVvZiAqeCkKPj4gKwo+PiAr
c3RhdGljIGlubGluZSBib29sIHRlc3RfYml0KHVuc2lnbmVkIGludCBiaXQsIGNvbnN0IHZvaWQg
KnZhZGRyKQo+PiArewo+PiArICAgIGNvbnN0IGNoYXIgKmFkZHIgPSB2YWRkcjsKPj4gKwo+PiAr
ICAgIHJldHVybiBhZGRyW2JpdCAvIDhdICYgKDF1IDw8IChiaXQgJSA4KSk7Cj4+ICt9Cj4+ICsK
Pj4gKyNlbmRpZiAvKiBfX1hFTl9fICovCj4+ICsKPj4gKyNlbmRpZiAvKiBYRU5fTElCWDg2X1BS
SVZBVEVfSCAqLwo+IERpZCB5b3UgY29uc2lkZXIgbWFraW5nIHRoaXMgeDg2LWluZGVwZW5kZW50
IGJ1dCBzdGlsbCBzaGFyZWQ/Cj4gTm9uZSBvZiB0aGUgYWJvdmUgaXMgeDg2LXNwZWNpZmljLiBs
aWJlbGYgY291bGQgdGhlbiBwb3NzaWJseSB1c2UKPiB0aGlzIHRvbywgZm9yIGV4YW1wbGVkLgo+
Cj4gQWxzbyBJIHRoaW5rIHdlIHByZXR0eSBjb25zaXN0ZW50bHkgdXNlIHNpemVvZih4KSwgbm90
IHNpemVvZiB4LCBzbwo+IEknZCBsaWtlIHRvIGFzayB0aGF0IEFSUkFZX1NJWkUoKSBiZSBhZGp1
c3RlZCBhY2NvcmRpbmdseS4KCkluIHJlc3BvbnNlIHRvIHNldmVyYWwgcXVlc3Rpb25zIGFjcm9z
cyB0aGUgc2VyaWVzLCBhbGwgb2YgdGhlIGNvbW1vbgptYWNyb3Mgbm93IGxpdmUgaW4gPHhlbi10
b29scy9saWJzLmg+IGFsb25nc2lkZSB0aGUgYWxyZWFkeS1jb21tb24KQlVJTERfQlVHX09OKCkg
aW1wbGVtZW50YXRpb24uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
