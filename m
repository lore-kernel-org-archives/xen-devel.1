From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/altp2m: Allow setting the #VE info page
 for an arbitrary VCPU
Date: Wed, 1 Aug 2018 10:29:21 +0100
Message-ID: <a58cc763-99b9-e41e-7765-9b421043ab66@citrix.com>
References: <20180725114915.26614-1-apop@bitdefender.com>
 <5B604D9C02000078001D96A6@prv1-mh.provo.novell.com>
 <CABfawhkaCVRrrBJ46U--b3odRztXcQ+_+VBebADAB-aF1uYJXg@mail.gmail.com>
 <5B616E0502000078001D9C0F@prv1-mh.provo.novell.com>
 <49660866-7bf2-f4c1-2320-e5e91b743596@citrix.com>
 <5B6179F702000078001D9C95@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bzmx=kq=citrix.com=prvs=744b97e16=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fknS4-0002zo-Bx
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 09:29:52 +0000
In-Reply-To: <5B6179F702000078001D9C95@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDgvMjAxOCAxMDoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDEuMDguMTgg
YXQgMTA6MzgsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMDEvMDgv
MjAxOCAwOToyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAzMS4wNy4xOCBhdCAxOTox
OSwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+Pj4+IE9uIFR1ZSwgSnVsIDMxLCAyMDE4
IGF0IDU6NTMgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+Pj4+
Pj4gT24gMjUuMDcuMTggYXQgMTM6NDksIDxhcG9wQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+
Pj4+PiAtICAgICAgICB2Y3B1X2FsdHAybShjdXJyKS52ZWluZm9fZ2ZuID0gX2dmbihhLnUuZW5h
YmxlX25vdGlmeS5nZm4pOwo+Pj4+Pj4gLSAgICAgICAgYWx0cDJtX3ZjcHVfdXBkYXRlX3ZtZnVu
Y192ZShjdXJyKTsKPj4+Pj4+ICsgICAgICAgIHZjcHVfYWx0cDJtKHYpLnZlaW5mb19nZm4gPSBf
Z2ZuKGEudS5lbmFibGVfbm90aWZ5Lmdmbik7Cj4+Pj4+PiArICAgICAgICBhbHRwMm1fdmNwdV91
cGRhdGVfdm1mdW5jX3ZlKHYpOwo+Pj4+PiBJJ2QgbGlrZSB5b3UgdG8gb3V0bGluZSBpbiB0aGUg
ZGVzY3JpcHRpb24gaG93IHlvdSBtZWFuIGFuIGV4dGVybmFsCj4+Pj4+IGFnZW50IHRvIGNvb3Jk
aW5hdGUgdGhlIHVzZSBvZiB0aGlzIEdGTiB3aXRoIHRoZSBndWVzdCAoYW5kIGluCj4+Pj4+IHBh
cnRpY3VsYXIgd2l0aG91dCBpbi1ndWVzdCBhZ2VudCkuCj4+Pj4gVXNpbmcgI1ZFIHdpdGhvdXQg
YW4gaW4tZ3Vlc3QgYWdlbnQgaXNuJ3QgcmVhbGx5IHBvc3NpYmxlIHNvIHRoaXMgaXMKPj4+PiBy
ZWFsbHkganVzdCBhYm91dCBkZXNpZ25hdGluZyB0aGUgcGFnZSBmcm9tIGRvbTAgaW5zdGVhZCBv
ZiBkb2luZyBpdAo+Pj4+IHdpdGggdGhlIGluLWd1ZXN0IGFnZW50LiBTb21ldGhpbmcgaGFzIHRv
IGJlIHByZXNlbnQgaW4gdGhlIGd1ZXN0IHRvCj4+Pj4gaGFuZGxlIHRoZSBuZXcgaW50ZXJydXB0
cyBjb21pbmcgZnJvbSAjVkUgYWZ0ZXIgYWxsLgo+Pj4gTm90IG5lY2Vzc2FyaWx5IC0gdGhlIGV4
Y2VwdGlvbiBjb3VsZCBhbHNvIGJlIGludGVyY2VwdGVkLCBhbmQgdGhlCj4+PiBleHRlcm5hbCBh
Z2VudCBiZSBpbmZvcm1lZCwgd2l0aCBpdCB0YWtpbmcgYXBwcm9wcmlhdGUgYWN0aW9uLgo+Pj4K
Pj4+IEFueXdheSAtIGlmIHN1Y2ggYSBkZXBlbmRlbmN5IGNvbnRpbnVlcyB0byBleGlzdCwgSSB0
aGluayBpdCB3b3VsZAo+Pj4gYmUgZGVzaXJhYmxlIHRvIG1lbnRpb24gaXQgaW4gdGhlIGRlc2Ny
aXB0aW9uLgo+PiBBbnkgc2V0dXAgd2hpY2ggaW50ZXJjZXB0cyAjVkUgZGVmZWF0cyB0aGUgZW50
aXJlIHB1cnBvc2Ugb2YgdXNpbmcgI1ZFCj4+IGluIHRoZSBmaXJzdCBwbGFjZS4KPiBNb3N0bHks
IEkgYWdyZWUsIGJ1dCAiZW50aXJlIj8gWW91IG5ldmVyIGtub3cgaG93IGNyZWF0aXZlIHBlb3Bs
ZQo+IGdldCwgYW5kIGhvdyBzZWVpbmcgI1ZFIG1pZ2h0IGJldHRlciBmaXQgdGhlaXIgcHVycG9z
ZSB0aGFuIG90aGVyCj4gIm5vdGlmaWNhdGlvbiIgbWVjaGFuaXNtcy4KCkl0IGlzIGVpdGhlciAj
VkUsIG9yIEVQVF9WSU9MQVRJT04gKGFzIHRoYXQgaXMgbGl0ZXJhbGx5IHRoZSBkZWZpbml0aW9u
Cm9mIGhvdyAjVkUgZ2V0cyByYWlzZWQpLgoKV2l0aCB0aGUgbGF0dGVyLCB5b3UgZ2V0IHNldmVy
YWwgVk1DUyBmaWVsZHMgZmlsbGVkIGluIGZvciB5b3UuwqAgRm9yIHRoZQpmb3JtZXIsIHlvdSd2
ZSBnb3QgdG8gZmluZCB0aGUgZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzcyB3aGljaCB0aGUKcHJvY2Vz
c29yIGR1bXBlZCB0aGUgc2FtZSBpbmZvcm1hdGlvbiBpbnRvLgoKSSB0aGluayBJJ2xsIHNhZmVs
eSBzdGljayB3aXRoIG15ICJlbnRpcmUiIGhlcmUuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
