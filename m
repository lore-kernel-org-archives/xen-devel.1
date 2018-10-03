From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: Ping: [PATCH] x86: improve vCPU selection in
 pagetable_dying()
Date: Wed, 3 Oct 2018 17:56:06 +0100
Message-ID: <6f305020-9b75-c1a8-7f55-2b1d5926aaf4@citrix.com>
References: <5B96796B02000078001E6CF4@prv1-mh.provo.novell.com>
 <5BA0F33302000078001E9717@prv1-mh.provo.novell.com>
 <15752d56-8300-698d-085a-6795bd75f634@citrix.com>
 <5BAB2F6202000078001EBF97@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gwq3=mp=citrix.com=prvs=8070b5427=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g7kRX-0007yq-E9
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 16:56:11 +0000
In-Reply-To: <5BAB2F6202000078001EBF97@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMjYvMjAxOCAwODowNCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjUuMDku
MTggYXQgMTg6MjIsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTgv
MDkvMTggMTM6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTAuMDkuMTggYXQgMTY6
MDIsIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4+Pj4gUmF0aGVyIHRoYW4gdW5jb25kaXRp
b25hbGx5IHVzaW5nIHZDUFUgMCwgdXNlIHRoZSBjdXJyZW50IHZDUFUgaWYgdGhlCj4+Pj4gc3Vi
amVjdCBkb21haW4gaXMgdGhlIGN1cnJlbnQgb25lLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+PiBXaGF0IGltcHJvdmVtZW50IGlz
IHRoaXMgaW50ZW5kZWQgdG8gYnJpbmc/Cj4gCj4gSSd2ZSBjb21lIGFjcm9zcyB0aGlzIHF1aXRl
IGEgd2hpbGUgYWdvIHdoZW4gaW52ZXN0aWdhdGluZyBwb3NzaWJseQo+IGRhbmdlcm91cyB1c2Vz
IG9mIGQtPnZjcHVbXSwgd2VsbCBiZWZvcmUgeW91ciBzZXJpZXMgdG8gaW1wcm92ZSB0aGUKPiBz
aXR1YXRpb24gdGhlcmUuIEkgZ2VuZXJhbGx5IGNvbnNpZGVyIGl0IHdyb25nIHRvIGhhcmQgY29k
ZSB1c2Ugb2YKPiBkLT52Y3B1WzBdIHdoZW5ldmVyIGl0IGNhbiBiZSBhdm9pZGVkLgo+IAo+PiBT
aGFkb3dzIGFyZSBwZXItZG9tYWluLCBhbmQgdGhlIGdtZm4gaW4gcXVlc3Rpb24gaXMgcGFzc2Vk
IGluIGJ5IHRoZQo+PiBjYWxsZXIuICBBRkFDSVQsIGl0IGlzIGEgbG9naWNhbCBidWcgdGhhdCB0
aGF0IHRoZSBjYWxsYmFjayB0YWtlcyBhIHZjcHUKPj4gcmF0aGVyIHRoYW4gYSBkb21haW4gaW4g
dGhlIGZpcnN0IHBsYWNlLgo+IAo+IERpZCB5b3UgbG9vayBhdCB0aGUgMy1sZXZlbCB2YXJpYW50
IG9mIHNoX3BhZ2V0YWJsZV9keWluZygpPyBJdCB2ZXJ5Cj4gY2xlYXJseSByZWFkcyB0aGUgZ2l2
ZW4gdkNQVSdzIENSMy4KClllczsgYW5kIHNvIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIHdo
aWNoIHVuY29uZGl0aW9uYWxseSBwYXNzZXMgdmNwdQowIGlzIGNsZWFybHkgYSBidWcuCgo+IExv
b2tpbmcgYXQgdGhpbmdzIGFnYWluIChpbiBwYXJ0aWN1bGFyCj4gdGhlIGNvbW1lbnQgYWhlYWQg
b2YgcGFnZXRhYmxlX2R5aW5nKCkpIEkgbm93IGFjdHVhbGx5IHdvbmRlciB3aHkKPiBIVk1PUF9w
YWdldGFibGVfZHlpbmcgaXMgcGVybWl0dGVkIHRvIGJlIGNhbGxlZCBieSBvdGhlciB0aGFuIGEg
ZG9tYWluCj4gZm9yIGl0c2VsZi4gVGhlcmUncyBubyB1c2Ugb2YgaXQgaW4gdGhlIHRvb2wgc3Rh
Y2suIERpc2FsbG93aW5nIHRoZSB1bnVzZWQKPiBjYXNlIHdvdWxkIG1lYW4gdGhlIGZhc3QtcGF0
aCBsb2dpYyBpbiBzaF9wYWdldGFibGVfZHlpbmcoKSBjb3VsZAo+IGJlY29tZSB0aGUgb25seSB2
YWxpZC9pbXBsZW1lbnRlZCBjYXNlLiBUaW0/CgpOb3Qgc28gLS0gYSBndWVzdCBjb3VsZCBzdGls
bCBjYWxsIHBhZ2V0YWJsZV9keWluZygpIG9uIHRoZSB0b3AgbGV2ZWwgUFQKb2YgYSBwcm9jZXNz
IG5vdCBjdXJyZW50bHkgcnVubmluZy4KCkkgd291bGQgYmUgdG90YWxseSBpbiBmYXZvciBvZiBs
aW1pdGluZyB0aGlzIGNhbGwgdG8gdGhlIGd1ZXN0IGl0c2VsZiwKaG93ZXZlciAtLSB0aGF0IHdv
dWxkIHNpbXBsaWZ5IHRoZSBsb2dpYyBldmVuIG1vcmUuCgogIC1HZW9yZ2UKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
