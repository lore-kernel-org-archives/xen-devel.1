From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/altp2m: Allow setting the #VE info page
 for an arbitrary VCPU
Date: Wed, 01 Aug 2018 03:14:31 -0600
Message-ID: <5B6179F702000078001D9C95@prv1-mh.provo.novell.com>
References: <20180725114915.26614-1-apop@bitdefender.com>
 <5B604D9C02000078001D96A6@prv1-mh.provo.novell.com>
 <CABfawhkaCVRrrBJ46U--b3odRztXcQ+_+VBebADAB-aF1uYJXg@mail.gmail.com>
 <5B616E0502000078001D9C0F@prv1-mh.provo.novell.com>
 <49660866-7bf2-f4c1-2320-e5e91b743596@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qz6i=kq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fknDH-0001Vg-EM
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 09:14:35 +0000
In-Reply-To: <49660866-7bf2-f4c1-2320-e5e91b743596@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA4LjE4IGF0IDEwOjM4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDEvMDgvMjAxOCAwOToyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDMx
LjA3LjE4IGF0IDE5OjE5LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4+PiBPbiBUdWUs
IEp1bCAzMSwgMjAxOCBhdCA1OjUzIEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4g
d3JvdGU6Cj4+Pj4+Pj4gT24gMjUuMDcuMTggYXQgMTM6NDksIDxhcG9wQGJpdGRlZmVuZGVyLmNv
bT4gd3JvdGU6Cj4+Pj4+IC0gICAgICAgIHZjcHVfYWx0cDJtKGN1cnIpLnZlaW5mb19nZm4gPSBf
Z2ZuKGEudS5lbmFibGVfbm90aWZ5Lmdmbik7Cj4+Pj4+IC0gICAgICAgIGFsdHAybV92Y3B1X3Vw
ZGF0ZV92bWZ1bmNfdmUoY3Vycik7Cj4+Pj4+ICsgICAgICAgIHZjcHVfYWx0cDJtKHYpLnZlaW5m
b19nZm4gPSBfZ2ZuKGEudS5lbmFibGVfbm90aWZ5Lmdmbik7Cj4+Pj4+ICsgICAgICAgIGFsdHAy
bV92Y3B1X3VwZGF0ZV92bWZ1bmNfdmUodik7Cj4+Pj4gSSdkIGxpa2UgeW91IHRvIG91dGxpbmUg
aW4gdGhlIGRlc2NyaXB0aW9uIGhvdyB5b3UgbWVhbiBhbiBleHRlcm5hbAo+Pj4+IGFnZW50IHRv
IGNvb3JkaW5hdGUgdGhlIHVzZSBvZiB0aGlzIEdGTiB3aXRoIHRoZSBndWVzdCAoYW5kIGluCj4+
Pj4gcGFydGljdWxhciB3aXRob3V0IGluLWd1ZXN0IGFnZW50KS4KPj4+IFVzaW5nICNWRSB3aXRo
b3V0IGFuIGluLWd1ZXN0IGFnZW50IGlzbid0IHJlYWxseSBwb3NzaWJsZSBzbyB0aGlzIGlzCj4+
PiByZWFsbHkganVzdCBhYm91dCBkZXNpZ25hdGluZyB0aGUgcGFnZSBmcm9tIGRvbTAgaW5zdGVh
ZCBvZiBkb2luZyBpdAo+Pj4gd2l0aCB0aGUgaW4tZ3Vlc3QgYWdlbnQuIFNvbWV0aGluZyBoYXMg
dG8gYmUgcHJlc2VudCBpbiB0aGUgZ3Vlc3QgdG8KPj4+IGhhbmRsZSB0aGUgbmV3IGludGVycnVw
dHMgY29taW5nIGZyb20gI1ZFIGFmdGVyIGFsbC4KPj4gTm90IG5lY2Vzc2FyaWx5IC0gdGhlIGV4
Y2VwdGlvbiBjb3VsZCBhbHNvIGJlIGludGVyY2VwdGVkLCBhbmQgdGhlCj4+IGV4dGVybmFsIGFn
ZW50IGJlIGluZm9ybWVkLCB3aXRoIGl0IHRha2luZyBhcHByb3ByaWF0ZSBhY3Rpb24uCj4+Cj4+
IEFueXdheSAtIGlmIHN1Y2ggYSBkZXBlbmRlbmN5IGNvbnRpbnVlcyB0byBleGlzdCwgSSB0aGlu
ayBpdCB3b3VsZAo+PiBiZSBkZXNpcmFibGUgdG8gbWVudGlvbiBpdCBpbiB0aGUgZGVzY3JpcHRp
b24uCj4gCj4gQW55IHNldHVwIHdoaWNoIGludGVyY2VwdHMgI1ZFIGRlZmVhdHMgdGhlIGVudGly
ZSBwdXJwb3NlIG9mIHVzaW5nICNWRQo+IGluIHRoZSBmaXJzdCBwbGFjZS4KCk1vc3RseSwgSSBh
Z3JlZSwgYnV0ICJlbnRpcmUiPyBZb3UgbmV2ZXIga25vdyBob3cgY3JlYXRpdmUgcGVvcGxlCmdl
dCwgYW5kIGhvdyBzZWVpbmcgI1ZFIG1pZ2h0IGJldHRlciBmaXQgdGhlaXIgcHVycG9zZSB0aGFu
IG90aGVyCiJub3RpZmljYXRpb24iIG1lY2hhbmlzbXMuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
