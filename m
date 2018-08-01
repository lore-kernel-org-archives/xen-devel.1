From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/altp2m: Allow setting the #VE info page
 for an arbitrary VCPU
Date: Wed, 1 Aug 2018 09:38:19 +0100
Message-ID: <49660866-7bf2-f4c1-2320-e5e91b743596@citrix.com>
References: <20180725114915.26614-1-apop@bitdefender.com>
 <5B604D9C02000078001D96A6@prv1-mh.provo.novell.com>
 <CABfawhkaCVRrrBJ46U--b3odRztXcQ+_+VBebADAB-aF1uYJXg@mail.gmail.com>
 <5B616E0502000078001D9C0F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bzmx=kq=citrix.com=prvs=744b97e16=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fkmeE-0006Gb-Bq
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 08:38:22 +0000
In-Reply-To: <5B616E0502000078001D9C0F@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: Sergej Proskurin <proskurin@sec.in.tum.de>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Adrian Pop <apop@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDgvMjAxOCAwOToyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzEuMDcuMTgg
YXQgMTk6MTksIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90ZToKPj4gT24gVHVlLCBKdWwgMzEs
IDIwMTggYXQgNTo1MyBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+
Pj4+Pj4gT24gMjUuMDcuMTggYXQgMTM6NDksIDxhcG9wQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6
Cj4+Pj4gLSAgICAgICAgdmNwdV9hbHRwMm0oY3VycikudmVpbmZvX2dmbiA9IF9nZm4oYS51LmVu
YWJsZV9ub3RpZnkuZ2ZuKTsKPj4+PiAtICAgICAgICBhbHRwMm1fdmNwdV91cGRhdGVfdm1mdW5j
X3ZlKGN1cnIpOwo+Pj4+ICsgICAgICAgIHZjcHVfYWx0cDJtKHYpLnZlaW5mb19nZm4gPSBfZ2Zu
KGEudS5lbmFibGVfbm90aWZ5Lmdmbik7Cj4+Pj4gKyAgICAgICAgYWx0cDJtX3ZjcHVfdXBkYXRl
X3ZtZnVuY192ZSh2KTsKPj4+IEknZCBsaWtlIHlvdSB0byBvdXRsaW5lIGluIHRoZSBkZXNjcmlw
dGlvbiBob3cgeW91IG1lYW4gYW4gZXh0ZXJuYWwKPj4+IGFnZW50IHRvIGNvb3JkaW5hdGUgdGhl
IHVzZSBvZiB0aGlzIEdGTiB3aXRoIHRoZSBndWVzdCAoYW5kIGluCj4+PiBwYXJ0aWN1bGFyIHdp
dGhvdXQgaW4tZ3Vlc3QgYWdlbnQpLgo+PiBVc2luZyAjVkUgd2l0aG91dCBhbiBpbi1ndWVzdCBh
Z2VudCBpc24ndCByZWFsbHkgcG9zc2libGUgc28gdGhpcyBpcwo+PiByZWFsbHkganVzdCBhYm91
dCBkZXNpZ25hdGluZyB0aGUgcGFnZSBmcm9tIGRvbTAgaW5zdGVhZCBvZiBkb2luZyBpdAo+PiB3
aXRoIHRoZSBpbi1ndWVzdCBhZ2VudC4gU29tZXRoaW5nIGhhcyB0byBiZSBwcmVzZW50IGluIHRo
ZSBndWVzdCB0bwo+PiBoYW5kbGUgdGhlIG5ldyBpbnRlcnJ1cHRzIGNvbWluZyBmcm9tICNWRSBh
ZnRlciBhbGwuCj4gTm90IG5lY2Vzc2FyaWx5IC0gdGhlIGV4Y2VwdGlvbiBjb3VsZCBhbHNvIGJl
IGludGVyY2VwdGVkLCBhbmQgdGhlCj4gZXh0ZXJuYWwgYWdlbnQgYmUgaW5mb3JtZWQsIHdpdGgg
aXQgdGFraW5nIGFwcHJvcHJpYXRlIGFjdGlvbi4KPgo+IEFueXdheSAtIGlmIHN1Y2ggYSBkZXBl
bmRlbmN5IGNvbnRpbnVlcyB0byBleGlzdCwgSSB0aGluayBpdCB3b3VsZAo+IGJlIGRlc2lyYWJs
ZSB0byBtZW50aW9uIGl0IGluIHRoZSBkZXNjcmlwdGlvbi4KCkFueSBzZXR1cCB3aGljaCBpbnRl
cmNlcHRzICNWRSBkZWZlYXRzIHRoZSBlbnRpcmUgcHVycG9zZSBvZiB1c2luZyAjVkUKaW4gdGhl
IGZpcnN0IHBsYWNlLgoKV2UnbGwgZXZlbnR1YWxseSBoYXZlIHRvIGNvcGUgd2l0aCB0aGlzIHNp
dHVhdGlvbiBiZWNhdXNlIGl0cyBub3Qgb25lIHdlCmNhbiBhcmNoaXRlY3R1cmFsbHkgcnVsZSBv
dXQgKGVzcGVjaWFsbHkgd2l0aCBuZXN0ZWQgdmlydCBpbiB0aGUgbWl4KSwKYnV0IGludGVyY2Vw
dGluZyAjVkUgaXMgbm90IHNvbWV0aGluZyB3ZSBzaG91bGQgbWFrZSBhdmFpbGFibGUgYXMgYQp1
c2VyLWF2YWlsYWJsZSBvcHRpb24uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
