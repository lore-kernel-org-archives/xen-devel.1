From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/2] x86: report if PCID and INVPCID are
	supported
Date: Mon, 5 Mar 2018 13:26:46 +0000
Message-ID: <20180305132646.762q3l55322xvi4g@citrix.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-2-wei.liu2@citrix.com>
 <5A9D362002000078001AE74F@suse.com>
 <fdc238ab-ad02-69a0-0e3a-3c2e643a40e7@suse.com>
 <5A9D482202000078001AE7ED@suse.com>
 <77e443bf-64a4-fa3b-ff24-3000ca0579c3@suse.com>
 <5A9D4CDC02000078001AE820@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yt/y=f3=citrix.com=prvs=595ca3bc4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1esq8l-0008F3-II
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 13:26:55 +0000
Content-Disposition: inline
In-Reply-To: <5A9D4CDC02000078001AE820@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMDUsIDIwMTggYXQgMDU6NTc6NDhBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA1LjAzLjE4IGF0IDEzOjQ5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToK
PiA+IE9uIDA1LzAzLzE4IDEzOjM3LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4+PiBPbiAwNS4w
My4xOCBhdCAxMjo0MywgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4gPj4+IE9uIDA1LzAzLzE4
IDEyOjIwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4+Pj4+IE9uIDA1LjAzLjE4IGF0IDEwOjUw
LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2
L3NldHVwLmMKPiA+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwo+ID4+Pj4+IEBAIC0x
NzAxLDYgKzE3MDEsMTMgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWdu
ZWQgbG9uZyBtYmlfcCkKPiA+Pj4+PiAgICAgICAgICAgICBjcHVfaGFzX254ID8gWEVOTE9HX0lO
Rk8gOiBYRU5MT0dfV0FSTklORyAiV2FybmluZzogIiwKPiA+Pj4+PiAgICAgICAgICAgICBjcHVf
aGFzX254ID8gIiIgOiAibm90ICIpOwo+ID4+Pj4+ICAKPiA+Pj4+PiArCj4gPj4+Pj4gKyAgICBw
cmludGsoWEVOTE9HX0lORk8KPiA+Pj4+PiArICAgICAgICAgICAiUENJRCAoUHJvY2Vzcy1Db250
ZXh0IElEZW50aWZpZXIpICVzc3VwcG9ydGVkXG4iLAo+ID4+Pj4+ICsgICAgICAgICAgIGNwdV9o
YXNfcGNpZCA/ICIiIDogIm5vdCAiKTsKPiA+Pj4+PiArCj4gPj4+Pj4gKyAgICBwcmludGsoWEVO
TE9HX0lORk8gIklOVlBDSUQgJXNzdXBwb3J0ZWRcbiIsIGNwdV9oYXNfaW52cGNpZCA/ICIiIDog
Im5vdCAiKTsKPiA+Pj4+Cj4gPj4+PiBEbyB3ZSByZWFsbHkgbmVlZCB0aGlzPyBXZSBsb2cgYSBt
ZXNzYWdlIGZvciBOWCBhcyBhbiBleGNlcHRpb24sCj4gPj4+PiB3ZSBkb24ndCBkbyBzbyBmb3Ig
b3RoZXIgZmVhdHVyZXMgKGFuZCB0aGluZ3Mgd291bGQgZ2V0IHByZXR0eQo+ID4+Pj4gdW53aWVs
ZHkgaWYgd2UgZGlkKS4KPiA+Pj4KPiA+Pj4gSSdkIHJhdGhlciBrZWVwIHRoaXMgbWVzc2FnZS4g
QXMgd2UgYXJlIGhpZGluZyBQQ0lEIGFuZCBJTlBDSUQgZnJvbSBkb20wCj4gPj4+IHRoaXMgaXMg
dGhlIG9ubHkgaW5kaWNhdG9yIG9mIHRob3NlIGZlYXR1cmVzIGJlaW5nIHN1cHBvcnRlZC4gSW4g
Y2FzZSBvZgo+ID4+PiBhbiBlcnJvciByZWxhdGVkIHRvIFRMQiBjb25zaXN0ZW5jeSB0aGlzIGlu
Zm9ybWF0aW9uIGlzIGltcG9ydGFudCBJTU8uCj4gPj4gCj4gPj4gV2VsbCwgdGhpcyBhcmd1bWVu
dCB3b3VsZCBob2xkIGZvciBhbG1vc3QgZXZlcnkgb3RoZXIgYWR2YW5jZWQKPiA+PiBmZWF0dXJl
IHdlIHVzZS4KPiA+IAo+ID4gVGhlbiBJJ2Qgc3VnZ2VzdCB0byBlaXRoZXIgYWRkIGluZGl2aWR1
YWwgbWVzc2FnZXMgZm9yIHRob3NlIGZlYXR1cmVzIG9yCj4gPiB0byBoYXZlIGEgc2luZ2xlIG1l
c3NhZ2UgKG9yIGEgZmV3KSB0byBsaXN0IGFsbCBmZWF0dXJlcyBsaWtlIHRoZSBmbGFncwo+ID4g
aW4gL3Byb2MvY3B1aW5mby4gVGhpcyBsaXN0IGNvdWxkIGV2ZW4gYmUgcGFydCBvZiB0aGUgInhs
IGluZm8iIG91dHB1dC4KPiAKPiBJIGhhdmUgbm8gaWRlYSB3aGV0aGVyIHRoZXJlIGFyZSBwbGFu
cyB0byBtYWtlIHRoaXMgcGFydCBvZgo+ICJ4bCBpbmZvIiBvdXRwdXQ7IHhlbi1jcHVpZCBjZXJ0
YWlubHkgY2FuIHRlbGwgeW91Lgo+IAo+IFdlaSwgYnR3IC0gZm9yIHRoZSBjYXNlIG9mIHRoZXJl
IGJlaW5nIHByb2JsZW1zIHdpdGggdGhpcyBuZXcgdXNlCj4gb2YgSU5WUENJRCwgcGVyaGFwcyB5
b3Ugd2lsbCBhbHNvIHdhbnQgdG8gZXh0ZW5kIHBhcnNlX3hlbl9jcHVpZCgpCj4gc28gdGhhdCB0
aGUgdXNlIGNhbiBiZSBkaXNhYmxlZCBmcm9tIHRoZSBjb21tYW5kIGxpbmUuCj4gCgpOb3RlZC4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
