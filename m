From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/mm: re-arrange get_page_from_l<N>e() vs
 pv_l1tf_check_l<N>e
Date: Wed, 29 Aug 2018 14:16:11 +0100
Message-ID: <e024ca2f-1941-ee19-3eac-833d760b233e@citrix.com>
References: <5B766E5702000078001DF307@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xzde=lm=citrix.com=prvs=772b5abf7=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fv0Ka-0006kb-Vg
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 13:16:21 +0000
In-Reply-To: <5B766E5702000078001DF307@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDgvMTggMDc6NDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFJlc3RvcmUgc3ltbWV0cnkg
YmV0d2VlbiBnZXRfcGFnZV9mcm9tX2w8Tj5lKCk6IHB2X2wxdGZfY2hlY2tfbDxOPmUgaXMKPiB1
bmlmb3JtbHkgaW52b2tlZCBmcm9tIG91dHNpZGUgb2YgdGhlbS4KCkknbSBub3Qgc3VyZSB3aGF0
IHN5bW1ldHJ5IHlvdSBhcmUgcmVmZXJyaW5nIHRvLgoKPiAgVGhleSdyZSBubyBsb25nZXIgZ2V0
dGluZyBjYWxsZWQKPiBmb3Igbm9uLXByZXNlbnQgUFRFcy4gVGhpcyB3YXkgdGhlIHNsaWdodGx5
IG9kZCB0aHJlZS13YXkgcmV0dXJuIHZhbHVlCj4gbWVhbmluZyBvZiB0aGUgaGlnaGVyIGxldmVs
IG9uZXMgY2FuIGFsc28gYmUgZ290IHJpZCBvZi4KPgo+IEludHJvZHVjZSBsb2NhbCB2YXJpYWJs
ZXMgaG9sZGluZyB0aGUgcGFnZSB0YWJsZSBlbnRyaWVzIHByb2Nlc3NlZCwgYW5kCj4gdXNlIHRo
ZW0gdGhyb3VnaG91dCB0aGUgbG9vcCBib2RpZXMgaW5zdGVhZCBvZiByZS1yZWFkaW5nIHRoZW0g
ZnJvbSB0aGUKPiBwYWdlIHRhYmxlIHNldmVyYWwgdGltZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpXaXRoIGF0IGxlYXN0IHRoZSBhYm92ZSBx
dWVyeSByZXNvbHZlZCwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIKPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+LCBidXQgYSBzdHlsZSByZWNvbW1lbmRhdGlvbi4KCj4gQEAgLTEzOTYsOCAr
MTM2OSw3IEBAIHN0YXRpYyBpbnQgYWxsb2NfbDFfdGFibGUoc3RydWN0IHBhZ2VfaW4KPiAgICAg
ICAgICAgICAgaWYgKCByZXQgKQo+ICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gICAgICAg
ICAgfQo+IC0KPiAtICAgICAgICBzd2l0Y2ggKCByZXQgPSBnZXRfcGFnZV9mcm9tX2wxZShwbDFl
W2ldLCBkLCBkKSApCj4gKyAgICAgICAgZWxzZSBzd2l0Y2ggKCByZXQgPSBnZXRfcGFnZV9mcm9t
X2wxZShwbDFlW2ldLCBkLCBkKSApCgplbHNlIHN3aXRjaCBpc24ndCBhIHVzdWFsIGNvbnN0cnVj
dCAoaGVyZSBhbmQgaW4gcHR3cl9lbXVsYXRlZF91cGRhdGUpLsKgCkkgd2FzIGV4cGVjdGluZyB0
aGUgbWlzbGVhZGluZyBpbmRlbnRhdGlvbiB3YXJuaW5nIHRvIHRyaWdnZXIsIGJ1dCBHQ0MKOC4y
IGRvZXMgYXBwZWFyIHRvIGJlIGhhcHB5LgoKU3RpbGwsIGZvciBjb2RlIGNsYXJpdHksIEknZCBz
dWdnZXN0IGFkZGluZyBicmFjZXMgdG8gdGhlIGFuZCBpbmRlbnRpbmcKdGhlIHN3aXRjaCBzdGF0
ZW1lbnQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
